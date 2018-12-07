package yh.yhwy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import yh.yhwy.bean.Dailsecu;
import yh.yhwy.dao.DailsecuMapper;

import java.util.List;

@Service
public class DailSecuService {
    @Autowired
    private DailsecuMapper dailsecuMapper;

    public List<Dailsecu> getAll() {
        // TODO Auto-generated method stub
        return dailsecuMapper.selectByExampleWithStaf(null);
    }


    public List<Dailsecu> getbyName(String name) {
        // TODO Auto-generated method stub
        return dailsecuMapper.selectByPrimaryKeyWithName(name);
    }


    public int save(Dailsecu dailsecu) {
        // TODO Auto-generated method stub
        return dailsecuMapper.insert(dailsecu);
    }

    public int del(Integer id) {
        // TODO Auto-generated method stub
        return dailsecuMapper.deleteByPrimaryKeyWithStaf(id);
    }

    public int udate(Dailsecu dailsecu){

        return dailsecuMapper.updateByPrimaryKeyWithStaf(dailsecu);
    }
}
