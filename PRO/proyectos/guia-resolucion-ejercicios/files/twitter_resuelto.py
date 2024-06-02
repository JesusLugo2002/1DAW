from __future__ import annotations

import re
import sqlite3

DB_PATH = 'twitter.db'

TWEET_EMOJI = '🐦'
RETWEET_EMOJI = '🔁'
MAX_TWEET_LENGTH = 280


def create_db(db_path: str = DB_PATH) -> None:
    """Crea la base de datos y las siguientes tablas:
    - user (id, username, password, bio)
    - tweet (id, content, user_id, retweet_from)
        └ user_id es clave ajena de user(id)
        └ retweet_from es clave ajena de tweet(id)"""
    # 1. Creamos conexión a base de datos
    con = sqlite3.connect(db_path)
    cur = con.cursor()
    # 2. Creamos tablas y confirmamos
    sql = """CREATE TABLE user (
        id INTEGER PRIMARY KEY,
        username TEXT,
        password TEXT,
        bio TEXT);
        CREATE TABLE tweet(
        id INTEGER PRIMARY KEY,
        content TEXT,
        user_id INTEGER REFERENCES user(id),
        retweet_from INTEGER REFERENCES tweet(id))"""
    cur.executescript(sql)
    con.commit()
    # 3. Cerramos conexión
    con.close()


class User:
    def __init__(self, username: str, password: str, bio: str = '', user_id: int = 0):
        """Constructor de la clase User.
        - Crea los atributos con y cur para la conexión a la base de datos (con factoría Row).
        - Crea los atributos username, password, bio, id y logged.
        """
        # 1. Creamos conexión, cursor y factoría row
        self.con = sqlite3.connect(DB_PATH)
        self.con.row_factory = sqlite3.Row
        self.cur = self.con.cursor()
        # 2. Creamos atributos de instancia del User
        self.username = username
        self.password = password
        self.bio = bio
        self.id = user_id
        self.logged = False

    def save(self) -> None:
        """Guarda en la base de datos un objeto de tipo User.
        Además actualiza el atributo "id" del objeto a partir de lo que devuelve la inserción."""
        # 1. Insertamos en la base de datos la información del usuario
        sql = 'INSERT INTO user (username, password, bio) VALUES (?, ?, ?)'
        data = (self.username, self.password, self.bio)
        self.cur.execute(sql, data)
        self.con.commit()
        # 2. Actualizamos el atributo id del usuario (self.id) con la id devuelta por la inserción (cur.lastrowid)
        self.id = self.cur.lastrowid

    def login(self, password: str) -> None:
        """Realiza el login del usuario.
        Comprueba si existe este usuario con el password pasado por parámetro en la BBDD
        y actualiza los atributos correspondientes."""
        # 1. Se busca un registro del usuario actual con la contraseña pasada en la BBDD
        sql = 'SELECT id FROM user WHERE username = ? AND password = ?'
        data = (self.username, password)
        # 2. Si hay un registro, logged = True, sino, logged = False
        self.logged = self.cur.execute(sql, data).fetchone() is not None

    def tweet(self, content: str) -> Tweet:
        """Crea un tweet con el contenido indicado y lo almacena en la base de datos.
        - Utiliza el método save propio de la clase Tweet.
        - Hay que retornar el tweet creado.
        - Si el usuario no está logeado hay que lanzar una excepción de tipo TwitterError
        con el mensaje: User <usuario> is not logged in!
        - Si el tweet supera el límite de caracteres hay que lanzar una excepción de tipo
        TwitterError con el mensaje: Tweet hasta more than 280 chars!"""
        # 1. Si el usuario no está logeado, lanza excepción
        if not self.logged:
            raise TwitterError(f'User {self.username} is not logged in!')
        # 2. Si el contenido del tweet supera los 280 caracteres, lanza excepción
        if len(content) > 280:
            raise TwitterError('Tweet has more than 280 chars!')
        # 3. Si no hay errores a este punto, crea un Tweet con el contenido pasado
        new_tweet = Tweet(content)
        # 4. Guarda ese Tweet en su BBDD (Método save del propio Tweet)
        new_tweet.save(self)
        # 5. Retorna el Tweet creado
        return new_tweet

    def retweet(self, tweet_id: int) -> Tweet:
        """Crea un retweet con el contenido indicado y lo almacena en la base de datos.
        - Utiliza el método save propio de la clase Tweet.
        - Hay que retornar el tweet creado.
        - Si el usuario no está logeado hay que lanzar una excepción de tipo TwitterError
        con el mensaje: User <usuario> is not logged in!
        - Si tweet_id no existe en la base de datos hay que lanzar una excepción de tipo
        TwitterError con el mensaje: Tweet with id <id> does not exist!"""
        # 1. Si el usuario no está logeado, lanza excepción
        if not self.logged:
            raise TwitterError(f'User {self.username} is not logged in!')
        # 2. Si la id del Tweet no existe en la BBDD (Consulta SELECT == None), lanza excepción
        sql = 'SELECT id FROM tweet WHERE id = ?'
        if self.cur.execute(sql, (tweet_id,)).fetchone() is None:
            raise TwitterError(f'Tweet with id {tweet_id} does not exist!')
        # 3. Extraemos el contenido del Tweet original
        sql = 'SELECT * FROM tweet WHERE id = ?'
        retweet_content = self.cur.execute(sql, (tweet_id,)).fetchone()['content']
        # 4. Creamos retweet (un Tweet cuyo 'retweet_from' es igual al id del Tweet original y su contenido es de el mismo tweet)
        new_retweet = Tweet(retweet_content, tweet_id)
        # 5. Guardamos retweet en la BBDD
        new_retweet.save(self)
        # 6. Retornamos retweet
        return new_retweet

    @property
    def tweets(self):
        """Función generadora que devuelve todos los tweets propios del usuario.
        - Lo que se devuelven son objetos de tipo Tweet (usar el método from_db_row)."""
        # 1. Seleccionamos todos los tweets del usuario
        sql = 'SELECT * FROM tweet WHERE user_id = ?'
        # 2. Por cada registro de la consulta
        for row in self.cur.execute(sql, (self.id,)):
            # 3. Yield de un Tweet construido con un registro (el método from_db_row lo crea)
            yield Tweet.from_db_row(row)

    def __repr__(self):
        """Representa un usuario con el formato:
        <usuario>: <bio>"""
        # No hace falta explicar esta mamada
        return f'{self.username}: {self.bio}'

    @classmethod
    def from_db_row(cls, row: sqlite3.Row):
        """Crea un objeto de tipo User a partir de una fila de consulta SQL"""
        # 1. Desempaquetamos la información de una fila dada
        id, username, password, bio = row
        # 2. Retornamos un usuario nuevo con la información de la fila desempaquetada
        return User(username, password, bio, id)


