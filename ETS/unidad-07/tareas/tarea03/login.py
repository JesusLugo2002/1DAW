class SocialNetwork:
    def __init__(self):
        self.accounts = {}
        self.current_online_accounts = 0
        
    def create_account(self, username: str, password: str) -> None:
        self.accounts[username] = password
    
    def login(self, username: str, password: str) -> bool:
        if username in self.accounts:
            return password == self.accounts.get(username)
        return False