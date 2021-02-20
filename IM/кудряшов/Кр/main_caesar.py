import caesar
import read_write_file
import detectEnglish

def main():
    encrypt_data = read_write_file.read_data_1byte('t5_caesar_ctr_c_all.txt')
    for key in range(0,256):
        for k in range(0,256):
             decrypt_data = caesar.decrypt_data_CTR(encrypt_data, key, k)
             txt = ''.join([chr(s) for s in decrypt_data])
        is_english = detectEnglish.isEnglish(txt)
        if is_english == True:
                 print(key) 
                 print('decrypt_data = ', txt) 
                 break
    read_write_file.write_data_1byte('t5_caesar_ctr_c_all_decrypt.txt', decrypt_data)     
                
   
if __name__ == '__main__':
    main()
    