import read_write_file
import afinn

def main():
    a = 19
    m = 236
    encrypt_data = read_write_file.read_data_1byte('ff2_affine_c_all.bmp')
    A_1 =afinn.findModInverse(a, m)
    
    
    read_write_file.write_data_1byte('ff2_affine_c_all_decrypt.bmp', decrypt_data)   
    
    
if __name__ == '__main__':
    main()    