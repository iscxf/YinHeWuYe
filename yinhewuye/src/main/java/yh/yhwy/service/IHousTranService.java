package yh.yhwy.service;

import yh.yhwy.bean.HousTran;

import java.util.List;

/**
 * @author YQ
 */
public interface IHousTranService {
    //根据定位条件查询房产交接记录
    List<HousTran> queryHousTranInfo(HousTran housTran);
    //新建交接信息
    boolean addHousTranInfo(HousTran housTran);
    //修改交接信息
    boolean modifyHousTranInfo(HousTran housTran);
    //删除交接信息
    boolean deleteHousTranInfo(int htid);
}
