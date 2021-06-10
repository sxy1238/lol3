package com.example.service.impl;

import com.example.mapper.FoodDao;
import com.example.mapper.NoticeDao;
import com.example.model.Food;
import com.example.model.Notice;
import com.example.service.FoodService;
import com.example.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    private NoticeDao noticeDao;


    @Override
    public int deleteByPrimaryKey(Integer id) {
        return this.noticeDao.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Notice record) {
        return this.noticeDao.insert(record);
    }

    @Override
    public int insertSelective(Notice record) {
        return 0;
    }

    @Override
    public Notice selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Notice record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Notice record) {
        return 0;
    }

    @Override
    public List<Notice> showNotice() {
        return this.noticeDao.showNotice();
    }
}
