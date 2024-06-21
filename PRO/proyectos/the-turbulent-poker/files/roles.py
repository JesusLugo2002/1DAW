from __future__ import annotations

from cards import Card, Deck, Hand
from helpers import combinations, shuffle


class Player:
    common_cards = []

    def __init__(self, name: str) -> None:
        self.name = name
        self.private_cards = []

    @classmethod
    def recieve_common_card(cls, card: Card | list[Card]) -> None:
        """Recibe una carta o una lista de cartas para las cartas comunitarias del juego"""
        if isinstance(card, list):
            cls.common_cards = card
        else:
            cls.common_cards.append(card)

    def recieve_private_card(self, card: Card) -> None:
        """Recibe una carta o una lista de cartas para las cartas privadas del jugador"""
        if isinstance(card, list):
            self.private_cards = card
        else:
            self.private_cards.append(card)

    def get_best_hand(self) -> Hand:
        """Del total de cartas (privadas + comunitarias), extrae la mejor combinación"""
        all_cards = self.private_cards + Player.common_cards
        all_combinations = combinations(all_cards, n=5)
        best_hand = Hand(*next(all_combinations))
        for current_combination in all_combinations:
            current_hand = Hand(*current_combination)
            if current_hand > best_hand:
                best_hand = current_hand
        return best_hand

    def __repr__(self) -> str:
        return self.name


class Dealer:
    def __init__(self, players: list[Player]) -> None:
        self.players = players
        self.deck = Deck()

    @staticmethod
    def shuffle_deck(method):
        """Decorador que habilita el barajeo de las cartas antes de una acción"""

        def wrapper(self, *args, **kwargs):
            shuffle(self.deck)
            return method(self, *args, **kwargs)

        return wrapper

    def deal_card(self) -> Card:
        """Devuelve la primera carta del mazo"""
        return self.deck.pop(0)

    @shuffle_deck
    def deal_common_cards(self) -> None:
        """Reparte las cartas comunitarias"""
        NUM_CARDS = 5
        for _ in range(NUM_CARDS):
            Player.recieve_common_card(self.deal_card())

    @shuffle_deck
    def deal_private_cards(self) -> None:
        """Reparte las cartas privadas a todos los jugadores"""
        NUM_CARDS = 2
        for _ in range(NUM_CARDS):
            for player in self.players:
                player.recieve_private_card(self.deal_card())

    def request_best_hands(self) -> tuple[Player, Hand]:
        """Consigue, por parte de los jugadores, sus mejores manos junto al nombre del jugador"""
        players_hands = [(player, player.get_best_hand()) for player in self.players]
        return tuple(players_hands)

    def get_winner_hand(self, *players_hands: tuple[Player, Hand]) -> tuple[Player | None, Hand]:
        """Devuelve, de entre varias manos, la mano ganadora y el nombre del jugador (o None, si hay empate)"""
        p1_hand, p2_hand = players_hands
        print(p1_hand, p2_hand)
        if p1_hand[1] == p2_hand[1]:
            return None, p1_hand[1]
        return max(players_hands, key=lambda h: h[1])
