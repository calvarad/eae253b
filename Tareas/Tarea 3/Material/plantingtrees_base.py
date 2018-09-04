# codigo base para https://open.kattis.com/problems/plantingtrees

import sys


def solve(times):
    '''
    Input: una lista de enteros, cada uno representando t_i (según problema)

    Esta funcion debe retornar un entero, que corresponde
    al número de días mínimo en que se puede organizar la fiesta

    '''

    return dia_minimo

if __name__ == "__main__":
    tokens = sys.stdin.read().strip().split()

    n = int(tokens.pop(0))

    times = [int(t) for t in tokens]
    assert len(times) == n

    print(solve(times))