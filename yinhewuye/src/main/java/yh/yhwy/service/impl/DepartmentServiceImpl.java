package yh.yhwy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import yh.yhwy.bean.Department;
import yh.yhwy.dao.IDepartmentDao;
import yh.yhwy.service.DepartmentService;

import java.util.List;

/**
 * @author ljb
 */
@Service("DepartmentService")
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    @Qualifier("IDepartmentDao")
    private IDepartmentDao iDepartmentDao;

    public void setiDepartmentDao(IDepartmentDao iDepartmentDao) {
        this.iDepartmentDao = iDepartmentDao;
    }

    @Override
    public boolean addDepartment(Department depa) {
        if (iDepartmentDao.inserDepartment(depa) > 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean rmDepartmentByPartid(int partid) {
        if (iDepartmentDao.delectDepartmentByPartid(partid) > 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean rmDepartmentByPartName(String partName) {

        if (iDepartmentDao.delectDepartmentByPartName(partName) > 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean modifyDepartment(Department depa) {

        if (iDepartmentDao.updateDepartment(depa) > 0 ){
            return true;
        }
        return false;
    }

    @Override
    public List<Department> findDepartmentByPartid(int partid) {
        if (partid == 0){
            return null;
        }
        List<Department> departmens = iDepartmentDao.selectDepartmentByPartid(partid);
        if (departmens.size() > 0){
            return departmens;
        }
        return null;
    }

    @Override
    public List<Department> findDepartmentByPartName(String partName) {

        List<Department> departmens = iDepartmentDao.selectDepartmentByPartName(partName);
        if (departmens.size() > 0){
            return departmens;
        }
        return null;
    }

    @Override
    public List<Department> findAllDepartment() {

        List<Department> departmens = iDepartmentDao.selectAllDepartment();
        if (departmens.size() > 0){
            return departmens;
        }
        return null;
    }
}
