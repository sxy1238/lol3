package com.example.service.impl;

import com.example.mapper.FoodDao;
import com.example.model.Food;
import com.example.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class FoodServiceImpl implements FoodService {
    @Autowired
    private FoodDao foodDao;

    @Override
    public int insert(Food record) {
        return this.foodDao.insert(record);
    }

    @Override
    public List<Food> SelectFood() {
        return this.foodDao.SelectFood();
    }

    @Override
    public int insertSelective(Food record) {
        return 0;
    }

    @Override
    public int deleteById(String id) {

        return this.foodDao.deleteById(id);
    }

    @Override
    public int updateById(Food record) {
        return this.foodDao.updateById(record);
    }

    @Override
    public List<Food> search(String name) {
        return this.foodDao.search(name);
    }

    @Override
    public int searchByKind(String kind) {
        return this.foodDao.searchByKind(kind);
    }

    @Override
    public List<Food> selectByKind(String kind) {
        return this.foodDao.selectByKind(kind);
    }

    @Override
    public Food searchById(int id) {
        return this.foodDao.searchById(id);
    }

    @Override
    public int jkc(Food record) {
        return this.foodDao.jkc(record);
    }
}
