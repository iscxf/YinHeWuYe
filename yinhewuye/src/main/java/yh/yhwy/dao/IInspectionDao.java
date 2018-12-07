package yh.yhwy.dao;

import yh.yhwy.bean.Inspection;

import java.util.List;

/**
 * @author ljb
 */
public interface IInspectionDao {

    //    新增考核信息
    int inserInspection(Inspection insp);

    //    通过考核编码删除考核信息
    int delectInspectionByInspid(int inspid);

    //    通过员工号删除考核信息
    int delectInspectionByStaf_id(int staf_id);

    //    更新考核信息
    int updateInspection(Inspection insp);

    //    通过考核编码查询考核信息
    List<Inspection> selectInspectionByInspid(int inspid);
    //    通过员工号查询考核信息
    List<Inspection> selectInspectionByStaf_id(int staf_id);
    //    通过员工名查询考核信息
    List<Inspection> selectInspectionByStafName(String stafName);
    //    查询全部考核信息
    List<Inspection> selectAllInspection();
}
