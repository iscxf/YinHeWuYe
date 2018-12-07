package yh.yhwy.service;

import yh.yhwy.bean.Charge;

import java.util.List;

/**
 * @author YQ
 */
public interface IChargeService {
    //根据条件查询收费记录
    List<Charge> queryChargeInfo(Charge charge);
    //新建收费记录
    boolean addChargeInfo(Charge charge);
    //修改收费记录
    boolean modifyChargeInfo(Charge charge);
    //删除收费记录
    boolean deleteChargeInfo(int charid);
}
