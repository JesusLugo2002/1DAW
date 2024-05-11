from __future__ import annotations


class DNA:
    ADENINE = 'A'
    CYTOSINE = 'C'
    GUANINE = 'G'
    THYMINE = 'T'
    BASES_ORDER = (ADENINE, CYTOSINE, GUANINE, THYMINE)

    def __init__(self, sequence: str):
        self.sequence = sequence

    def __str__(self):
        return f'{self.sequence}'

    @property
    def adenines(self) -> int:
        """Número de adeninas de la secuencia de ADN"""
        return self.sequence.count(DNA.ADENINE)

    @property
    def cytosines(self) -> int:
        """Número de citosinas de la secuencia de ADN"""
        return self.sequence.count(DNA.CYTOSINE)

    @property
    def guanines(self) -> int:
        """Número de guaninas de la secuencia de ADN"""
        return self.sequence.count(DNA.GUANINE)

    @property
    def thymines(self) -> int:
        """Número de timinas de la secuencia de ADN"""
        return self.sequence.count(DNA.THYMINE)

    def __add__(self, other: DNA) -> DNA:
        """Se define la suma de dos secuencias de ADN como el máximo de cada base nitrogenada
        (base a base). Por ejemplo 'T' sería mayor que 'A'.
        Si las secuencias no tienen la misma longitud, habrá que aplicar el máximo base a base
        hasta donde se pueda, y completar el resto de la secuencia con la parte que falte, bien
        de la primera o bien de la segunda secuencia, en función de cuál sea mayor.
        """
        result = ''
        if len(self.sequence) > len(other.sequence):
            longer_sequence = self.sequence
            shorter_sequence = other.sequence
        else:
            longer_sequence = other.sequence
            shorter_sequence = self.sequence
        for base_a, base_b in zip(self.sequence, other.sequence):
            result += (
                base_a if DNA.BASES_ORDER.index(base_a) >= DNA.BASES_ORDER.index(base_b) else base_b
            )
        result += longer_sequence[len(shorter_sequence) :]
        return DNA(result)

    def __len__(self):
        """Longitud de la secuencia de ADN"""
        return len(self.sequence)

    def stats(self) -> dict[str, float]:
        """Porcentaje de aparición de cada base con respecto al total.
        Se devuelve un diccionario donde la clave será la base nitrogenada
        y el valor será el porcentaje."""
        return {
            DNA.ADENINE: (self.adenines / len(self.sequence)) * 100,
            DNA.CYTOSINE: (self.cytosines / len(self.sequence)) * 100,
            DNA.GUANINE: (self.guanines / len(self.sequence)) * 100,
            DNA.THYMINE: (self.thymines / len(self.sequence)) * 100,
        }

    def __mul__(self, other: DNA) -> DNA:
        """Se define la multiplicación de dos secuencias de ADN como una nueva cadena
        de ADN donde aparecen las bases que son iguales (posición a posición)"""
        new_sequence = ''.join(
            (base for base, other_base in zip(self.sequence, other.sequence) if base == other_base)
        )
        return DNA(new_sequence)

    @classmethod
    def build_from_file(cls, path: str) -> DNA:
        """Construye una secuencia de ADN a partir de un fichero.
        El formato del fichero es tener una única línea con todas las bases
        una detrás de otra."""
        file_content = open(path).readline()
        return DNA(file_content)

    def dump_to_file(self, path: str) -> None:
        """Vuelca una secuencia de ADN a un fichero de salida.
        El formato del fichero es tener una única línea con todas las bases
        una detrás de otra."""
        with open(path, "w") as file:
            file.write(f'{self.sequence}')

    def __getitem__(self, index: int) -> str:
        """Devuelve la base que ocupa la posición 'index'"""
        return self.sequence[index]

    def __setitem__(self, index: int, base: str) -> None:
        """Fija la base 'base' en la posición 'index'"""
        if base not in (DNA.ADENINE, DNA.CYTOSINE, DNA.GUANINE, DNA.THYMINE):
            base = DNA.ADENINE
        new_sequence = self.sequence[:index] + base + self.sequence[index:]
        self.sequence = new_sequence
