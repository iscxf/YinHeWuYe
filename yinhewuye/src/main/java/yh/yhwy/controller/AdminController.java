package yh.yhwy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import yh.yhwy.bean.Admin;
import yh.yhwy.service.AdminService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author ljb
 */
@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    @Qualifier("AdminService")
    private AdminService adminService;

    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    @RequestMapping(value = "adminLogin.do", method = RequestMethod.GET)
    public String toLogin() {

        return "redirect:/adminLogin.jsp";
}

    @RequestMapping(value = "adminLogin.do", method = RequestMethod.POST, produces = "text/html;charset=utf-8")
    @ResponseBody
    public String doLogin(String adminid, String adminPass, String checkRemem, HttpSession session, HttpServletResponse response) {
        // 判断输入的账号密码是否为空
        if (adminid != null && adminPass != null) {

            //定义字符串类型变量来接收数据库查到的密码
            String apass = null;

//          将用户输入的账号转化为int类型（因为数据库中是int类型）
            int aid = Integer.parseInt(adminid);
            //从数据库中按id查询相应的用户
            Admin admin = adminService.findAdminByAdminid(aid);

//            判断是否有用户存在，若存在则获取数据库中的密码
            if (admin != null) {
                apass = admin.getAdminPass();
            } else {
                return "用户不存在，请从新输入用户！";
            }
            //通过判断用户输入的密码是否与数据库中的密码相同，相同则存进session中，不同则返回错误信息
            if (adminPass.equals(apass)) {
                //将用户存进session中
                session.setAttribute("admin", admin);
//                判断用户是否选择记住密码
                if (checkRemem != null) {
//                  创建两个Cookie对象
                    Cookie adminIdCookie = new Cookie("AdminId", adminid);
                    Cookie adminPassCookie = new Cookie("AdminPassword", adminPass);
//                    设置Cookies有效期为7天
                    adminIdCookie.setMaxAge(60 * 60 * 24 * 7);
                    adminPassCookie.setMaxAge(60 * 60 * 24 * 7);

                    response.addCookie(adminIdCookie);
                    response.addCookie(adminPassCookie);
                }
                return "success_login";
            } else {
                return "用户名或密码错误，请重新登录！";
            }
        } else {
            return "用户名和密码不能为空，请重新输入!";
        }
    }

    //    跳转到主界面
    @RequestMapping("adminMain.do")
    public String toMain() {
        return "/admin/admin.jsp";
    }

    //退出登录
    @RequestMapping("adminLogout.do")
    public String logout(HttpSession session) {
        session.removeAttribute("admin");
        //清队session
        session.invalidate();
        return "adminLogin.do";
    }
}
