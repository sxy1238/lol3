package com.example.service;

import com.example.mapper.FoodDao;
import com.example.model.Food;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface FoodService {
    int insert(Food record);
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
