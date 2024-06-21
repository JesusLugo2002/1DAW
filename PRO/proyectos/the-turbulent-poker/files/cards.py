from __future__ import annotations

from helpers import shuffle


def load_card_glyphs() -> dict[str, str]:
    """Carga los glifos de cards.dat en un diccionario"""
    glyphs = {}
    with open('cards.dat') as file:
        for line in file:
            glyphs[line[0]] = line[2:].replace(',', '').strip()
    return glyphs


class Card:
    RANKS = ('2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A')
    SUITS = ('♣', '❤', '◆', '♠')
    GLYPHS = load_card_glyphs()

    def __init__(self, card: str) -> None:
        if len(card) == 2:
            self.rank, self.suit = card[0], card[1]
        else:
            self.rank, self.suit = card[:2], card[2]

    @property
    def cmp_value(self) -> int:
        """Devuelve valor para realizar comparaciones"""
        return Card.RANKS.index(self.rank)

    def __gt__(self, other: Card) -> bool:
        return self.cmp_value > other.cmp_value

    def __lt__(self, other: Card) -> bool:
        return self.cmp_value < other.cmp_value

    def __eq__(self, other) -> bool:
        return self.cmp_value == other.cmp_value

    def __repr__(self) -> str:
        return Card.GLYPHS[self.suit][self.cmp_value]


class Deck:
    def __init__(self) -> None:
        self.cards = [Card(rank + suit) for rank in Card.RANKS for suit in Card.SUITS]

    def pop(self, index: int) -> Card:
        """Da la primera carta del mazo"""
        return self.cards.pop(index)

    def get_random_card(self) -> Card:
        """Devuelve una carta aleatoria de un mazo independiente"""
        deck_copy = self.cards.copy()
        shuffle(deck_copy)
        return deck_copy.pop(0)

    def __len__(self) -> int:
        return len(self.cards)

    def __setitem__(self, index: int, item: Card) -> None:
        self.cards[index] = item

    def __getitem__(self, index: int) -> Card:
        return self.cards[index]

    def __iter__(self):
        for card in self.cards:
            yield card


