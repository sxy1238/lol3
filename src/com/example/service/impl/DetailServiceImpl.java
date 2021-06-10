package com.example.service.impl;

import com.example.mapper.DetailDao;
import com.example.mapper.OrderDao;
import com.example.model.Detail;
import com.example.model.Order;
import com.example.service.DetailService;
import com.example.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DetailServiceImpl implements DetailService {
     @Autowired
     private DetailDao detailDao;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(Detail record) {
        return this.detailDao.insert(record);
    }

    @Override
    public int insertSelective(Detail record) {
        return 0;
    }

    @Override
    public Detail selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Detail record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Detail record) {
        return 0;
    }

    @Override
    public List<Detail> ReadOrder(int orderid) {
        return this.detailDao.ReadOrder(orderid);
    }

    @Override
    public int searchByFood(String foodid) {
        return this.detailDao.searchByFood(foodid);
    }

    @Override
    public int[] tuijian(String userid) {
        return this.detailDao.tuijian(userid);
    }

    @Override
    public List<Detail> bb(int foodid) {
        return this.detailDao.bb(foodid);
    }
}
