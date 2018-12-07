package yh.yhwy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import yh.yhwy.bean.Staff;
import yh.yhwy.dao.IStaffDao;
import yh.yhwy.service.StaffService;

import java.util.List;

/**
 * @author ljb
 */
@Service("StaffService")
public class StaffServiceImpl implements StaffService {

    @Autowired
    @Qualifier("IStaffDao")
    private IStaffDao iStaffDao;

    public void setiStaffDao(IStaffDao iStaffDao) {
        this.iStaffDao = iStaffDao;
    }

    @Override
    public boolean addStaff(Staff staf) {
        if (iStaffDao.inserStaff(staf) > 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean rmStaffByStafid(int stafid) {
        if (iStaffDao.delectStaffByStafid(stafid) > 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean rmStaffByStafName(String stafName) {

        if (iStaffDao.delectStaffByStafName(stafName) > 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean modifyStaff(Staff staf) {

        if (iStaffDao.updateStaff(staf) > 0){
            return true;
        }
        return false;
    }

    @Override
    public List<Staff> findStaffByStafid(int stafid) {

        List<Staff> staffs = iStaffDao.selectStaffByStafid(stafid);
        if (staffs.size() > 0){
            return staffs;
        }

        return null;
    }

    @Override
    public List<Staff> findStaffByStafName(String stafName) {

        List<Staff> staffs = iStaffDao.selectStaffByStafName(stafName);
        if (staffs.size() > 0){
            return staffs;
        }
        return null;
    }

    @Override
    public List<Staff> findStaffByStafSex(String stafSex) {
        List<Staff> staffs = iStaffDao.selectStaffByStafSex(stafSex);
        if (staffs.size() > 0){
            return staffs;
        }
        return null;
    }

    @Override
    public List<Staff> findStaffByStafAge(int minstafAge, int maxstafAge) {
        List<Staff> staffs = iStaffDao.selectStaffByStafAge(minstafAge,maxstafAge);
        if (staffs.size() > 0){
            return staffs;
        }
        return null;
    }

    @Override
    public List<Staff> findStaffByPartName(String partName) {
        List<Staff> staffs = iStaffDao.selectStaffByPartName(partName);
        if (staffs.size() > 0){
            return staffs;
        }
        return null;
    }

    @Override
    public List<Staff> findAllStaff() {
        List<Staff> staffs = iStaffDao.selectAllStaff();
        if (staffs.size() > 0){
            return staffs;
        }
        return null;
    }
}
