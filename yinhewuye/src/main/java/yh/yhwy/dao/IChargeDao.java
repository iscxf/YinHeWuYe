package yh.yhwy.dao;

import yh.yhwy.bean.Charge;

import java.util.List;

/**
 * @author YQ
 * 定义收费管理的相关方法
 */
public interface IChargeDao {
    //根据条件查询收费记录
    List<Charge> selectChargeInfo(Charge charge);
    //新建收费记录
    int insertChargeInfo(Charge charge);
    //修改收费记录
    int updateChargeInfo(Charge charge);
    //删除收费记录
    int delteChargeInfo(int charid);
}
