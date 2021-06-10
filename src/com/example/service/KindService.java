package com.example.service;

import com.example.mapper.FoodDao;
import com.example.mapper.KindDao;
import com.example.model.Food;
import com.example.model.Kinds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
public interface KindService{
    int deleteByPrimaryKey(Kinds kinds);

    int insert(Kinds record);

    int insertSelective(Kinds record);

    Kinds selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Kinds record);

    int updateByPrimaryKey(Kinds record);

    List<Kinds> showKinds();
    List<Kinds> searchByKind(String kind);
}
