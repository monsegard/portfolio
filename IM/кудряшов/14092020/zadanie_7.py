import read_write_file
import vigener

def main():
    encrypt_data = read_write_file.read_data_1byte('im6_vigener_c_all.bmp')
    key = 'magistr'
    key_ind = []
    for k in range(len(key)):
         key_ind.append(ord(key[k]))      
    print(key_ind)
         
    decrypt_data = vigener.decrypt_data(encrypt_data, key_ind)
    read_write_file.write_data_1byte('im6_vigener_c_all_decrypt.bmp', decrypt_data)
    
    encrypt_data[0:50] = decrypt_data[0:50]
    read_write_file.write_data_1byte('im6_vigener_c_all_50.bmp', encrypt_data)
    
if __name__ == '__main__':
    main()  