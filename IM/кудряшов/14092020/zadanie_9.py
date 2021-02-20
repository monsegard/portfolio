import read_write_file
import vigener

def main():
    encrypt_data = read_write_file.read_data_1byte('text4_vigener_c_all.txt')
    l = [104, 111, 117, 115, 101, 119, 105, 118, 101, 115]
    data=[]
    
    for i in range(len(encrypt_data)):        
        text = encrypt_data[i:10+i]        
        decrypt_data = vigener.decrypt_data(text, l)       
        #txt = ''.join([chr(s) for s in decrypt_data])
        data.extend(decrypt_data)        
#    read_write_file.write_data_1byte('text4_vigener_c_all_decrypt_9zadanie.txt', data)
    
    
    key = 'student'    
    key_ind = []
    for k in range(len(key)):
         key_ind.append(ord(key[k]))              
    decrypt_data = vigener.decrypt_data(encrypt_data, key_ind)
    read_write_file.write_data_1byte('text4_vigener_c_all_decrypt_9zadanie.txt', decrypt_data)   
        
        
if __name__ == '__main__':
    main()  