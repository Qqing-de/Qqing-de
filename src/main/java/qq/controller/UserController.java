package qq.controller;

import qq.pojo.User;
import qq.service.UserService;
import qq.util.MD5Utils;
import qq.util.Message;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping("/create")
//    @ResponseBody
    public String add(User user, Model model,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int p= userService.findLogin2(user);
        System.out.println("？？？？？？？？？？？？？？？：：："+p);
        if(p==1){
            model.addAttribute("uerror","用户名已存在");
//            response.reset();
//            request.setAttribute("uerror", "用户名已存在!");
//            request.getRequestDispatcher("/user/index").forward(request,response);
        }else{
            int add = userService.add(user);
            if(add>0){
                return  "user/index";
            }
            return "user/index";
        }
        return "redirect:user/index";
    }

    @RequestMapping("/login")
    @ResponseBody
    public Message loginuser(HttpSession session, String userName, String password){
        User user = userService.loginuser(userName, password);
        if (user != null){
            session.setAttribute("user",user);
            return Message.success().add("user",user);
        }else{
            return Message.fail();
        }
    }
    @RequestMapping("/logout")
    @ResponseBody
    public Message logout(HttpSession session){
        session.invalidate();
        return Message.success();
    }

    @RequestMapping("/users")
    @ResponseBody
    public Message users(@RequestParam(required = false) String userName, @RequestParam("pn")Integer pageNum){
        Integer pageSize = 4;
        PageInfo<User> users = userService.allUser(userName,pageNum,pageSize);
        return Message.success().add("pageInfo",users);
    }

    @RequestMapping("findById")
    @ResponseBody
    public Message findById(Integer id){
        User byId = userService.findById(id);
        return Message.success().add("user",byId);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Message del(Integer id){
        int del = userService.del(id);
        if(del>0){
            return Message.success();
        }else {
            return Message.fail();
        }
    }


    @RequestMapping("/retrieve")
    public String retrievePsw(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //	获取用户修改的信息
         User user=new User();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmpwd = request.getParameter("confirmpwd");
        user.setUserName(username);
        user.setPassword(password);
        System.out.println( "u: "+username+ "p: "+password+ "c: "+confirmpwd+"-----------------------");
        System.out.println("0200000000-------------"+user.toString());
        if (!confirmpwd.equals(password)) {
            request.setAttribute("error", "密码填写不一致!");
            request.getRequestDispatcher("/user/upPwd").forward(request, response);
        }else {
            int i= userService.retrieve(user);
            System.out.println("用户是否存在？？？？？？"+i);
           if (i==0){
               request.setAttribute("error", "用户名不存在!");
               request.getRequestDispatcher("/user/upPwd").forward(request, response);
           }
            user.setPassword(MD5Utils.md5(user.getPassword()));
            userService.retrieve(user);
        }
        return "user/about";
    }

    @RequestMapping("/about")
    public String about(){
        return "user/about";
    }

    @RequestMapping("/upPwd")
    public String upPwd(){
        return "user/retrieve";
    }

    @RequestMapping("/error")
    public String error(){
        return "user/error";
    }

    @RequestMapping("/index")
    public String index(){
        return "user/index";
    }

    @RequestMapping("/personal-info")
    public String personalInfo(){
        return "user/personal-info";
    }

    @RequestMapping("/service")
    public String service(){
        return "user/service";
    }

    @RequestMapping("/show")
    public String show(){
        return "user/show";
    }

    @RequestMapping("/team")
    public String team(){
        return "user/team";
    }

    @RequestMapping("/teamBlog")
    public String teamBlog(){
        return "user/teamBlog";
    }

    @RequestMapping("/update")
    @ResponseBody
    public Message update(User user){
        Integer update = userService.update(user);
        if(update > 0){
            return Message.success();
        }else {
            return Message.fail();
        }
    }

    @RequestMapping("/updatePic")
    @ResponseBody
    public Message updatePic(HttpSession session, MultipartFile file){
        String fileName = FileLoad.uploadUserPic(file);
        User user = (User) session.getAttribute("user");
        user.setPic(fileName);
        Integer update = userService.update(user);
        if (update > 0){
            return Message.success();
        }else {
            return Message.fail();
        }
    }
}
