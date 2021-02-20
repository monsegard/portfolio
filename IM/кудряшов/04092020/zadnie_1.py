import caesar
import read_write_file
import detectEnglish

def main():
    encrypt_data = read_write_file.read_data_1byte('t3_caesar_c_all.txt')       
    for k in range(0,256):
        decrypt_data = caesar.decrypt_data(encrypt_data, key = k)
        txt = ''.join([chr(s) for s in decrypt_data])
        is_english = detectEnglish.isEnglish(txt)
        if is_english == True:
            print(k)
            print('decrypt_data = ', txt) 
            break 
        
if __name__ == '__main__':
    main()