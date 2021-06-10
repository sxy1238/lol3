package com.example.mapper;

import com.example.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    public List<User> gl();
    public User dl(@Param("username") String username,@Param("password") String password);
    public Integer fire(@Param("name") String name,@Param("username") String username, @Param("password") String password,
                        @Param("quanxian") String quanxian);
    public List<User> SelectUser(@Param("username") String username,@Param("name") String name,@Param("quanxian") String quanxian);
    public Integer DeleteUser(@Param("username") String username,@Param("name") String name);
    public Integer AddUser(@Param("name") String name, @Param("password") String password,
                           @Param("quanxian") String quanxian, @Param("username") String username);
    public Integer UpdateUser(@Param("name") String name, @Param("password") String password,
                           @Param("quanxian") String quanxian, @Param("username") String username);
    public Integer search(String username);
    public User findByUsername(String username);
}
