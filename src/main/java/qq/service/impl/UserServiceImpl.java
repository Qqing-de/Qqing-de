package qq.service.impl;

import qq.dao.UserMapper;
import qq.pojo.User;
import qq.service.UserService;
import qq.util.MD5Utils;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {

//    private MD5Utils md5Utils;

    @Resource
    private UserMapper userMapper;
    @Override
    public User findById(Integer id) {
        return userMapper.selectById(id);
    }

    @Override
    public List<User> findByName(String userName, Integer state) {
        EntityWrapper<User> wrapper = new EntityWrapper<>();
        if (userName != null && !userName.equals("")){
            wrapper.like("userName", userName);
        }
        if (state != null){
            wrapper.eq("state", state);
        }
        return userMapper.selectList(wrapper);
    }

    @Override
    public List<User> showName(String userName) {
        EntityWrapper wrapper = new EntityWrapper();
        if(userName != null && !userName.equals("")){
            wrapper.like("userName",userName);
        }
        return userMapper.selectList(wrapper);
    }

    @Override
    public User loginuser(String userName, String password) {
        User user = new User();
        user.setUserName(userName);
        User user1 = userMapper.selectOne(user);
        String password1=MD5Utils.md5(password.toString());
//        user.setPassword(MD5Utils.md5(user.getPassword()));
        System.out.println(password1);
        if (user1 != null && user1.getPassword().equals(password1)) {
            return user1;
        }
        return null;
    }

    @Override
    public Integer update(User user) {
        return userMapper.updateById(user);
    }

    @Override
    public Integer retrieve(User user){
        user.setUserName(user.getUserName());
//        User user1 = userMapper.selectOne(user);
//        String password1=MD5Utils.md5(password.toString());
//        if (user1 != null) {
            if (0 != 1) {
            return userMapper.retrieve(user);
        }
        return null;

    }

    @Override
    public Integer findLogin2(User user) {
        int i=userMapper.findLogin2(user);
        System.out.println("findLogin2de判断===========：：：："+i);
        if (i>0){
            return 1; //0表示用户名存在
        }else {
            return 0;//1表示用户名bu存在,可以注册
        }
    }

    @Override
    public PageInfo<User> allUser(String userName ,Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        EntityWrapper<User> wrapper = new EntityWrapper<>();
        if(userName != null && !"".equals(userName)){
            wrapper.like("userName",userName);
        }

        List<User> list = userMapper.selectList(wrapper);
        PageInfo<User> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public int add(User user) {
//        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setPassword(MD5Utils.md5(user.getPassword()));
        System.out.println("------------------"+user.getPassword());
        return userMapper.insert(user);
    }

    @Override
    public int del(Integer id) {
        return userMapper.deleteById(id);
    }
}
