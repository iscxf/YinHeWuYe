package yh.yhwy.dao;

import yh.yhwy.bean.Inspection;
import yh.yhwy.bean.Staff;

import java.util.List;

/**
 * @author ljb
 */
public interface IStaffDao {

    //    新增员工信息
    int inserStaff(Staff staf);

    //    通过员工号删除员工信息
    int delectStaffByStafid(int stafid);

    //    通过员工姓名删除信息
    int delectStaffByStafName(String stafName);

    //    更新员工信息
    int updateStaff(Staff staf);

    //    通过员工号查询员工信息
    List<Staff> selectStaffByStafid(int stafid);
    //    通过员工姓名查询员工信息
    List<Staff> selectStaffByStafName(String stafName);
    //    通过员工性别查询员工信息
    List<Staff> selectStaffByStafSex(String stafSex);
    //    通过员工年龄范围查询员工信息
    List<Staff> selectStaffByStafAge(int minstafAge, int maxstafAge);

    //    通过部门名称查询员工信息
    List<Staff> selectStaffByPartName(String partName);

    //    查询全部员工信息
    List<Staff> selectAllStaff();
}
