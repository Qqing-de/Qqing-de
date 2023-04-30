package qq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Controller
public class FileLoad {
    public static String uploadAdminPic(MultipartFile file) {
//        String picName = UUID.randomUUID().toString();
        //获取上传文件得元素得名称
        String fileName = file.getOriginalFilename();
//        String substring = fileName.substring(fileName.lastIndexOf("."));
        //上传文件
        try {
            file.transferTo(new File("E:/Springspace/Mypet/src/main/webapp/static/images/admin/" + fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        String name = fileName;

        return name;
    }

    public static String uploadUserPic(MultipartFile file) {
//        String picName = UUID.randomUUID().toString();
        //获取上传文件的元素的名称
        String fileName = file.getOriginalFilename();
//        String substring = fileName.substring(fileName.lastIndexOf("."));
        //上传文件
        try {
            file.transferTo(new File("E:/Springspace/Mypet/src/main/webapp/static/images/user/" + fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        String name = fileName;

        return name;
    }

    public static String uploadPetPic(MultipartFile file) {
//        String picName = UUID.randomUUID().toString();
        //获取上传文件得元素得名称
        String fileName = file.getOriginalFilename();
//        String substring = fileName.substring(fileName.lastIndexOf("."));
        //上传文件
        try {
            file.transferTo(new File("E:/Springspace/Mypet/src/main/webapp/static/images/animal/" + fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        String name = fileName;

        return name;
    }


}
