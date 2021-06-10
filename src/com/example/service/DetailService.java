package com.example.service;




import com.example.model.Detail;
import com.example.model.Order;

import java.util.List;

public interface DetailService {
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
