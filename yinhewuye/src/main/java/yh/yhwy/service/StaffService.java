package yh.yhwy.service;

import yh.yhwy.bean.Staff;

import java.util.List;

/**
 * @author ljb
 */
public interface StaffService {

    //    新增员工信息
    boolean addStaff(Staff staf);

    //    通过员工号删除员工信息
    boolean rmStaffByStafid(int stafid);

    //    通过员工姓名删除信息
    boolean rmStaffByStafName(String stafName);

    //    更新员工信息
    boolean modifyStaff(Staff staf);

    //    通过员工号查询员工信息
    List<Staff> findStaffByStafid(int stafid);
    //    通过员工姓名查询员工信息
    List<Staff> findStaffByStafName(String stafName);
    //    通过员工性别查询员工信息
    List<Staff> findStaffByStafSex(String stafSex);
    //    通过员工年龄范围查询员工信息
    List<Staff> findStaffByStafAge(int minstafAge, int maxstafAge);

    //    通过部门名称查询员工信息
    List<Staff> findStaffByPartName(String partName);

    //    查询全部员工信息
    List<Staff> findAllStaff();
}
