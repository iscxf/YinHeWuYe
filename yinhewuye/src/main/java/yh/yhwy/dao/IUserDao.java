package yh.yhwy.dao;

import yh.yhwy.bean.User;

/**
 * @author ljb
 */
public interface IUserDao {

    //按账号查询用户
    User selectUserByUserid(int userid);
}
