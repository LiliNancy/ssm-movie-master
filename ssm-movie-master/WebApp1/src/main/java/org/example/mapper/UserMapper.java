package org.example.mapper;
import org.apache.ibatis.annotations.Param;
import org.example.entity.User;
public interface UserMapper {
    //用户登录
    User findOne(User user);
    //用户注册
    int addOne(User user);
    //注册时手机号检测
    User checkReg(String telephone);

    void secChangeuser(@Param("pwd")String pwd, @Param("phone") String phone);
}
