package qq.service;

import qq.pojo.User;

import com.github.pagehelper.PageInfo;


import java.util.List;

public interface UserService {
    List<User> findByName(String userName, Integer state);
    List<User> showName(String userName);
    //登录
    User loginuser(String userName,String password);
    //注册
    int add(User user);
    //修改
    Integer update(User user);
    //找回密码
    Integer retrieve(User user);
    //查询用户
    Integer findLogin2(User user);
    User findById(Integer id);
    PageInfo<User> allUser(String userName, Integer pageNum, Integer pageSize);
    int del(Integer id);
}
