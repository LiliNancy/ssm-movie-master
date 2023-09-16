package org.example.service;
import org.example.entity.User;
public interface UserService {
    //用户登录
    User findOne(User user);
    //用户注册
    int addOne(User user);
    //注册时重名检测
    User checkReg(String username);
    void secChangeuser(String pwd,String phone);
}
