package yh.yhwy.dao;

import yh.yhwy.bean.HousTran;

import java.util.List;

/**
 * @author YQ
 */
public interface IHousTranDao {
    //查询房产交接信息记录
    List<HousTran> selectHousTranInfo(HousTran housTran);
    //新建交接信息
    int insertHousTranInfo(HousTran housTran);
    //修改已有交接信息
    int updateHousTranInfo(HousTran housTran);
    //删除交接信息
    int deleteHousTranInfo(int htid);
}