class Tweet:
    def __init__(self, content: str = '', retweet_from: int = 0, tweet_id: int = 0):
        """Constructor de la clase Tweet.
        - Crea los atributos con y cur para la conexión a la base de datos (con factoría Row)
        - Crea los atributos _content, retweet_from e id.
        - retweet_from indica el id del tweet que se retuitea.
          Un id válido debe ser mayor o igual que 1.
        - Si es un retweet el contenido debe ser la cadena vacía.
        """
        # 1. Creamos conexión, cursor y factoría row
        self.con = sqlite3.connect(DB_PATH)
        self.con.row_factory = sqlite3.Row
        self.cur = self.con.cursor()
        # 2. Creamos atributos de Tweet
        self.retweet_from = retweet_from
        self.id = tweet_id
        # 2.1. Si es un retweet, el contenido es cadena vacía, sino, es el content pasado por parámetro
        self._content = '' if self.is_retweet else content

    @property
    def is_retweet(self) -> bool:
        """Indica si el tweet es un retweet."""
        # Tampoco explicaré esta mamada
        return self.retweet_from > 0

    @property
    def content(self) -> str:
        """Devuelve el contenido del tweet.
        - Si es un retweet el contenido habrá que buscarlo en el tweet retuiteado."""
        # 1. Si es un retweet, el contenido a devolver es el del Tweet original (se encuentra en la BBDD)
        if self.is_retweet:
            sql = 'SELECT * FROM tweet WHERE id = ?'
            result = self.cur.execute(sql, (self.retweet_from,)).fetchone()['content']
        # 2. Si no, el contenido a devolver es el del mismo objeto
        else:
            result = self._content
        # 3. Retornamos resultado
        return result
    
    def save(self, user: User) -> None:
        """Guarda el tweet en la base de datos.
        - El parámetro user es el usuario que escribe el tweet.
        Además actualiza el atributo "id" del objeto a partir de lo que devuelve la inserción."""
        # 1. Insertamos en la BBDD la información del Tweet
        sql = 'INSERT INTO tweet (content, user_id, retweet_from) VALUES (?, ?, ?)'
        data = (self._content, user.id, self.retweet_from)
        self.cur.execute(sql, data)
        self.con.commit()
        # 2. Actualizamos la id del objeto con la id devuelta por la inserción
        self.id = self.cur.lastrowid

    def __repr__(self):
        """Representa un tweet con el formato:
        <emoji> <content> (id=<id>)"""
        # 1. Si el tweet es un retweet, el emoji es RETWEET_EMOJI, sino TWEET_EMOJI
        emoji = RETWEET_EMOJI if self.is_retweet else TWEET_EMOJI
        return f'{emoji} {self.content} (id={self.id})'

    @classmethod
    def from_db_row(cls, row: sqlite3.Row) -> Tweet:
        """Crea un objeto de tipo Tweet a partir de una fila de consulta SQL"""
        # 1. Desempaquetamos la información de la fila dada (otra forma de hacerlo)
        content = row['content']
        retweet_from = row['retweet_from']
        id = row['id']
        # 2. Retornamos un Tweet nuevo con la información de la fila desempaquetada
        return Tweet(content, retweet_from, id)


