package yh.yhwy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import yh.yhwy.bean.Charge;
import yh.yhwy.dao.IChargeDao;
import yh.yhwy.service.IChargeService;

import java.util.List;

/**
 * @author YQ
 */
@Service("ChargeService")
public class ChargeServiceImpl implements IChargeService {
    @Autowired
    @Qualifier("IChargeDao")
    private IChargeDao iChargeDao;

    public void setiChargeDao(IChargeDao iChargeDao) {
        this.iChargeDao = iChargeDao;
    }

    //根据条件查询收费记录
    @Override
    public List<Charge> queryChargeInfo(Charge charge) {
        List<Charge> charges = iChargeDao.selectChargeInfo(charge);

        return charges;
    }

    //新建收费记录
    @Override
    public boolean addChargeInfo(Charge charge) {
        if (iChargeDao.insertChargeInfo(charge) > 0) {
            return true;
        }
        return false;
    }

    //修改收费记录
    @Override
    public boolean modifyChargeInfo(Charge charge) {
        if (iChargeDao.updateChargeInfo(charge) > 0) {
            return true;
        }
        return false;
    }

    //删除收费记录
    @Override
    public boolean deleteChargeInfo(int charid) {
        if (iChargeDao.delteChargeInfo(charid) > 0) {
            return true;
        }
        return false;
    }
}
