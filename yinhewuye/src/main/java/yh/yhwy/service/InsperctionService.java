package yh.yhwy.service;

import yh.yhwy.bean.Inspection;

import java.util.List;

/**
 * @author ljb
 */
public interface InsperctionService {

    //    新增考核信息
    boolean addInspection(Inspection insp);

    //    通过考核编码删除考核信息
    boolean  rmInspectionByInspid(int inspid);

    //    通过员工号删除考核信息
    boolean  rmInspectionByStaf_id(int staf_id);

    //    更新考核信息
    boolean  modifyInspection(Inspection insp);

    //    通过考核编码查询考核信息
    List<Inspection> findInspectionByInspid(int inspid);
    //    通过员工号查询考核信息
    List<Inspection> findInspectionByStaf_id(int staf_id);
    //    通过员工名查询考核信息
    List<Inspection> findInspectionByStafName(String stafName);
    //    查询全部考核信息
    List<Inspection> findAllInspection();
}
