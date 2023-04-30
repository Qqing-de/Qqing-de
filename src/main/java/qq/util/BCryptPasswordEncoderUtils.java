package qq.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * @author Qing
 * @version 2023/2/22 11:18
 * @since JDK8
 */
public class BCryptPasswordEncoderUtils {
    private static BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
    //加密方法
    public static String encodePassword(String password){
        return bCryptPasswordEncoder.encode(password);
    }

    //ceshi
    public static void main(String[] args) {
        System.out.println(BCryptPasswordEncoderUtils.encodePassword("123"));
        System.out.println(BCryptPasswordEncoderUtils.encodePassword("123"));
        System.out.println(BCryptPasswordEncoderUtils.encodePassword("euaoskuzy"));
    }
}


