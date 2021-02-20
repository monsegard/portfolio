def encrypt(c, key, l):
    return (c + key) % l


def decrypt(m, key, l):
    return (m - key) % l


def encrypt_data(data, key, l=256):
    cypher_data = []
    for m in data:
        c = encrypt(m, key, l)
        cypher_data.append(c)
    return cypher_data


def decrypt_data(data_c, key, l=256):
    data = []
    for c in data_c:
        m = decrypt(c, key, l)
        data.append(m)
    return data


def cbc_encrypt(data, key, iv, l=256):
    cypher_data = []
    for m in data:
        m = m ^ iv
        c = encrypt(m, key, l)
        cypher_data.append(c)
        iv = c
    return cypher_data


def cbc_decrypt(data, key, iv, l=256):
    cypher_data = []
    for m in data:
        c = decrypt(m, key, l)
        c = c ^ iv
        cypher_data.append(c)
        iv = m
    return cypher_data


def ofb_encrypt(data, key, iv, l=256):
    cypher_data = []
    for m in data:
        c = encrypt(iv, key, l)
        iv = m
        c = c ^ iv
        cypher_data.append(c)
    return cypher_data


def ofb_decrypt(data, key, iv, l=256):
    cypher_data = []
    for m in data:
        c = encrypt(iv, key, l)
        iv = c
        m = m ^ iv
        cypher_data.append(m)
    return cypher_data


def cfb_encrypt(data, key, iv, l=256):
    cypher_data = []
    for m in data:
        c = encrypt(iv, key, l)
        m = m ^ iv
        iv = c
        cypher_data.append(m)
    return cypher_data


def cfb_decrypt(data, key, iv, l=256):
    cypher_data = []
    for m in data:
        c = encrypt(iv, key, l)
        iv = m
        c = c ^ iv
        cypher_data.append(c)
    return cypher_data


def ctr_encrypt(data, key, iv, l=256):
    cypher_data = []
    for m in data:
        c = encrypt(iv, key, l)
        m = m ^ c
        iv += 1
        cypher_data.append(m)
    return cypher_data


def ctr_decrypt(data, key, iv, l=256):
    cypher_data = []
    for m in data:
        c = encrypt(iv, key, l)
        c = c ^ m
        iv += 1
        cypher_data.append(c)
    return cypher_data
