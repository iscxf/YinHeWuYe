package yh.yhwy.dao;

import yh.yhwy.bean.Admin;

/**
 * @author ljb
 */
public interface IAdminDao {

    //按账号查询管理员
    Admin selectAdminByAdminid(int adminid);
}
