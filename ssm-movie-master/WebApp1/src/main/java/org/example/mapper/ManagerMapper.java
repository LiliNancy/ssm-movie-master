package org.example.mapper;
import org.apache.ibatis.annotations.Param;
import org.example.entity.Manager;
public interface ManagerMapper {
    //用户登录
    Manager findOne(Manager user);
    //用户注册
    int addOne(Manager user);
    //注册时重名检测
    Manager checkReg(String username);
    void secChange(@Param("pwd")String pwd,@Param("admid") int admid);

}
