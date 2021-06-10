package com.example.mapper;

import com.example.model.Order;

import java.util.List;

public interface OrderDao {
    int deleteByPrimaryKey(int orderid);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    List<Order> showOrder();
    List<Order> showOrder2(String userid);
    List<Order> searchBy(Order record);
    int zhifu(int orderid);
}