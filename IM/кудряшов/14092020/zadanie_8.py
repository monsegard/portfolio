import read_write_file
import vigener

def main():
    encrypt_data = read_write_file.read_data_1byte('text4_vigener_c_all.txt') 
    k = []
    for i in encrypt_data:
         k.append((i - 32) % 256)            
    read_write_file.write_data_1byte('k.txt', k)
    
    key = 'student'
    
    key_ind = []
    for k in range(len(key)):
         key_ind.append(ord(key[k]))      
    print(key_ind)
         
    decrypt_data = vigener.decrypt_data(encrypt_data, key_ind)
    read_write_file.write_data_1byte('text4_vigener_c_all_decrypt.txt', decrypt_data)   
     
if __name__ == '__main__':
    main()  