package yh.yhwy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import yh.yhwy.bean.Building;
import yh.yhwy.bean.HousProp;
import yh.yhwy.bean.Resident;
import yh.yhwy.dao.ICommInfoDao;
import yh.yhwy.service.ICommInfoService;

import java.util.List;

/**
 * @author YQ
 */
@Service("CommInfoService")
public class CommInfoServiceImpl implements ICommInfoService {
    @Autowired
    @Qualifier("ICommInfoDao")
    private ICommInfoDao iCommInfoDao;
    /*@Autowired
    @Qualifier("IHousTranDao")
    private IHousTranDao iHousTranDao;*/

    public void setiCommInfoDao(ICommInfoDao iCommInfoDao) {
        this.iCommInfoDao = iCommInfoDao;
    }

    /*public void setiHousTranDao(IHousTranDao iHousTranDao) {
        this.iHousTranDao = iHousTranDao;
    }*/

    //查询房产信息
    @Override
    public List<HousProp> queryHousInfo(HousProp housProp) {
        List<HousProp> housProps = iCommInfoDao.selectHousInfo(housProp);

        return housProps;
    }

    //增加房产信息
    @Override
    public boolean addHousInfo(HousProp housProp) {
        if (iCommInfoDao.insertHousInfo(housProp) > 0) {
            return true;
        } else {
            return false;
        }
    }
    //修改房产信息
    @Override
    public boolean modifyHousInfo(HousProp housProp) {
        if (iCommInfoDao.updateHousInfo(housProp) > 0) {
            return true;
        } else {
            return false;
        }
    }
    //删除房产信息
    @Override
    public boolean deleteHousInfo(int id) {
        if (iCommInfoDao.deleteHousInfo(id) > 0) {
            return true;
        } else {
           return false;
        }
    }
    //根据条件查询住户信息
    @Override
    public List<Resident> queryResiInfo(Resident resident) {
        List<Resident> residents = iCommInfoDao.selectResiInfo(resident);

        return residents;
    }
    //增加住户信息
    @Override
    public boolean addResiInfo(Resident resident) {
        if (iCommInfoDao.insertResiInfo(resident) > 0) {
            return true;
        } else {
            return false;
        }
    }
    //修改住户信息
    @Override
    public boolean modifyResiInfo(Resident resident) {
        if (iCommInfoDao.updateResiInfo(resident) > 0) {
            return true;
        } else {
            return false;
        }
    }
    //删除住户信息
    @Override
    public boolean deleteResiInfo(int resid) {
        if (iCommInfoDao.deleteResiInfo(resid) > 0) {
            return true;
        } else {
            return false;
        }
    }

    //查询楼宇信息
    @Override
    public List<Building> queryBuildingInfo(Building building) {
        List<Building> buildings = iCommInfoDao.selectBuildingInfo(building);

        return buildings;
    }
    //增加楼宇信息
    @Override
    public boolean addBuildingInfo(Building building) {
        if (iCommInfoDao.insertBuildingInfo(building) > 0) {
            return true;
        } else {
            return false;
        }
    }
    //修改楼宇信息
    @Override
    public boolean modifyBuildingInfo(Building building) {
        if (iCommInfoDao.updateBuildingInfo(building) > 0) {
            return true;
        } else {
            return false;
        }
    }
    //删除楼宇信息
    @Override
    public boolean deleteBuildingInfo(int builid) {
        if (iCommInfoDao.deleteBuildingInfo(builid) > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public HousProp queryUserInfoByHpid(String hp_id) {
        HousProp housProp = iCommInfoDao.selectUserInfoByHpid(hp_id);

        return housProp;
    }
}
