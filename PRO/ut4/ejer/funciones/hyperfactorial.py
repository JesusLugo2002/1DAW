# **************
# HIPERFACTORIAL
# **************


def hyperfactorial(n: int) -> int:
    return 1 if n <= 1 else (n**n) * hyperfactorial(n - 1)
