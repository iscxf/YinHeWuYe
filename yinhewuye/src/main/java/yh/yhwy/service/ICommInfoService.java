package yh.yhwy.service;

import yh.yhwy.bean.Building;
import yh.yhwy.bean.HousProp;
import yh.yhwy.bean.Resident;

import java.util.List;

/**
 * @author YQ
 */
public interface ICommInfoService {
    //根据条件查询房产信息
    List<HousProp> queryHousInfo(HousProp housProp);
    //增加房产信息
    boolean addHousInfo(HousProp housProp);
    //修改房产信息
    boolean modifyHousInfo(HousProp housProp);
    //删除房产信息
    boolean deleteHousInfo(int id);

    //根据条件查询住户信息
    List<Resident> queryResiInfo(Resident resident);
    //增加住户信息
    boolean addResiInfo(Resident resident);
    //修改住户信息
    boolean modifyResiInfo(Resident resident);
    //删除住户信息
    boolean deleteResiInfo(int resid);

    //查询楼宇信息
    List<Building> queryBuildingInfo(Building building);
    //增加楼宇信息
    boolean addBuildingInfo(Building building);
    //修改楼宇信息
    boolean modifyBuildingInfo(Building building);
    //删除楼宇信息
    boolean deleteBuildingInfo(int builid);

    //根据用户房产号查出房产和住户信息
    HousProp queryUserInfoByHpid(String hp_id);
}
