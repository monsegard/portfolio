import caesar
import read_write_file
import detectEnglish

def main():
    m = 24
    key = 37
    c = caesar.encrypt(m, key)
    #print('c = ', c)
    m1 = caesar.decrypt(c, key)
    #print('было m = 24')
    #print('m1 = ', m1)
    
    data = [34, 67, 123,79, 201]
    encrypt_data = caesar.encrypt_data(data, key)
    #print('encrypt_data = ', encrypt_data)
    
    decrypt_data = caesar.decrypt_data(encrypt_data, key)
    #print('было data = 34, 67, 123,79, 201')
    #print('decrypt_data = ', decrypt_data)


    #зашифровкак файла
    data  = read_write_file.read_data_1byte('f1.txt')
    #print('data = ', data[0:15]) 
    txt = ''
    for n in data[0:15]:
        txt += chr(n)
    #print('text = ', txt) 
    data  = read_write_file.read_data_1byte('f1.txt')
    #print('data = ', data[0:15])  
    encrypt_data = caesar.encrypt_data(data, key = 67)
    #print('encrypt_data = ', encrypt_data[0:15])   
    txt = ''.join([chr(s) for s in encrypt_data[0:15]])
    #print('encrypt_text = ', txt)   
    read_write_file.write_data_1byte('f1_encrypt.txt', encrypt_data)
    
    
    #расшифровка из зашифрованного файла
    encrypt_data = read_write_file.read_data_1byte('f1_encrypt.txt')
    #print('encrypt_data = ', encrypt_data[0:15])  
    decrypt_data = caesar.decrypt_data(encrypt_data, key = 67)
    #print('decrypt_data = ', decrypt_data[0:15])    
    txt = ''.join([chr(s) for s in decrypt_data[0:15]])
    #print('decrypt_dara = ', txt)    
    read_write_file.write_data_1byte('f1_decrypt.txt', decrypt_data)
    
  
    for k in range(0,256):
        #расшифровываем
        decrypt_data = caesar.decrypt_data(encrypt_data, key = k)
        #смотрим, что получилось
        txt = ''.join([chr(s) for s in decrypt_data])
       
        #проверяем, полученный текст - английсикй или нет
        is_english = detectEnglish.isEnglish(txt)
        if is_english == True:
            print('decrypt_data = ', txt) 
            break
    
    
if __name__ == '__main__':
    main()
    