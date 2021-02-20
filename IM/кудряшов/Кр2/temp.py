import read_write_file
import hill


def main():
    encrypt_data = read_write_file.read_data_1byte('m18_hill_c_all.bmp')
    k = [[47,239],[119, 108]]
    decrypt_data = hill.decrypt_data(encrypt_data, k, 256)
    print()
    read_write_file.write_data_1byte('m18_hill_c_all_decrypt.bmp', decrypt_data)
    
    
    
    encrypt_data[0:50] = decrypt_data[0:50]    
    read_write_file.write_data_1byte('m18_hill_c_all_50.bmp', encrypt_data)
if __name__ == '__main__':
    main() 
