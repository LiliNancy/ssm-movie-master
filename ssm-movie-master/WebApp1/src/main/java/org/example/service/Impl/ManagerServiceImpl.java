package org.example.service.Impl;

import org.example.entity.Manager;
import org.example.mapper.ManagerMapper;
import org.springframework.stereotype.Service;
import org.example.service.ManagerService;

import javax.annotation.Resource;

@Service
public class ManagerServiceImpl implements ManagerService{
    @Resource
    private ManagerMapper managerMapper;
    @Override
    public Manager findOne(Manager user) {
        return managerMapper.findOne(user);
    }
    @Override
    public int addOne(Manager user) {
        return managerMapper.addOne(user);

    }
    @Override
    public Manager checkReg(String username) {
        return managerMapper.checkReg(username);
    }

    @Override
    public void secChange(String pwd,int admid){
        managerMapper.secChange(pwd,admid);
    }
}
