package com.example.service.impl;

import com.example.mapper.FoodDao;
import com.example.mapper.KindDao;
import com.example.model.Kinds;
import com.example.model.Word;
import com.example.service.KindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class KindServiceImpl implements KindService {
    @Autowired
    private KindDao kindDao;
    @Autowired
    private FoodDao foodDao;

    @Override
    public int deleteByPrimaryKey(Kinds kinds) {
        int a=0;
        Integer integer=foodDao.searchByKind(kinds.getKind());
        if(integer==0){
            a=kindDao.deleteByPrimaryKey(kinds.getId());
            System.out.println("a="+a);
        }
        return a;
    }

    @Override
    public int insert(Kinds record) {
        return this.kindDao.insert(record);
    }

    @Override
    public int insertSelective(Kinds record) {
        return 0;
    }

    @Override
    public Kinds selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Kinds record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Kinds record) {
        return 0;
    }

    @Override
    public List<Kinds> showKinds() {
        return this.kindDao.showKinds();
    }

    @Override
    public List<Kinds> searchByKind(String kind) {
        return this.kindDao.searchByKind(kind);
    }
}
