package com.example.service;



import com.example.model.Notice;
import com.example.model.User;

import java.util.List;

public interface NoticeService {
    int deleteByPrimaryKey(Integer id);

    int insert(Notice record);

    int insertSelective(Notice record);

    Notice selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Notice record);

    int updateByPrimaryKey(Notice record);
    List<Notice> showNotice();
}
