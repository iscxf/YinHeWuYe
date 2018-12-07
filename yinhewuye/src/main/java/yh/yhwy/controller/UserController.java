package yh.yhwy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import yh.yhwy.bean.User;
import yh.yhwy.service.UserService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author ljb
 */
@Controller
@RequestMapping("index")
public class UserController {

    @Autowired
    @Qualifier("UserService")
    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }


    @RequestMapping(value = "userLogin.do", method = RequestMethod.GET)
    public String toLogin(){
        return "redirect:/userLogin.jsp";
    }

    @RequestMapping(value = "userLogin.do", method = RequestMethod.POST , produces = "text/html;charset=utf-8")
    @ResponseBody
    public String doLogin(String userid, String userPass, String checkRemem1, HttpSession session, HttpServletResponse response){

//        判断输入的账号密码是否为空
        if ( userid != null && userPass != null){
            //定义字符串类型变量来接收数据库查到的密码
            String upass1 = null;

//          将用户输入的账号转化为int类型（因为数据库中是int类型）
            int uid1 = Integer.parseInt(userid);
            //从数据库中按id查询相应的用户
            User user = userService.findUserByUserid(uid1);
//            判断是否有用户存在，若存在则获取数据库中的密码
            if (user != null) {
                upass1 = user.getUserPass();
            }else {
                return "用户不存在，请从新输入用户！";
            }
            //通过判断用户输入的密码是否与数据库中的密码相同，相同则存进session中，不同则返回错误信息
            if (userPass.equals(upass1)) {
                //将用户存进session中
                session.setAttribute("user",user);
//                判断用户是否选择记住密码
                if (checkRemem1 != null) {
//                  创建两个Cookie对象
                    Cookie userIdCookie = new Cookie("UserId", userid);
                    Cookie userPassCookie = new Cookie("UserPassword", userPass);
//                    设置Cookies有效期为7天
                    userIdCookie.setMaxAge(60 * 60 * 24 * 7);
                    userPassCookie.setMaxAge(60 * 60 * 24 * 7);

                    response.addCookie(userIdCookie);
                    response.addCookie(userPassCookie);
                }
                return "usersuccess_login";
            }else{
                return "用户名或密码错误，请重新登录！";
            }
        }else{
            return "用户名和密码不能为空，请重新输入！";
        }
    }


    //跳转到主页面
    @RequestMapping("userMain.do")
    public String toMain() {
        return "/index/index.jsp";
    }

    //退出登录
    @RequestMapping("userLogout.do")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        //清队session
        session.invalidate();
        return "userLogin.do";
    }






}
