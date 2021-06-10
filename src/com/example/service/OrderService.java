package com.example.service;




import com.example.model.Order;

import java.util.List;

public interface OrderService {
    int deleteByPrimaryKey(int orderid);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    List<Order> showOrder();
    List<Order> searchBy(Order record);
    int zhifu(int orderid);
    List<Order> showOrder2(String userid);
}
