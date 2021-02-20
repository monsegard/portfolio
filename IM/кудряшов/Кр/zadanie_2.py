import caesar
import read_write_file


def main():
    data = read_write_file.read_data_1byte('c4_caesar_c_all.bmp')
    for k in range(0,256):
        decrypt_data = caesar.decrypt_data(data, key = k)
        if decrypt_data[0] == 0x42 and decrypt_data[1] == 0x4D:
            print(k)
            break
    read_write_file.write_data_1byte('c4_caesar_c_all_decrypt.bmp', decrypt_data)
   
    data[0:50] = decrypt_data[0:50]
    read_write_file.write_data_1byte('c4_caesar_c_all_encrypt_50.bmp', data)
    
   
if __name__ == '__main__':
    main()   