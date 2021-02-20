def encrypt_data(data, key):
    cypher_data = []
    i = 0
    for m in data:
        c = (m+key[i%len(key)])%256
        cypher_data.append(c)
        i += 1
    return cypher_data

def decrypt_data(data_m, key):
    data = []
    i = 0
    for m in data_m:
        m = (m-key[i%len(key)])%256
        data.append(m)
        i+=1
    return data

def findModInverse(a, m):
    # Returns the modular inverse of a % m, which is
    # the number x such that a*x % m = 1

    if gcd(a, m) != 1:
        return None  # no mod inverse if a & m aren't relatively prime

    # Calculate using the Extended Euclidean Algorithm:
    u1, u2, u3 = 1, 0, a
    v1, v2, v3 = 0, 1, m
    while v3 != 0:
        q = u3 // v3  # // is the integer division operator
        v1, v2, v3, u1, u2, u3 = (u1 - q * v1), (u2 - q * v2), (u3 - q * v3), v1, v2, v3
    return u1 % m


def gcd(a, b):
    while a != 0:
       a, b = b % a, a
    return b

