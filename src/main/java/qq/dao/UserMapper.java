package qq.dao;

import qq.pojo.User;
import com.baomidou.mybatisplus.mapper.BaseMapper;

public interface UserMapper extends BaseMapper<User> {
    //找回密码
    Integer retrieve(User user);
    //查询用户
    Integer findLogin2(User user);
}