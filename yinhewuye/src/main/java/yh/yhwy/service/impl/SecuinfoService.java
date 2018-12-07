package yh.yhwy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import yh.yhwy.bean.Secuinfo;
import yh.yhwy.dao.SecuinfoMapper;

import java.util.List;

@Service
public class SecuinfoService {

        @Autowired
        private SecuinfoMapper secuinfoMapper;

        public List<Secuinfo> getAll() {
            // TODO Auto-generated method stub
            return secuinfoMapper.selectByExampleWithName(null);
        }

        public Secuinfo getbyId(){

            return secuinfoMapper.selectByPrimaryKeyWithName(null);
        }

    public List<Secuinfo> getbyName() {
        // TODO Auto-generated method stub
        return secuinfoMapper.selectByName(null);
    }

    public List<Secuinfo> getbyTime() {
        // TODO Auto-generated method stub
        return secuinfoMapper.selectByTime(null);
    }

    public int save(Secuinfo secuinfo) {
        // TODO Auto-generated method stub
        return secuinfoMapper.insert(secuinfo);
    }

    public int del(Integer id) {
        // TODO Auto-generated method stub
        return secuinfoMapper.deleteByPrimaryKeyWithName(id);
    }

    public int udate(Secuinfo secuinfo){

            return secuinfoMapper.updateByPrimaryKeyWithName(secuinfo);
    }

}
