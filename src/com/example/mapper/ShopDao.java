package com.example.mapper;

import com.example.model.Shop;

import java.util.List;

public interface ShopDao {
    int insert(Shop record);

    int insertSelective(Shop record);
    List<Shop> select(String username);
    int delete(Shop record);
    int deleteAll(String username);
    Shop search(Shop record);
    int update(Shop record);
    int selectCount(int id);
}