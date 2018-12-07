package yh.yhwy.dao;

import yh.yhwy.bean.Building;
import yh.yhwy.bean.HousProp;
import yh.yhwy.bean.Resident;

import java.util.List;

/**
 * @author YQ
 * 定义查询小区或大楼信息列表的相关方法
 */
public interface ICommInfoDao {
    //查询房产信息
    List<HousProp> selectHousInfo(HousProp housProp);
    //增加房产信息
    int insertHousInfo(HousProp housProp);
    //修改房产信息
    int updateHousInfo(HousProp housProp);
    //删除房产信息
    int deleteHousInfo(int id);

    //查询住户信息
    List<Resident> selectResiInfo(Resident resident);
    //增加住户信息
    int insertResiInfo(Resident resident);
    //修改住户信息
    int updateResiInfo(Resident resident);
    //删除住户信息
    int deleteResiInfo(int resid);

    //查询楼宇信息
    List<Building> selectBuildingInfo(Building building);
    //增加楼宇信息
    int insertBuildingInfo(Building building);
    //修改楼宇信息
    int updateBuildingInfo(Building building);
    //删除楼宇信息
    int deleteBuildingInfo(int builid);

    //根据用户房产号查出房产和住户信息
    HousProp selectUserInfoByHpid(String hp_id);
}
