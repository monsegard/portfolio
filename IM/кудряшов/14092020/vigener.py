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
