#codigo base para problema de Kattis "babelfish"
#https://open.kattis.com/problems/babelfish
import sys


def solve(word_pairs, words):
    '''
    Esta funcion toma 2 parametros:
        - lista de "pares". Cada par contiene dos strings, el primero
        es una palabra en ingles, el segundo es una palabra en idioma
        extranjero
        - una lista de palabras para traducir
    
    La funcion "solve" debe retornar una lista, con las
    palabras traducidas
    '''

    return lista_palabras_traducidas


if __name__ == "__main__":
    line = sys.stdin.readline().strip()

    word_pairs = []
    while line != "":
        word_pairs.append(line.split())
        line = sys.stdin.readline().strip()

    words = []
    for line in sys.stdin:
        words.append(line.strip())

    translated = solve(word_pairs, words)

    for w in translated:
        print(w)
