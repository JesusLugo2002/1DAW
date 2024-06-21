from __future__ import annotations

from cards import Card, Hand
from roles import Player, Dealer


class Game:
    @staticmethod
    def show_visual_game(get_winner_method):
        def wrapper(players: list[Player], cs: list[Card], pc: list[list[Card]]):
            result = get_winner_method(players, cs, pc)
            game_table = f"""
┌─═════════════════════════════════─┐
│   {repr(players[0]):10}{repr(pc[0][0]):2}{repr(pc[0][1]):20}│
│                                   │
│                                   │
│                      Winner       │
│    {repr(cs[0]):2}{repr(cs[1]):2}{repr(cs[2]):2}{repr(cs[3]):2}{repr(cs[4]):23}│
│                   ★ {result[0]} ★    │
│                                   │
│                                   │
│   {repr(players[1]):10}{repr(pc[1][0]):2}{repr(pc[1][1]):20}│
└─═════════════════════════════════─┘
"""
            print(game_table)
            return result

        return wrapper

    def get_winner(players: list[Player], common_cards: list[Card], private_cards: list[list[Card]]) -> tuple[Player | None, Hand]:
        """ Pasos a realizar para determinar el ganador:
        1. Se crea el Dealer del juego pasando los jugadores del mismo.
        2. Los jugadores reciben las cartas comunitarias.
        3. Los jugadores reciben las cartas privadas.
        4. El Dealer solicita las mejores manos de cada jugador.
        5. El Dealer determina, de las mejores manos, la ganadora si la hay, o declara empate.
        """
        dealer = Dealer(players)
        Player.recieve_common_card(common_cards)
        for player, cards in zip(players, private_cards):
            player.recieve_private_card(cards)
        players_best_hands = dealer.request_best_hands()
        return dealer.get_winner_hand(*players_best_hands)
