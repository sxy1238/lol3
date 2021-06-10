package com.example.mapper;

import com.example.model.Food;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FoodDao {
    int insert( Food record);
   List<Food> SelectFood();
    int insertSelective(Food record);
    int deleteById(String id);
    int updateById(Food record);
    List<Food> search(String name);
   int searchByKind(String kind);
    List<Food> selectByKind(String kind);
   Food searchById(int id);
    int jkc(Food record);
}