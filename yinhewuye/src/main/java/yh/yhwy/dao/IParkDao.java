package yh.yhwy.dao;

import yh.yhwy.bean.History;
import yh.yhwy.bean.Park;
import yh.yhwy.bean.SpotMana;

import java.util.List;

public interface IParkDao {

    ///////////////////////////
    //    停车场管理表操作   //
    //////////////////////////
//    新增停车场
    int addPark(Park park);

//    查询全部车位信息
    List<Park> selectAllPark();

//    根据停车号来查询停车场信息
    List<Park> selectParkById(int id);

//    根据停车号来修改停车场
    int updateParkById(Park park);

//    根据停车号来删除停车场
    int deleteParkById(int id);

    ///////////////////////////
    //    停车位管理表操作   //
    //////////////////////////

//        新增停车位信息（不符合实际业务，保留）
    int addSpotMana(SpotMana spotMana);

//        查询所有停车位信息
    List<SpotMana> selectAllSpotMana();

//        查询所有已经出租的停车位信息
    List<SpotMana> selectSpotManaIsRent();

//        根据停车位号来查询停车位信息
    List<SpotMana> selectSpotManaById(int id);

//        根据用户id来查询停车位信息
    List<SpotMana> selectSpotManaByUserId(int id);

//        根据停车位号来修改停车位信息
    int updateSpotManaById(SpotMana spotMana);

//        根据停车位号来删除停车位
    int deleteSpotManaById(int id);

    ///////////////////////////////
    //    停车位历史记录表操作   //
    //////////////////////////////

//         查询所有停车位历史记录信息
    List<History> selectAllHistory();

//    根据停车位号来查询停车位历史记录信息
    List<History> selectAllHistoryById(Integer id);

//         根据历史编号来删除停车位相关历史记录
    int deleteHistoryById(int id);
}
