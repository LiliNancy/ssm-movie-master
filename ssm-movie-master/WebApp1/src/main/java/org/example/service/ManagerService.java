package org.example.service;
import org.example.entity.Manager;
public interface ManagerService {
    //用户登录
    Manager findOne(Manager user);
    //用户注册
    int addOne(Manager user);
    //注册时重名检测
    Manager checkReg(String username);
    void secChange(String pwd,int admid);

}
