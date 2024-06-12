# Guia de resolución de ejercicios

<div align=center>
    <img src="../../../images/bg2.gif" width="60%" alt="bg"/>
</div>
<br>

<div align=justify>

Esto lo hago meramente con el motivo de plantear un método para solucionar los ejercicios que se nos presenten (o al menos es el que hago yo internamente) con el fin de ayudar a quien se vea un poco complicado con, __no tanto el tema de la sintaxis o el uso de funciones en Python, sino con la implementación de los mismos; la lógica que debe tomarse para solucionar problemas de programación.__

Por lo que no me detendré a explicar cosas como, por ejemplo, _el módulo sqlite3 tiene el método execute() que sirve para..._, para eso tienen los apuntes del Sergio. Aquí plantearé un método para solucionar ejercicios abarcándolo totalmente.

Para estas explicaciones, estaré tomando como base el ejercicio [twitter.py de AprendePython](./files/twitter_base.py).
<br>

## Contenido

- [Paso 1 - Identificación de métodos y clases](#paso-1---identificación-de-métodos-y-clases)
- [Paso 2 - Priorizar métodos y clases](#paso-2---priorizar-métodos-y-clases)
- [Paso 3 - Resolución de un método](#paso-3---resolución-de-un-método)
- [Resolución de todos los métodos](#resolución-de-todos-los-métodos)
- [Paso 4 - Refactorización](#paso-4---refactorización)

## Paso 1 - Identificación de métodos y clases

Lo primero que nos encontraremos al abrir un fichero de ejercicio es que se estructura en métodos y clases (o puede que no, pero eso será para otro tipo de ejercicios). Lo mejor que podremos hacer en primera instancia es identificarlas desde un principio. Pueden anotarlos en un fichero aparte, dibujarlos en una hoja o simplemente no hacer nada, depende de lo lioso que pueda ser.

En [twitter.py](./files/twitter.py) podemos encontrarnos con:

- __Métodos externos__ (métodos que no están dentro de una clase):
    1. create_db
- __Clase User:__
    1. __init__
    2. save
    3. login
    4. tweet
    5. retweet
    6. property: tweets
    7. __repr__
    8. classmethod: from_db_row
- __Clase Tweet:__
    1. __init__
    2. property: is_retweet
    3. property: content
    4. save
    5. __repr__
    6. classmethod: from_db_row
- __Clase Twitter:__
    1. __init__
    2. add_user
    3. get_user
- __Clase TwitterError(Exception):__
    1. __init__

<br>
Ya con esta lista (escrita a un lado o interiorizada) podemos empezar a trabajar de forma ordenada.

## Paso 2 - Priorizar métodos y clases

Normalmente el hacer una parte del código antes que otra depende, valga la redundacia, en las dependencias que existan. Puede haber, por ejemplo, un constructor que lance excepciones en caso de errores, por lo que en este caso se priorizaría crear la excepción antes que el constructor, ya que sin ella, el constructor no estaría terminado del todo.

Por lo general sería:
1. Métodos externos a clases
2. Excepciones
3. El resto de las clases con sus métodos

Por lo que según este orden, la lista que creamos previamente se ordenaría de la siguiente forma:

- __Métodos externos__ (métodos que no están dentro de una clase):
    1. create_db
- __Clase TwitterError(Exception):__
    1. __init__
- __Clase User:__
    1. __init__
    2. save
    3. login
    4. tweet
    5. retweet
    6. property: tweets
    7. __repr__
    8. classmethod: from_db_row
- __Clase Tweet:__
    1. __init__
    2. property: is_retweet
    3. property: content
    4. save
    5. __repr__
    6. classmethod: from_db_row
- __Clase Twitter:__
    1. __init__
    2. add_user
    3. get_user

## Paso 3 - Resolución de un método

> [!NOTE]
> Cada método puede verse como una acción, y esa acción está destinada a resolver un problema. Por lo general, según el paradigma de la programación orientada a objetos, se debe diseñar de esa forma: un método soluciona un problema, no diez, por lo que es mal visto crear un método, ejemplo, __get_winner__ que realice 10 cosas complejas distintas, sino dividir ese método en 10 métodos distintos.

Ahora, cuando nos encontremos un problema, estructuramos los pasos para resolver ese problema en el método que vayamos a trabajar. En este caso, empezaremos con el método externo __create_db__:

```py
def create_db(db_path: str = DB_PATH) -> None:
    """Crea la base de datos y las siguientes tablas:
    - user (id, username, password, bio)
    - tweet (id, content, user_id, retweet_from)
        └ user_id es clave ajena de user(id)
        └ retweet_from es clave ajena de tweet(id)"""
    pass
```

Este caso es sencillo de identificar, la acción a realizar es __crear una base de datos__, que ademas contengan __dos tablas: user y tweet__. Dividimos estos pasos en un lenguaje _no programático_ (no sé si existe esa definición, sino, coman mondá).


```py
def create_db(db_path: str = DB_PATH) -> None:
    """Crea la base de datos y las siguientes tablas:
    - user (id, username, password, bio)
    - tweet (id, content, user_id, retweet_from)
        └ user_id es clave ajena de user(id)
        └ retweet_from es clave ajena de tweet(id)"""

    # 1. Crear base de datos (abrir conexión)
    # 2. Crear tabla "user"
    # 3. Crear tabla "tweet"
    # 4. Cerrar conexión
    pass
```

Ahora que tenemos claros los pasos que debe cumplir el método, empezamos a reemplazarlos con código funcional que realicen esos pasos:

1. __Crear base de datos__:
```py
# Creamos la conexión con la base de datos
con = sqlite3.connection(db_path) 
# Creamos el cursor correspondiente a la base de datos
cur = con.cursor() 
```

2. __Crear tabla "user"__:
```py
# Sentencia SQL para crear la tabla
sql = '''CREATE TABLE user (
    id INTEGER PRIMARY KEY,
    username TEXT,
    password TEXT,
    bio TEXT
)'''
# Aplicamos SQL y confirmamos
cur.execute.(sql)
con.commit()
```

2. __Crear tabla "tweet"__:
```py
# Sentencia SQL para crear la tabla
sql = '''CREATE TABLE tweet(
    id INTEGER PRIMARY KEY,
    content TEXT,
    user_id INTEGER REFERENCES user(id),
    retweet_from INTEGER REFERENCES tweet(id))
)'''
# Aplicamos SQL y confirmamos
cur.execute.(sql)
con.commit()
```

Uniendo todos estos pasos, reemplazando nuestra guía de pasos, quedaría el método __create_db__ en:

```py
def create_db(db_path: str = DB_PATH) -> None:
    """Crea la base de datos y las siguientes tablas:
    - user (id, username, password, bio)
    - tweet (id, content, user_id, retweet_from)
        └ user_id es clave ajena de user(id)
        └ retweet_from es clave ajena de tweet(id)"""
    # 1. Crear base de datos
    con = sqlite3.connection(db_path)
    cur = con.cursor()
    # 2. Crear tabla "user"
    sql = '''CREATE TABLE user (
    id INTEGER PRIMARY KEY,
    username TEXT,
    password TEXT,
    bio TEXT)'''
    cur.execute.(sql)
    con.commit()
    # 3. Crear tabla "tweet"
    sql = '''CREATE TABLE tweet(
    id INTEGER PRIMARY KEY,
    content TEXT,
    user_id INTEGER REFERENCES user(id),
    retweet_from INTEGER REFERENCES tweet(id)))'''
    cur.execute.(sql)
    con.commit()
    # 4. Cerrar conexión
    con.close()
```

Ya con esto tenemos creado el método __create_db__. Obviamente es mejorable pero, por el momento, prefiero (cuestión personal) dejarlo así para después mejorar en la parte de [refactorización](#paso-4---refactorización).

## Resolución de todos los métodos

A continuación estarán los métodos del ejercicios resueltos usando esta forma que propongo:

### Clase TwitterError(Exception)

Las excepciones son fáciles pues, por lo general, solo nos preocuparemos de su método constructor:

```py
class TwitterError(Exception):
    def __init__(self, message=''):
        err_info = message
        super().__init__(err_info)
```

### Clase User

Aquí empezamos con la primera clase: __User__. Por lo que se lee, esta clase representa un usuario de Twitter.

#### Método constructor

```py
    def __init__(self, username: str, password: str, bio: str = '', user_id: int = 0):
        """Constructor de la clase User.
        - Crea los atributos con y cur para la conexión a la base de datos (con factoría Row).
        - Crea los atributos username, password, bio, id y logged.
        """
        # 1. Crear conexión con base de datos y factoría Row
        self.con = sqlite3.connect(DB_PATH)
        self.con.row_factory = sqlite3.Row
        self.cur = self.con.cursor()
        # 2. Crear los atributos de instancia
        self.username = username
        self.password = password
        self.bio = bio
        self.id = user_id
        self.logged = False
```

#### Método 'save'
```py
    def save(self) -> None:
        """Guarda en la base de datos un objeto de tipo User.
        Además actualiza el atributo "id" del objeto a partir de lo que devuelve la inserción."""
        # 1. Guardar en la base de datos el objeto (hacer una inserción)
        sql = 'INSERT INTO user (username, password, bio) VALUES (?, ?, ?)'
        data = (self.username, self.password, self.bio)
        self.cur.execute(sql, data)
        self.con.commit()
        # 2. Actualizar el id del objeto (self.id) a partir de la id devuelta por la inserción (cur.lastrowid)
        self.id = self.cur.lastrowid
```

#### Método 'login'
```py
    def login(self, password: str) -> None:
        """Realiza el login del usuario.
        Comprueba si existe este usuario con el password pasado por parámetro en la BBDD
        y actualiza los atributos correspondientes."""
        # 1. Comprobar si el usuario existe (en la base de datos) con la contraseña pasada 
        sql = 'SELECT id FROM user WHERE username = ? AND password = ?'
        data = (self.username, password)
        # Si existe, devolverá una fila, sino, devolverá None
        if self.cur.execute(sql, data).fetchone() is not None
            self.logged = True
        else:
            self.logged = False
```

#### Método 'tweet'

Para este punto, leeremos que se usarán métodos de la clase Tweet, por lo que nos saltamos este método, leyendo el resto, hasta encontrar otros que no hagan uso de la clase Tweet para continuar con User; luego de que terminemos Tweet nos preocuparemos con User de nuevo.

```py
    def tweet(self, content: str) -> Tweet:
        """Crea un tweet con el contenido indicado y lo almacena en la base de datos.
        - Utiliza el método save propio de la clase Tweet.
        - Hay que retornar el tweet creado.
        - Si el usuario no está logeado hay que lanzar una excepción de tipo TwitterError
        con el mensaje: User <usuario> is not logged in!
        - Si el tweet supera el límite de caracteres hay que lanzar una excepción de tipo
        TwitterError con el mensaje: Tweet hasta more than 280 chars!"""
        pass
```

#### Método mágico __repr__
No hay explicación para este: es muy sencillo.
```py
    def __repr__(self):
        """Representa un usuario con el formato:
        <usuario>: <bio>"""
        return f'{self.username}: {self.bio}'
```

#### Método de clase 'from_db_row'
```py
    @classmethod
    def from_db_row(cls, row: sqlite3.Row):
        """Crea un objeto de tipo User a partir de una fila de consulta SQL"""
        # 1. Desempaquetar la información de la fila
        # La tabla va ordenada de esta forma: | id | username | password | bio |
        id, username, password, bio = row
        # 2. Devolver el User creado con esa información (posicionar bien los argumentos)
        return User(username, password, bio, id)
```

### Clase Tweet

Empezamos con la programación de la clase Tweet:

#### Método constructor
```py
    def __init__(self, content: str = '', retweet_from: int = 0, tweet_id: int = 0):
        """Constructor de la clase Tweet.
        - Crea los atributos con y cur para la conexión a la base de datos (con factoría Row)
        - Crea los atributos _content, retweet_from e id.
        - retweet_from indica el id del tweet que se retuitea.
          Un id válido debe ser mayor o igual que 1.
        - Si es un retweet el contenido debe ser la cadena vacía.
        """
        # 1. Crear conexion con base de datos, con la factoría row
        self.con = sqlite3.connect(DB_PATH)
        self.con.row_factory = sqlite3.Row
        self.cur = self.con.cursor()
        # 2. Crear los atributos (no limitarse a crear los atributos en el orden que Sergio los da; pueden hacer los más sencillos primero y dejar luego los que dependen de requisitos)
        self.retweet_from = retweet_from
        self.id = tweet_id
        # Para el '_content', si es un retweet (retweet_from > 0), el contenido será cadena vacía
        if self.retweet_from > 0:
            self._content = ''
        # Si no, será el 'content' pasado por parametro.
        else:
            self._content = content
```

#### Property 'is_retweet'
```py
    @property
    def is_retweet(self) -> bool:
        """Indica si el tweet es un retweet."""
        return self.retweet_from > 0
```

#### Property 'content'
```py
    @property
    def content(self) -> str:
        """Devuelve el contenido del tweet.
        - Si es un retweet el contenido habrá que buscarlo en el tweet retuiteado."""
        # Si es un retweet, el contenido a retornar debe ser del tweet original (retweet_from del retweet == id del tweet)
        if self.is_retweet:
            sql = 'SELECT * FROM tweet WHERE id = ?'
            result = self.cur.execute(sql, (self.retweet_from,)).fetchone()['content']
        # Si no, el contenido a retornar es el de sí mismo.
        else:
            result = self._content
        return result
```

### Clase Twitter

Como no haré todos los métodos (los pueden encontrar de todas formas en [twitter_resuelto.py](./files/twitter_resuelto.py)), saltaré a esta clase Twitter con su método __add_user__ porque me parece interesante de abarcar.

#### Método __add_user__

```py
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
        # 1. Error "Si la contraseña es inválida"
        # Para ello, debe seguir un patrón regexp.
        password_pattern = r'[@=]\d{2,4}[a-z]{2,4}[!*]'
        if not re.fullmatch(password_pattern, password, re.I):
            raise TwitterError('Password does not follow security rules!')
        # 2. Creamos objeto User con la información pasada
        new_user = User(username, password, bio)
        # 3. Guardamos el User creado en la base de datos (con su método save())
        new_user.save()
        # 4. Retornamos el User creado
        return new_user
```

## Paso 4 - Refactorización

Ya luego de que terminemos la base de nuestro ejercicio resuelto (con los tests cumplidos), lo ideal es hacer una o dos pasadas de lecturas para mejorar partes de nuestro código, el cual puede verse como __crear métodos para realizar acciones que se repitan__ o __reemplazar partes del código directamente__ con el fin de hacerlo más entendible y/u optimizado. Algunos ejemplos de refactorización de los métodos que ya hicimos en esta guía es:

### Método externo 'create_db':

```py
def create_db(db_path: str = DB_PATH) -> None:
    """Crea la base de datos y las siguientes tablas:
    - user (id, username, password, bio)
    - tweet (id, content, user_id, retweet_from)
        └ user_id es clave ajena de user(id)
        └ retweet_from es clave ajena de tweet(id)"""
    con = sqlite3.connection(db_path)
    cur = con.cursor()
    sql = '''CREATE TABLE user (
    id INTEGER PRIMARY KEY,
    username TEXT,
    password TEXT,
    bio TEXT)'''
    cur.execute.(sql)
    con.commit()
    sql = '''CREATE TABLE tweet(
    id INTEGER PRIMARY KEY,
    content TEXT,
    user_id INTEGER REFERENCES user(id),
    retweet_from INTEGER REFERENCES tweet(id)))'''
    cur.execute.(sql)
    con.commit()
    con.close()
```

Ya cuando vemos repeticiones o patrones en el código podemos sospechar que puede ser refactorizado: en este caso, vemos como se hace dos veces un __sentencia SQL, ejecución y commit__. Para mejorar este código podemos reemplazar los __execute()__ por __executescript()__, pues recordemos que este método de sqlite3 permite ejecutar varias instrucciones, a diferencia del anterior.
```py
def create_db(db_path: str = DB_PATH) -> None:
    """Crea la base de datos y las siguientes tablas:
    - user (id, username, password, bio)
    - tweet (id, content, user_id, retweet_from)
        └ user_id es clave ajena de user(id)
        └ retweet_from es clave ajena de tweet(id)"""
    con = sqlite3.connect(db_path)
    cur = con.cursor()
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
    con.close()
```

### Método 'login' de la clase 'User'

```py
    def login(self, password: str) -> None:
        """Realiza el login del usuario.
        Comprueba si existe este usuario con el password pasado por parámetro en la BBDD
        y actualiza los atributos correspondientes."""
        sql = 'SELECT id FROM user WHERE username = ? AND password = ?'
        data = (self.username, password)
        if self.cur.execute(sql, data).fetchone() is not None
            self.logged = True
        else:
            self.logged = False
```

En este caso, `self.logged` almacena valores booleanos que dependerán de __una comprobación booleana__ `self.cur.execute(sql, data).fetchone() is not None`. Podemos aprovechar que __una comprobación booleana, devolverá un valor booleano__ para actualizar directamente `self.logged` con ello, resumiendo el código en:
```py
    def login(self, password: str) -> None:
        """Realiza el login del usuario.
        Comprueba si existe este usuario con el password pasado por parámetro en la BBDD
        y actualiza los atributos correspondientes."""
        sql = 'SELECT id FROM user WHERE username = ? AND password = ?'
        data = (self.username, password)
        self.logged = self.cur.execute(sql, data).fetchone() is not None
```

### Método constructor de la clase 'Tweet'

```py
    def __init__(self, content: str = '', retweet_from: int = 0, tweet_id: int = 0):
        """Constructor de la clase Tweet.
        - Crea los atributos con y cur para la conexión a la base de datos (con factoría Row)
        - Crea los atributos _content, retweet_from e id.
        - retweet_from indica el id del tweet que se retuitea.
          Un id válido debe ser mayor o igual que 1.
        - Si es un retweet el contenido debe ser la cadena vacía.
        """
        self.con = sqlite3.connect(DB_PATH)
        self.con.row_factory = sqlite3.Row
        self.cur = self.con.cursor()
        self.retweet_from = retweet_from
        self.id = tweet_id
        if self.retweet_from > 0:
            self._content = ''
        else:
            self._content = content
```

Acá hay dos cambios importantes: podemos resumir la creación de `self._content` en una linea:

```py
self._content = '' if self.retweet_from > 0 else content
```

Y además, la comprobación `self.retweet_from > 0` es exactamente igual a la _property_ creada después del método constructor:

```py
    @property
    def is_retweet(self) -> bool:
        """Indica si el tweet es un retweet."""
        return self.retweet_from > 0
```

Por lo que puede reemplazar esa comprobación con la property y el código terminaría mejorado en:

```py
    def __init__(self, content: str = '', retweet_from: int = 0, tweet_id: int = 0):
        """Constructor de la clase Tweet.
        - Crea los atributos con y cur para la conexión a la base de datos (con factoría Row)
        - Crea los atributos _content, retweet_from e id.
        - retweet_from indica el id del tweet que se retuitea.
          Un id válido debe ser mayor o igual que 1.
        - Si es un retweet el contenido debe ser la cadena vacía.
        """
        self.con = sqlite3.connect(DB_PATH)
        self.con.row_factory = sqlite3.Row
        self.cur = self.con.cursor()
        self.retweet_from = retweet_from
        self.id = tweet_id
        self._content = '' if self.is_retweet else content
```

## Fin de esta mondá

A ver, en el fichero [twitter_resuelto.py](./files/twitter_resuelto.py) tienen la solución (bueno, la mía), del ejercicio entero, con comentarios colocados a modo de aplicar el método que propongo para resolver los ejercicios.

Cuidense, beban agua y suerte con el examen! <3

<div align=center>
    <img src="../../../images/patricio.gif" width="60%" alt="adios"/>
</div>

</div>
