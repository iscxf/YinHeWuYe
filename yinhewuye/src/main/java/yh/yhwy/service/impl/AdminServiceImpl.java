package yh.yhwy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import yh.yhwy.bean.Admin;
import yh.yhwy.bean.User;
import yh.yhwy.dao.IAdminDao;
import yh.yhwy.dao.IUserDao;
import yh.yhwy.service.AdminService;

/**
 * @author ljb
 */
@Service("AdminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    @Qualifier("IAdminDao")
    private IAdminDao iAdminDao;

    public void setiAdminDao(IAdminDao iAdminDao) {
        this.iAdminDao = iAdminDao;
    }

    @Override
    public Admin findAdminByAdminid(int adminid) {
        if (adminid == 0){
            return null;
        }
        Admin admin = iAdminDao.selectAdminByAdminid(adminid);
        if (admin != null){
            return admin;
        }
        return null;
    }
}
