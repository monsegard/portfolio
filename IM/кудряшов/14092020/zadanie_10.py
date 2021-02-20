import read_write_file
import vigener

def main():
    encrypt_data = read_write_file.read_data_1byte('text1_vigener_c.txt')
    l = [105, 116, 32, 116, 104, 101, 114, 101, 102, 111, 114, 101 ]
    data = []
    for i in range(len(encrypt_data)):        
        text = encrypt_data[i:12+i]        
        decrypt_data = vigener.decrypt_data(text, l)  
        data.extend(decrypt_data)
              
    key = 'KEYBOARD'    
    key_ind = []
    for k in range(len(key)):
         key_ind.append(ord(key[k]))              
    data_T = vigener.decrypt_data(encrypt_data, key_ind)
    read_write_file.write_data_1byte('text1_vigener_c_DECRYPT.txt', data_T)   
     
   
    
if __name__ == '__main__':
    main()  