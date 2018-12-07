package yh.yhwy.service;

import yh.yhwy.bean.User;

/**
 * @author ljb
 */
public interface UserService {

    User findUserByUserid(int userid);
}