class Twitter:
    def __init__(self):
        """Constructor de la clase Twitter.
        - Crea los atributos con y cur para la conexión a la base de datos (con factoría Row)
        """
        # 1. Creamos conexión, factoría row y cursor
        self.con = sqlite3.connect(DB_PATH)
        self.con.row_factory = sqlite3.Row
        self.cur = self.con.cursor()

    def add_user(self, username: str, password: str, bio: str = '') -> User:
        """Crea un objeto de tipo User y lo guarda en la base de datos.
        - Haz uso de los métodos ya creados.
        - Hay que retornar el objeto creado.
        - La contraseña debe seguir el siguiente formato:
          * Empezar con una arroba o un signo igual.
          * Continuar con 2, 3 o 4 dígitos.
          * Continuar con 2, 3 o 4 letras de la A-Z (incluyendo minúsculas).
          * Terminar con una exclamación o un asterisco.
        Si no sigue este formato hay que elevar una excepción de tipo TwitterError
        con el mensaje: Password does not follow security rules!"""
        # Si la contraseña no cumple este patrón, lanza excepción
        password_pattern = r'[@=]\d{2,4}[a-z]{2,4}[!*]'
        if not re.fullmatch(password_pattern, password, re.I):
            raise TwitterError('Password does not follow security rules!')
        # 1. Se crea usuario con la información pasada por parámetros
        new_user = User(username, password, bio)
        # 2. Se guarda usuario en su BBDD (con su propio método 'save')
        new_user.save()
        # 3. Retornamos el nuevo usuario
        return new_user

    def get_user(self, user_id: int) -> User:
        """Devuelve el usuario con el user_id indicado.
        Si el usuario no existe hay elevar una excepción de tipo TwitterError con el mensaje:
        User with id <id> does not exist!"""
        # 1. Retornamos usuario a partir de la fila indicada por el user_id
        sql = 'SELECT * FROM user WHERE id = ?'
        if match := self.cur.execute(sql, (user_id,)).fetchone():
            return User.from_db_row(match)
        # Si el usuario no existe (no hay registros en la BBDD con su id), lanza excepción
        raise TwitterError(f'User with id {user_id} does not exist!')


class TwitterError(Exception):
    # 1. Creamos la excepción: ya se saben esta mamada
    def __init__(self, message=''):
        err_info = message
        super().__init__(err_info)
