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

    # Шифруем одно число
    def encrypt(self, x, rk, rounds):
        for i in range(rounds-1):
            x = self.round(x, rk[i])
        x = self.last_round(x, rk[rounds-1], rk[rounds])
        return x
