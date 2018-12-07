package yh.yhwy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import yh.yhwy.bean.HousTran;
import yh.yhwy.dao.IHousTranDao;
import yh.yhwy.service.IHousTranService;

import java.util.List;

/**
 * @author YQ
 */
@Service("HousTranService")
public class HousTranServiceImpl implements IHousTranService {
    @Autowired
    @Qualifier("IHousTranDao")
    private IHousTranDao iHousTranDao;

    public void setiHousTranDao(IHousTranDao iHousTranDao) {
        this.iHousTranDao = iHousTranDao;
    }

    //根据定位条件查询房产交接记录
    @Override
    public List<HousTran> queryHousTranInfo(HousTran housTran) {
        List<HousTran> housTrans = iHousTranDao.selectHousTranInfo(housTran);

        return housTrans;
    }

    //新建交接信息
    @Override
    public boolean addHousTranInfo(HousTran housTran) {
        if (iHousTranDao.insertHousTranInfo(housTran) > 0) {
            return true;
        }
        return false;
    }

    //修改交接信息
    @Override
    public boolean modifyHousTranInfo(HousTran housTran) {
        if (iHousTranDao.updateHousTranInfo(housTran) > 0) {
            return true;
        }
        return false;
    }

    //删除交接信息
    @Override
    public boolean deleteHousTranInfo(int htid) {
        if (iHousTranDao.deleteHousTranInfo(htid) > 0) {
            return true;
        }
        return false;
    }
}
