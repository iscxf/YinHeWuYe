package yh.yhwy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import yh.yhwy.bean.History;
import yh.yhwy.bean.Park;
import yh.yhwy.bean.SpotMana;
import yh.yhwy.dao.IParkDao;
import yh.yhwy.service.IParkService;

import java.util.List;

@Service("parkService")
public class IParkServiceImpl implements IParkService {
    @Autowired
    @Qualifier("IParkDao")
    private IParkDao dao;

    ///////////////////////////
    //    停车场管理表操作   //
    //////////////////////////
    public void setDao(IParkDao dao) {
        this.dao = dao;
    }
//    新增停车场信息
    @Override
    public int addPark(Park park) {
        int count = dao.addPark(park);
        if (count > 0) {
            return 1;
        }
            return  0;
    }
//    查询所有停车场信息
    @Override
    public List<Park> selectAllPark() {
        List<Park> count = dao.selectAllPark();
        return count;
    }
//    根据停车号来查询停车场信息
    @Override
    public List<Park> selectParkById(int id) {
        List<Park> count = dao.selectParkById(id);
        return count;
    }

    @Override
    public int updateParkById(Park park) {
        if(dao.updateParkById(park)>=1)
            return 1;
        else return 0;
    }

    //    根据停车号来删除停车场
    @Override
    public int deleteParkById(int id) {
        if(dao.deleteParkById(id)==1)
            return 1;
        else return 0;
    }

    ///////////////////////////
    //    停车位管理表操作   //
    //////////////////////////

//    新增停车位信息（不符合实际业务，保留）
    @Override
    public int addSpotMana(SpotMana spotMana) {
        return 0;
    }
//    查询所有停车位信息
    @Override
    public List<SpotMana> selectAllSpotMana() {
        List<SpotMana> count = dao.selectAllSpotMana();
        return count;
    }
//    查询所有已经出租的停车位信息
    @Override
    public List<SpotMana> selectSpotManaIsRent() {
        List<SpotMana> count = dao.selectSpotManaIsRent();
        return count;
    }
//    根据停车位号来查询停车位信息
    @Override
    public List<SpotMana> selectSpotManaById(int id) {
        List<SpotMana> count = dao.selectSpotManaById(id);
        return count;
    }

    @Override
    public List<SpotMana> selectSpotManaByUserId(int id) {
        List<SpotMana> count = dao.selectSpotManaByUserId(id);
        return count;
    }

    //    根据停车位号来修改停车位
    @Override
    public int updateSpotManaById(SpotMana spotMana) {
        if(dao.updateSpotManaById(spotMana)==1)
            return 1;
        else return 0;
    }

    //    根据停车位号来删除停车位
    @Override
    public int deleteSpotManaById(int id) {
        if(dao.deleteSpotManaById(id)==1)
            return 1;
        else return 0;
    }

    ///////////////////////////////
    //    停车位历史记录表操作   //
    //////////////////////////////

//    查询所有停车位历史记录信息
    @Override
    public List<History> selectAllHistory() {
        List<History> count = dao.selectAllHistory();
        return count;
    }

//    根据停车位号来查询停车位历史记录信息
    @Override
    public List<History> selectAllHistoryById(Integer id) {
        List<History> count = dao.selectAllHistoryById(id);
        return count;
    }

    //    根据停历史编号来删除停车位相关历史记录
    @Override
    public int deleteHistoryById(int id) {
        if(dao.deleteHistoryById(id)==1)
            return 1;
        else return 0;
    }
}
