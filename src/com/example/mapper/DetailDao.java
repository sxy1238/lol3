package com.example.mapper;

import com.example.model.Detail;

import java.util.List;

public interface DetailDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Detail record);

    int insertSelective(Detail record);

    Detail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Detail record);

    int updateByPrimaryKey(Detail record);
    List<Detail> ReadOrder(int orderid);
    int searchByFood(String foodid);
    int[] tuijian(String userid);
    List<Detail> bb(int foodid);
}