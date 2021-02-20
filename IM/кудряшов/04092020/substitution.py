import random


def table_substitution(k):
    k = list(range(256))
    print(k)
    random.shuffle(k)
    print(k)

def encrypt(data, k):
    cypher_data = []
    for m in data:
        c = k[m]
        cypher_data.append(c)


