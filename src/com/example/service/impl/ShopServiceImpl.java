package com.example.service.impl;

import com.example.mapper.OrderDao;
import com.example.mapper.ShopDao;
import com.example.model.Order;
import com.example.model.Shop;
import com.example.service.OrderService;
import com.example.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ShopServiceImpl implements ShopService {
    @Autowired
    private ShopDao shopDao;


    @Override
    public int insert(Shop record) {
        return this.shopDao.insert(record);
    }

    @Override
    public int selectCount(int id) {
        return this.shopDao.selectCount(id);
    }

    @Override
    public int insertSelective(Shop record) {
        return 0;
    }

    @Override
    public List<Shop> select(String username) {
        return this.shopDao.select(username);
    }

    @Override
    public int delete(Shop record) {
        return this.shopDao.delete(record);
    }

    @Override
    public int deleteAll(String username) {
        return this.shopDao.deleteAll(username);
    }

    @Override
    public Shop search(Shop record) {
        return this.shopDao.search(record);
    }

    @Override
    public int update(Shop record) {
        return this.shopDao.update(record);
    }

}
