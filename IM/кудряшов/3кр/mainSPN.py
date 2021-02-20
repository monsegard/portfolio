import spn1

from read_write_file import read_data_2byte as read2
from read_write_file import write_data_2byte as write2

def main():
    e = spn1.SPN1()
  
    # расшифрование
    key=37884354631;
    encrypt_data = read2('f3_spn_c_ofb_all.bmp ')
    decrypt_data = e.OFB_decrypt(encrypt_data, key, IV = 29, rounds=4)
    write2('f3_spn_c_ofb_all_decrypt.bmp', decrypt_data)
    
    encrypt_data[0:50] = decrypt_data[0:50]
    write2('f3_spn_c_ofb_all_50.bmp', encrypt_data)
    
if __name__ == '__main__':
    main() 
