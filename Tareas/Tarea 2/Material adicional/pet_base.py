# Estructura de código para resolver problema de Kattis
# https://open.kattis.com/problems/pet

import sys

# Concentrarse en funcion "solve"; NO modificar otras partes del codigo

def solve(contestant_scores):
    '''
    Input: lista con 5 entradas, cada una para un participante.
    Cada entrada es una lista con 4 enteros (los puntajes para ese 
    participante).

    Return: el número del ganador, y su puntaje 
    '''

    #MODIFICAR AQUI
    winner_num = 0
    winner_score = 0
    #MODIFICAR AQUI
    
    return winner_num, winner_score


if __name__ == "__main__":
    tokens = sys.stdin.read().strip().split()

    scores = [ [int(tokens.pop(0)) for i in range(4)] for j in range(5) ]

    pet, score = solve(scores)

    print(pet, score)