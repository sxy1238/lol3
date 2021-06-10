package com.example.service.impl;

import com.example.mapper.NoticeDao;
import com.example.mapper.OrderDao;
import com.example.model.Notice;
import com.example.model.Order;
import com.example.service.NoticeService;
import com.example.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;


    @Override
    public int deleteByPrimaryKey(int orderid) {
        return this.orderDao.deleteByPrimaryKey(orderid);
    }

    @Override
    public int insert(Order record) {
        return this.orderDao.insert(record);
    }

    @Override
    public int insertSelective(Order record) {
        return 0;
    }

    @Override
    public Order selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Order record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Order record) {
        return 0;
    }

    @Override
    public List<Order> showOrder() {
        return this.orderDao.showOrder();
    }

    @Override
    public List<Order> searchBy(Order record) {
        return this.orderDao.searchBy(record);
    }

    @Override
    public int zhifu(int orderid) {
        return this.orderDao.zhifu(orderid);
    }

    @Override
    public List<Order> showOrder2(String userid) {
        return this.orderDao.showOrder2(userid);
    }
}
