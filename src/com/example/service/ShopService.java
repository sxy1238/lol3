package com.example.service;

import com.example.model.Food;
import com.example.model.Shop;

import java.util.List;

public interface ShopService {
    int insert(Shop record);
    int selectCount(int id);
    int insertSelective(Shop record);
    List<Shop> select(String username);
    int delete(Shop record);
    int deleteAll(String username);
   Shop search(Shop record);
   int update(Shop record);
}
