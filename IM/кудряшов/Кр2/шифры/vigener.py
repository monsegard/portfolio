def encrypt(m, k, l):
    c = (m + k) % l
    return c


def decrypt(c, b, l):
    c = (c - b) % l
    return c


def encrypt_data(data, key, l):
    u = len(key)
    cypher_data = []
    i = 0
    for m in data:
        c = encrypt(m, key[i % u], l)
        i += 1
        cypher_data.append(c)
    return cypher_data


def decrypt_data(data_c, key, l):
    u = len(key)
    cypher_data = []
    i = 0
    for m in data_c:
        c = decrypt(m, key[i % u], l)
        i += 1
        cypher_data.append(c)
    return cypher_data


def cbc_encrypt(data, key, iv, l=256):
    u = len(key)
    cypher_data = []
    i = 0
    for m in data:
        m = m ^ iv
        c = encrypt(m, key[i % u], l)
        cypher_data.append(c)
        iv = c
    return cypher_data


def cbc_decrypt(data, key, iv, l=256):
    u = len(key)
    cypher_data = []
    i = 0
    for m in data:
        c = decrypt(m, key[i % u], l)
        i += 1
        c = c ^ iv
        cypher_data.append(c)
        iv = m
    return cypher_data


def ofb_encrypt(data, key, iv, l=256):
    u = len(key)
    cypher_data = []
    i = 0
    for m in data:
        c = encrypt(iv, key[i % u], l)
        i += 1
        iv = m
        c = c ^ iv
        cypher_data.append(c)
    return cypher_data


def ofb_decrypt(data, key, iv, l=256):
    u = len(key)
    cypher_data = []
    i = 0
    for m in data:
        c = encrypt(iv, key[i % u], l)
        i += 1
        iv = c
        m = m ^ iv
        cypher_data.append(m)
    return cypher_data


def cfb_encrypt(data, key, iv, l=256):
    u = len(key)
    cypher_data = []
    i = 0
    for m in data:
        c = encrypt(iv, key[i % u], l)
        i += 1
        m = m ^ iv
        iv = c
        cypher_data.append(m)
    return cypher_data


def cfb_decrypt(data, key, iv, l=256):
    u = len(key)
    cypher_data = []
    i = 0
    for m in data:
        c = encrypt(iv, key[i % u], l)
        i += 1
        iv = m
        c = c ^ iv
        cypher_data.append(c)
    return cypher_data


def ctr_encrypt(data, key, iv, l=256):
    u = len(key)
    cypher_data = []
    i = 0
    for m in data:
        c = encrypt(iv, key[i % u], l)
        i += 1
        m = m ^ c
        iv += 1
        cypher_data.append(m)
    return cypher_data


def ctr_decrypt(data, key, iv, l=256):
    u = len(key)
    cypher_data = []
    i = 0
    for m in data:
        c = encrypt(iv, key[i % u], l)
        i += 1
        c = c ^ m
        iv += 1
        cypher_data.append(c)
    return cypher_data
