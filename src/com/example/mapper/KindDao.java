package com.example.mapper;

import com.example.model.Kinds;

import java.util.List;

public interface KindDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Kinds record);

    int insertSelective(Kinds record);

    Kinds selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Kinds record);

    int updateByPrimaryKey(Kinds record);

    List<Kinds> showKinds();
    List<Kinds> searchByKind(String kind);
}