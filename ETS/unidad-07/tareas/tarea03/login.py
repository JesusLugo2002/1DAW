def login(username: str, password: str) -> bool:
    CORRECT_USERNAME = 'jesuslugo2002'
    CORRECT_PASSWORD = 'trikitrakatelas'
    return all(username == CORRECT_USERNAME, password == CORRECT_PASSWORD)