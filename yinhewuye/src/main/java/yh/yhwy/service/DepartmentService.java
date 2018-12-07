package yh.yhwy.service;

import yh.yhwy.bean.Department;

import java.util.List;

/**
 * @author ljb
 */
public interface DepartmentService {

    //    新增部门信息
    boolean addDepartment(Department depa);

    //    通过部门编号删除部门
    boolean rmDepartmentByPartid(int partid);

    //    通过部门名称删除部门
    boolean rmDepartmentByPartName(String partName);

    //    更新部门信息
    boolean modifyDepartment(Department depa);

    //    通过部门编号查询部门
    List<Department> findDepartmentByPartid(int partid);
    //    通过部门名称查询部门
    List<Department> findDepartmentByPartName(String partName);

    //    查询全部部门信息
    List<Department> findAllDepartment();
}
