package com.example.service.impl;

import com.example.mapper.UserDao;
import com.example.model.User;
import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public List<User> SelectUser(String username, String name, String quanxian){
        return this.userDao.SelectUser(username,name,quanxian);
    }
    @Override
    public List<User> gl(){
        return this.userDao.gl();
    }
    @Override
    public User dl(String username,String password){
        return this.userDao.dl(username, password);
    }
    @Override
    public Integer fire(String name,String username,String password,String quanxian){
        return this.userDao.fire(name, username, password, quanxian);
    }
    @Override
    public Integer AddUser(String name,String password,String quanxian,String username){
        return this.userDao.AddUser(name,password,quanxian,username);
    }
    @Override
    public  Integer DeleteUser(String username,String name){
        return this.userDao.DeleteUser(username,name);
    }

    @Override
    public Integer search(String username) {
        return this.userDao.search(username);
    }

    @Override
    public User findByUsername(String username) {
        return this.userDao.findByUsername(username);
    }

    @Override
    public Integer UpdateUser(String name,String password,String quanxian,String username){
        return this.userDao.UpdateUser(name, password, quanxian, username);
    }
}
