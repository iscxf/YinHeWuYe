package yh.yhwy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import yh.yhwy.bean.User;
import yh.yhwy.dao.IUserDao;
import yh.yhwy.service.UserService;

/**
 * @author ljb
 */
@Service("UserService")
public class UserServiceImpl implements UserService {

    @Autowired
    @Qualifier("IUserDao")
    private IUserDao iUserDao;

    public void setiUserDao(IUserDao iUserDao) {
        this.iUserDao = iUserDao;
    }

    @Override
    public User findUserByUserid(int userid) {

        User user = iUserDao.selectUserByUserid(userid);
        if ( user != null ){
            return user;
        }
        return null;
    }
}
