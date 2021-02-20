def gcd(a, b):
    while a != 0:
        a, b = b % a, a
    return b


def findModInverse(a, m):
    # Returns the modular inverse of a % m, which is # the number x such that a*x % m = 1
    if gcd(a, m) != 1: return None # no mod inverse if a & m aren't relatively prime # Calculate using the Extended Euclidean Algorithm:
    u1, u2, u3 = 1, 0, a
    v1, v2, v3 = 0, 1, m
    while v3 != 0:
        q = u3 // v3 # // is the integer division operator
        v1, v2, v3, u1, u2, u3 = (u1 - q * v1), (u2 - q * v2), (u3 - q * v3), v1, v2, v3
    return u1 % m


def encrypt(a, b, l, m):
    return (a * m + b) % l


def encrypt_data(a, b, l, data):
    cypher_data = []
    for m in data:
        c = encrypt(a, b, l, m)
        cypher_data.append(c)
    return cypher_data


def decrypt(a, b, l, c):
    return (c - b) * findModInverse(a, l) % l


def decrypt_data(a, b, l, data):
    decypher_data = []
    for c in data:
        m = decrypt(a, b, l, c)
        decypher_data.append(m)
    return decypher_data


def cbc_encrypt(a, b, data, iv, l=256):
    cypher_data = []
    for m in data:
        m = m ^ iv
        c = encrypt(a, b, l, m)
        cypher_data.append(c)
        iv = c
    return cypher_data


def cbc_decrypt(a, b, data, iv, l=256):
    cypher_data = []
    for m in data:
        c = decrypt(a, b, l, m)
        c = c ^ iv
        cypher_data.append(c)
        iv = m
    return cypher_data


def ofb_encrypt(a, b, data, iv, l=256):
    cypher_data = []
    for m in data:
        c = decrypt(a, b, l, iv)
        iv = m
        c = c ^ iv
        cypher_data.append(c)
    return cypher_data


def ofb_decrypt(a, b, data, iv, l=256):
    cypher_data = []
    for m in data:
        c = encrypt(a, b, l, iv)
        iv = c
        m = m ^ iv
        cypher_data.append(m)
    return cypher_data


def cfb_encrypt(a, b, data, iv, l=256):
    cypher_data = []
    for m in data:
        c = encrypt(a, b, l, iv)
        m = m ^ iv
        iv = c
        cypher_data.append(m)
    return cypher_data


def cfb_decrypt(a, b, data, iv, l=256):
    cypher_data = []
    for m in data:
        c = encrypt(a, b, l, iv)
        iv = m
        c = c ^ iv
        cypher_data.append(c)
    return cypher_data


def ctr_encrypt(a, b, data, iv, l=256):
    cypher_data = []
    for m in data:
        c = encrypt(a, b, l, m)
        m = m ^ c
        iv += 1
        cypher_data.append(m)
    return cypher_data


def ctr_decrypt(a, b, data, iv, l=256):
    cypher_data = []
    for m in data:
        c = encrypt(a, b, l, m)
        c = c ^ m
        iv += 1
        cypher_data.append(c)
    return cypher_data

