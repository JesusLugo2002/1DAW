from __future__ import annotations


class Date:
    DAYS_BY_MONTH = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)

    def __init__(self, day: int, month: int, year: int):
        """Validar día, mes y año. Se comprobará si la fecha es correcta
        (entre el 1-1-1900 y el 31-12-2050); si el día no es correcto, lo pondrá a 1;
        si el mes no es correcto, lo pondrá a 1; y si el año no es correcto, lo pondrá a 1900.
        Ojo con los años bisiestos.
        El 1-1-1900 fue lunes.
        """
        self.day = day if 1 <= day <= 31 else 1
        self.month = month if 1 <= month <= 12 else 1
        self.year = year if 1900 <= year <= 2050 else 1900

    @staticmethod
    def is_leap_year(year: int) -> bool:
        return year % 4 == 0

    @staticmethod
    def days_in_month(month: int, year: int) -> int:
        if month == 2 and Date.is_leap_year(year):
            return 29
        return Date.DAYS_BY_MONTH[month - 1]

    def get_delta_days(self) -> int:
        """Número de días transcurridos desde el 1-1-1900 hasta la fecha"""
        OFFSET = 1
        MINIMAL_YEAR = 1900
        result = 0
        for year in range(MINIMAL_YEAR, self.year + OFFSET):
            if year != self.year:
                for month in range(OFFSET, 12 + OFFSET):
                    result += Date.days_in_month(month, year)
            else:
                for month in range(OFFSET, self.month + OFFSET):
                    if month != self.month:
                        result += Date.days_in_month(month, year)
                    else:
                        result += self.day
        return result

    @property
    def weekday(self) -> int:
        """Día de la semana de la fecha (0 para domingo, ..., 6 para sábado)."""
        pass

    @property
    def is_weekend(self) -> bool:
        pass

    @property
    def short_date(self) -> str:
        """02/09/2003"""
        return f'{self.day:02}/{self.month:02}/{self.year}'

    def __str__(self):
        """MARTES 2 DE SEPTIEMBRE DE 2003"""
        pass

    def __add__(self, days: int) -> Date:
        """Sumar un número de días a la fecha"""
        pass

    def __sub__(self, other: Date | int) -> int | Date:
        """Dos opciones:
        1) Restar una fecha a otra fecha -> Número de días
        2) Restar un número de días la fecha -> Nueva fecha"""
        pass

    def __lt__(self, other) -> bool:
        pass

    def __gt__(self, other) -> bool:
        pass

    def __eq__(self, other) -> bool:
        pass