class Hand:
    HIGH_CARD = 0
    ONE_PAIR = 1
    TWO_PAIR = 2
    THREE_OF_A_KIND = 3
    STRAIGHT = 4
    FLUSH = 5
    FULL_HOUSE = 6
    FOUR_OF_A_KIND = 7
    STRAIGHT_FLUSH = 8

    def __init__(self, *cards: Card) -> None:
        self.cards = sorted(cards)
        self.ranks_ratio = self.get_ranks_ratio()
        self.cat, self.cat_rank = self.get_category_rank()

    def get_ranks_ratio(self) -> dict[str, int]:
        """Devuelve un diccionario con el ratio de aparición de los ranks"""
        result = {}
        for card in self.cards:
            if card.rank in result:
                result[card.rank] = result.get(card.rank) + 1
            else:
                result[card.rank] = 1
        return result

    def is_straight_flush(self) -> tuple[int, str] | None:
        if self.is_straight() is not None and self.is_flush() is not None:
            return Hand.STRAIGHT_FLUSH, self.highest_value.rank
        return None

    def is_four_of_a_kind(self) -> tuple[int, str] | None:
        if 4 in self.ranks_ratio.values():
            for rank, ratio in self.ranks_ratio.items():
                if ratio == 4:
                    return Hand.FOUR_OF_A_KIND, rank
        return None

    def is_full_house(self) -> tuple[int, tuple[str, str]] | None:
        def get_full_house_ranks(self) -> tuple[str, str]:
            """Retorna tupla con el trío + duo de cartas de un Full House"""
            ranks_ratio = sorted(self.ranks_ratio.items(), key=lambda k: k[1], reverse=True)
            three_rank = ranks_ratio[0][0]
            duo_rank = ranks_ratio[1][0]
            return three_rank, duo_rank

        if 3 in self.ranks_ratio.values() and 2 in self.ranks_ratio.values():
            return Hand.FULL_HOUSE, get_full_house_ranks(self)
        return None

    def is_flush(self) -> tuple[int, str] | None:
        for index, current_card in enumerate(self.cards[1:]):
            previous_card = self.cards[index]
            if previous_card.suit != current_card.suit:
                return None
        return Hand.FLUSH, self.highest_value.rank

    def is_straight(self) -> tuple[int, str] | None:
        for index, current_card in enumerate(self[1:]):
            previous_card = self[index]
            if previous_card.cmp_value != current_card.cmp_value - 1:
                return None
        return Hand.STRAIGHT, self.highest_value.rank

    def is_three_of_a_kind(self) -> tuple[int, str] | None:
        if 3 in self.ranks_ratio.values():
            for rank, ratio in self.ranks_ratio.items():
                if ratio == 3:
                    return Hand.THREE_OF_A_KIND, rank
        return None

    def is_two_pair(self) -> tuple[int, tuple[str, str]] | None:
        def get_two_pair_ranks(self) -> tuple[str, str]:
            """Devuelve tupla con el par más valioso y menos valioso en orden"""
            ranks = [k for k, v in self.ranks_ratio.items() if v == 2]
            ranks = sorted(ranks, key=lambda k: Card.RANKS.index(k), reverse=True)
            higher_pair, lower_pair = ranks
            return higher_pair, lower_pair

        ranks_ratio = list(self.ranks_ratio.values())
        if ranks_ratio.count(2) == 2:
            return Hand.TWO_PAIR, get_two_pair_ranks(self)
        return None

    def is_one_pair(self) -> tuple[int, str] | None:
        if 2 in self.ranks_ratio.values():
            for rank, ratio in self.ranks_ratio.items():
                if ratio == 2:
                    return Hand.ONE_PAIR, rank
        return None

    def is_high_card(self) -> tuple[int, str]:
        return Hand.HIGH_CARD, self.highest_value.rank

    def get_category_rank(self) -> tuple[int, str | tuple[str, str]]:
        """Devuelve categoría y cat_rank de la mano"""
        if match := self.is_straight_flush():
            return match
        if match := self.is_four_of_a_kind():
            return match
        if match := self.is_full_house():
            return match
        if match := self.is_flush():
            return match
        if match := self.is_straight():
            return match
        if match := self.is_three_of_a_kind():
            return match
        if match := self.is_two_pair():
            return match
        if match := self.is_one_pair():
            return match
        return self.is_high_card()

    @property
    def highest_value(self) -> Card:
        """Retorna la carta de mayor valor de la mano"""
        return max(self.cards)

    def __contains__(self, other: Card) -> bool:
        return other in self.cards

    def __gt__(self, other: Hand) -> bool:
        """
        Pasos al calcular:
        1. Por categoría
        2. Por cat_rank
        3. Todas las cartas
        """
        # Primer paso (por su categoría)
        if self.cat > other.cat:
            return True
        if self.cat < other.cat:
            return False
        # Segundo paso (por su category_rank)
        if isinstance(self.cat_rank, str):
            if Card.RANKS.index(self.cat_rank) > Card.RANKS.index(other.cat_rank):
                return True
            if Card.RANKS.index(self.cat_rank) < Card.RANKS.index(other.cat_rank):
                return False
        else:
            s_values = sorted([Card.RANKS.index(s_rank) for s_rank in self.cat_rank])
            o_values = sorted([Card.RANKS.index(o_rank) for o_rank in other.cat_rank])
            for s_value, o_value in zip(s_values, o_values):
                if s_value > o_value:
                    return True
                if s_value < o_value:
                    return False
        # Tercer paso (por todas las cartas)
        for s_card, o_card in zip(reversed(self), reversed(other)):
            print(s_card, o_card)
            if s_card > o_card:
                return True
            if s_card < o_card:
                return False
        return False

    def __eq__(self, other) -> bool:
        return all(s_card == o_card for s_card, o_card in zip(self, other))

    def __len__(self) -> int:
        return len(self.cards)

    def __getitem__(self, index: int):
        return self.cards[index]

    def __iter__(self):
        for card in self.cards:
            yield card

    def __repr__(self) -> str:
        return repr(self.cards)
