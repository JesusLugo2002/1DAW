import pytest

from login import SocialNetwork

@pytest.fixture
def social_network():
    return SocialNetwork()

def test_login(social_network: SocialNetwork):
    social_network.create_account("juanito@hotmail.com", "elmasbonito123")
    assert social_network.login("juanito@hotmail.com", "elmasbonito123")

def test_failed_login(social_network: SocialNetwork):
    social_network.create_account("marianita@yahoo.net", "1234abcd")
    assert not social_network.login("marianita@yahoo.net", "abcd1234")