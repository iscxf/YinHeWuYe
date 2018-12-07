package yh.yhwy.dao;

import yh.yhwy.bean.Department;

import java.util.List;

/**
 * @author ljb
 */
public interface IDepartmentDao {

    //    新增部门信息
    int inserDepartment(Department depa);

    //    通过部门编号删除部门
    int delectDepartmentByPartid(int partid);

    //    通过部门名称删除部门
    int delectDepartmentByPartName(String partName);

    //    更新部门信息
    int updateDepartment(Department depa);

    //    通过部门编号查询部门
    List<Department> selectDepartmentByPartid(int partid);
    //    通过部门名称查询部门
    List<Department> selectDepartmentByPartName(String partName);

    //    查询全部部门信息
    List<Department> selectAllDepartment();
}
