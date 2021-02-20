###############
# SPN1
###############


class SPN1():

    #p-box
    p = [0, 4, 8, 12, 1, 5, 9, 13, 2, 6, 10, 14, 3, 7, 11, 15]

    #S-box
    s = [14, 4, 13, 1, 2, 15, 11, 8, 3, 10, 6, 12, 5, 9, 0, 7]

    # s-box application (forward direction)
    def sbox(self, x):
        return self.s[x]
    
    def asbox(self, x):
        return self.s.index(x)

    #p-box application (forward direction)
    def pbox(self, x):
        y = 0
        for i in range(len(self.p)):
            if (x & (1 << i)) != 0:
                y ^= (1 << self.p[i])
        return y

    #p-box application (backward direction)
    def apbox(self, x):
        y = 0
        for i in range(len(self.p)):
            if (x & (1 << self.p[i])) != 0:
                y ^= (1 << i)
        return y

    #break into 4-bit chunks
    @staticmethod
    def demux(x):
        y = []
        for i in range(0, 4):
            y.append((x >> (i*4)) & 0xf)
        return y

    #convert back into 16-bit state
    @staticmethod
    def mux(x):
        y = 0
        for i in range(0, 4):
            y ^= (x[i] << (i*4))
        return y

    def round_keys(self, k):
        rk = []
        rk.append((k >> 16) & (2**16-1))
        rk.append((k >> 12) & (2**16-1))
        rk.append((k >> 8) & (2**16-1))
        rk.append((k >> 4) & (2**16-1))
        rk.append(k & (2**16-1))
        return rk
    
    def round_keys_to_decrypt(self, key):
        K = self.round_keys(key)
        L = [ ]
        L.append(K[4])
        L.append(self.apbox (K[3]))
        L.append(self.apbox (K[2]))
        L.append(self.apbox (K[1]))
        L.append(K[0])
        return L

    # Key mixing
    @staticmethod
    def mix(p, k):
        v = p ^ k
        return v

    #round function
    def round(self, p, k):
        #XOR key
        u = self.mix(p, k)
        v = []
        # run through substitution layer
        for x in self.demux(u):
            v.append(self.sbox(x))

        # run through permutation layer
        w = self.pbox(self.mux(v))
        return w
    
    def round_decrypt(self, p, k):
        #XOR key
        u = self.mix(p, k)
        v = []
        # run through substitution layer
        for x in self.demux(u):
            v.append(self.asbox(x))

        # run through permutation layer
        w = self.apbox(self.mux(v))
        return w
    
    def last_round(self, p, k1, k2):
        #XOR key
        u = self.mix(p, k1) 
        v = []
        # run through substitution layer
        for x in self.demux(u):
            v.append(self.sbox(x))
        #XOR key
        u = self.mix(self.mux(v), k2)
        return u
    
    def last_round_decrypt(self, p, k1, k2):
        #XOR key
        u = self.mix(p, k1)
        v = []
        # run through substitution layer
        for x in self.demux(u):
            v.append(self.asbox(x))
        #XOR key
        u = self.mix(self.mux(v), k2)
        return u

    # Шифруем одно число
    def encrypt(self, x, rk, rounds):
        for i in range(rounds-1):
            x = self.round(x, rk[i])
            #print('round {} x={}'.format(i, bin(x)[2:].zfill(16)))
        x = self.last_round(x, rk[rounds-1], rk[rounds])
        return x
    
    def encrypt_data(self, data, key, rounds):
         rk=self.round_keys(key)
         cypher_data = []
         for m in data:
           c = self.encrypt(m, rk, rounds)
           cypher_data.append(c)
         return cypher_data
     
    def decrypt(self, x, rk, rounds):
        for i in range(rounds-1):
            x = self.round_decrypt(x, rk[i])
           #print('round {} x={}'.format(i, bin(x)[2:].zfill(16)))
        x = self.last_round_decrypt(x, rk[rounds-1], rk[rounds])
        return x
    
    def decrypt_data(self, data, key, rounds):
         rk=self.round_keys_to_decrypt(key)
         cypher_data = []
         for m in data:
           c = self.decrypt(m, rk, rounds)
           cypher_data.append(c)
         return cypher_data

    def OFB_encrypt(self, data, key, IV, rounds):
        rk=self.round_keys(key)
        cypher_data = []
        for m in data :
            c = self.encrypt(IV, rk, rounds)
            IV = c
            m = c ^ m
            cypher_data.append(m)
        return cypher_data
    
    def OFB_decrypt(self, data, key, IV, rounds):
        rk=self.round_keys(key)
        cypher_data = []
        for m in data :
            c = self.encrypt(IV, rk, rounds)
            IV = c
            c = c ^ m
            cypher_data.append(c)
        return cypher_data    
    
     
