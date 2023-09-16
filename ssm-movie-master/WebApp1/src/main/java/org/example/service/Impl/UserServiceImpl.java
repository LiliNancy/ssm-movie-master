package org.example.service.Impl;

import org.example.entity.User;
import org.example.mapper.UserMapper;
import org.springframework.stereotype.Service;
import org.example.service.UserService;

import javax.annotation.Resource;
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;
    @Override
    public User findOne(User user) {
        return userMapper.findOne(user);
    }
    @Override
    public int addOne(User user) {
        return userMapper.addOne(user);

    }
    @Override
    public User checkReg(String username) {
        return userMapper.checkReg(username);
    }

    @Override
    public void secChangeuser(String pwd,String phone){
        userMapper.secChangeuser(pwd,phone);
    }
}
