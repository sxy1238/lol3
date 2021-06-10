package com.example.service;



import com.example.model.User;

import java.util.List;

public interface UserService {
    public List<User> SelectUser(String username, String name, String quanxian);
    public User dl(String username,String password);
    public List<User> gl();
    public Integer AddUser(String name,String password,String quanxian,String username);
    public Integer fire(String name,String username,String password,String quanxian);
    public Integer UpdateUser(String name,String password,String quanxian,String username);
    public Integer DeleteUser(String username,String name);
    public Integer search(String username);
    public User findByUsername(String username);
}
