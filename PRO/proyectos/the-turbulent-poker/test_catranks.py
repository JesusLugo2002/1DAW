import pytest
from cards import Hand, Card, Deck

@pytest.fixture
def highest_card_hand():
    return Hand(Card('A◆'), Card('J❤'), Card('9♠'), Card('8♣'), Card('7♣'))

@pytest.fixture
def one_pair_hand():
    return Hand(Card('4◆'), Card('4♣'), Card('Q♠'), Card('7♠'), Card('5♠'))

@pytest.fixture
def two_pair_hand():
    return Hand(Card('10♣'), Card('10❤'), Card('8❤'), Card('8♣'), Card('A◆'))

@pytest.fixture
def another_two_pair_hand():
    return Hand(Card('Q♣'), Card('Q❤'), Card('5❤'), Card('5♣'), Card('J◆'))

@pytest.fixture
def three_of_kind_hand():
    return Hand(Card('K♠'), Card('K◆'), Card('K❤'), Card('9♠'), Card('8◆'))

@pytest.fixture
def straight_hand():
    return Hand(Card('9◆'), Card('8♠'), Card('7♣'), Card('6♠'), Card('5❤'))

@pytest.fixture
def flush_hand():
    return Hand(Card('K◆'), Card('9◆'), Card('8◆'), Card('5◆'), Card('2◆'))

@pytest.fixture
def full_house_hand():
    return Hand(Card('Q❤'), Card('Q♠'), Card('Q◆'), Card('4♣'), Card('4◆'))

@pytest.fixture
def another_full_house_hand():
    return Hand(Card('K❤'), Card('K♠'), Card('J◆'), Card('J♣'), Card('J◆'))

@pytest.fixture
def straight_flush_hand():
    return Hand(Card('10♣'), Card('9♣'), Card('8♣'), Card('7♣'), Card('6♣'))

def test_high_card(highest_card_hand: Hand):
    assert highest_card_hand.cat == Hand.HIGH_CARD
    assert highest_card_hand.cat_rank == 'A'

def test_one_pair(one_pair_hand: Hand):
    assert one_pair_hand.cat == Hand.ONE_PAIR
    assert one_pair_hand.cat_rank == 'Q'

def test_two_pair(two_pair_hand: Hand):
    assert two_pair_hand.cat == Hand.TWO_PAIR
    assert two_pair_hand.cat_rank == ('10', '8')

def test_three_of_kind(three_of_kind_hand: Hand):
    assert three_of_kind_hand.cat == Hand.THREE_OF_A_KIND
    assert three_of_kind_hand.cat_rank == 'K'  

def test_straight(straight_hand: Hand):
    assert straight_hand.cat == Hand.STRAIGHT
    assert straight_hand.cat_rank == '9'

def test_flush(flush_hand: Hand):
    assert flush_hand.cat == Hand.FLUSH
    assert flush_hand.cat_rank == 'K'

def test_full_house(full_house_hand: Hand):
    assert full_house_hand.cat == Hand.FULL_HOUSE
    assert full_house_hand.cat_rank == ('Q', '4') 

def test_straight_flush(straight_flush_hand: Hand):
    assert straight_flush_hand.cat == Hand.STRAIGHT_FLUSH
    assert straight_flush_hand.cat_rank == '10'

def test_max_from_hands(one_pair_hand, three_of_kind_hand, straight_hand):
    assert max(one_pair_hand, three_of_kind_hand, straight_hand) == straight_hand

def test_max_from_hands_with_equal_full_houses(full_house_hand, another_full_house_hand):
    assert max(full_house_hand, another_full_house_hand) == another_full_house_hand

def test_max_from_hands_with_equal_two_pair(two_pair_hand, another_two_pair_hand):
    assert max(two_pair_hand, another_two_pair_hand) == two_pair_hand