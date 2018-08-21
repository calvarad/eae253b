# Estructura de código para resolver problema de Kattis
# https://open.kattis.com/problems/faktor

import sys

def solve(A, I):
    '''
    Inputs:
        - número de artículos a publicar (A)
        - factor de impacto requerido (I)

    Returns:
        - número minimo de científicos a sobornar
    '''

    #COMPLETAR AQUI

    return N

if __name__ == '__main__':

    A, I = [int(x) for x in sys.stdin.readline().strip().split()]

    N = solve(A, I)

    print(N)