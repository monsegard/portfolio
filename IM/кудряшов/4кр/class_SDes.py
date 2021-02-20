class SDes():
    P10 = [3, 5, 2, 7, 4, 10, 1, 9, 8, 6]
    P8 = [6, 3, 7, 4, 8, 5, 10, 9]
    LS1 = [2, 3, 4, 5, 1]
    LS2 = [3, 4, 5, 1, 2]
    IP = [2, 6, 3, 1, 4, 8, 5, 7]
    IPinv = [4, 1, 3, 5, 7, 2, 8, 6]
    EP = [4, 1, 2, 3, 2, 3, 4, 1]
    P4 = [2, 4, 3, 1]
    SW = [5, 6, 7, 8, 1, 2, 3, 4]

    # таблицы замен
    S0 = [[1, 0, 3, 2],
          [3, 2, 1, 0],
          [0, 2, 1, 3],
          [3, 1, 3, 2]]

    S1 = [[0, 1, 2, 3],
          [2, 0, 1, 3],
          [3, 0, 1, 0],
          [2, 1, 0, 3]]

    def __init__(self):
        """
        раундовые ключи. рассчитываются в функции key_schedule
        """
        self.k1 = 0
        self.k2 = 0

    @staticmethod
    def pbox(x, p, nx):
        # перестановка бит в nx-битовом числе x по таблице перестановок p
        y = 0
        np = len(p)
        for i in reversed(range(np)):
            if (x & (1 << (nx - 0 - p[i]))) != 0:
                y ^= (1 << (np - 1 - i))
        return y

    def p10(self, x):
        return self.pbox(x, self.P10, 10)

    def p8(self, x):
        return self.pbox(x, self.P8, 10)

    def p4(self, x):
        return self.pbox(x, self.P4, 4)

    def ip(self, x):
        return self.pbox(x, self.IP, 8)

    def ipinv(self, x):
        return self.pbox(x, self.IPinv, 8)

    def ep(self, x):
        return self.pbox(x, self.EP, 4)

    def sw(self, x):
        return self.pbox(x, self.SW, 8)

    def ls1(self, x):
        return self.pbox(x, self.LS1, 5)

    def ls2(self, x):
        return self.pbox(x, self.LS2, 5)

    @staticmethod
    def divide_into_two(k, n):
        """
        функция разделяет n-битовое число k на два (n/2)-битовых числа
        """

        n2 = n//2
        mask = 2**n2 - 1
        l1 = (k >> n2) & mask
        l2 = k & mask
        return l1, l2

    @staticmethod
    def mux(l, r, n):
        """
        # l, r - n-битовые числа
        # возвращает число (2n-битовое), являющееся конкатенацией бит этих чисел
        """
        y = 0
        y ^= r
        y ^= l << n
        return y

    @staticmethod
    def apply_subst(x, s):
        """
        замена по таблице s
        """
        r = 2*(x >> 3) + (x & 1)
        c = 2*((x >> 2) & 1) + ((x >> 1) & 1)
        return s[r][c]

    def s0(self, x):
        """
        замена по таблице s0
        """
        return self.apply_subst(x, self.S0)

    def s1(self, x):
        """
        замена по таблице s1
        """
        return self.apply_subst(x, self.S1)
    def key_schedule(self, key):
        
        """
        Алгоритм расширения ключа. Функция формирует из ключа шифрования key два
        раундовых 
        """
        p_10 = self.p10(key)
        ls_1_1 = self.ls1(p_10[1:5])
        ls_1_2 = self.ls1( p_10[6:10])
        ls_1 = ls_1_1 + ls_1_2
        k1 = self.p8(ls_1)
        ls_2_1 = self.ls2(ls_1_1)
        ls_2_2 = self.ls2(ls_1_2)
        ls_2 = ls_2_1 + ls_2_2
        k2 =  self.p8(ls_2)
    
    def F(self, block, k):
        ep = self.ep(k)
        c = ep ^ block
        s0_1 = self.s0(c[1:4])
        s0_2 = self.s0(c[5:8])
        s_0 = s0_1 + s0_2
        return self.p4(s_0)
    
    def f_k(self, block, SK):
        block_1 = block[1:4]
        block_2 = block[5:8]
        a = block_1 ^ self.F(block_2, SK) 
        b = a + block_2
        return b
        
     def sdes(self, block, k1, k2):
        ip = self.ip(block)
        fk_1 = self.f_k(ip, k1)
        sw = self.sw(fk_1)
        fk_2 = self.f_k(sw, k2
        return self.ipinv(fk_2)
    
    
     def encrypt (self, plaintext_block):
         return self.sdes(plaintext_block, self.k1, self.k2)
     
     def decrypt (self, cipherext_block):
         return self.sdes(plaintext_block, self.k2, self.k1)
        
     def encrypt_data(self, data, key):
         cypher_data = []
         for m in data:
           c = self.encrypt(data)
           cypher_data.append(c)
         return cypher_data     
     
     def decrypt_data(self, data, key):
         cypher_data = []
         for m in data:
           c = self.decrypt(data)
           cypher_data.append(c)
         return cypher_data
     
     
        
        
        
        
        
        
        
        
        
        
        
        
        
        
