package yh.yhwy.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import yh.yhwy.bean.Charge;
import yh.yhwy.bean.HousProp;
import yh.yhwy.bean.SpotMana;
import yh.yhwy.bean.User;
import yh.yhwy.service.IChargeService;
import yh.yhwy.service.ICommInfoService;
import yh.yhwy.service.IParkService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("index")
public class IndexController {

    @Autowired
    @Qualifier("CommInfoService")
    private ICommInfoService iCommInfoService;

    @Autowired
    @Qualifier("ChargeService")
    private IChargeService iChargeService;

    @Autowired
    @Qualifier("parkService")
    private IParkService parkService;

    public void setiCommInfoService(ICommInfoService iCommInfoService) {
        this.iCommInfoService = iCommInfoService;
    }

    public void setiChargeService(IChargeService iChargeService) {
        this.iChargeService = iChargeService;
    }

    public void setParkService(IParkService parkService) {
        this.parkService = parkService;
    }

    //根据用户房产号查出房产和住户信息
    @RequestMapping("queryUserInfo.do")
    public String queryUserInfo(/*String hp_id,*/ HttpSession session) {
        String hp_id = ((User)session.getAttribute("user")).getHp_id();
        HousProp housProp = iCommInfoService.queryUserInfoByHpid(hp_id);

        session.setAttribute("housProp", housProp);

        return "redirect:fangchan.jsp";
    }

    //根据用户房产号查出缴费记录
    @RequestMapping("queryUserCharge.do")
    public String queryUserCharge(HttpSession session) {
        String hp_id = ((User)session.getAttribute("user")).getHp_id();
        Charge charge = new Charge();
        charge.setHp_id(hp_id);
        List<Charge> charges = iChargeService.queryChargeInfo(charge);

        session.setAttribute("charges", charges);

        return "redirect:jiaofei.jsp";
    }


    //    根据登录用户id来查询停车位信息
    @RequestMapping("selectspotmanabyuser.do")
    public String selectSpotManaByLogin (@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session){
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        int id= ((User)session.getAttribute("user")).getUserid();
        List<SpotMana> spotmana = parkService.selectSpotManaByUserId(id);
        PageInfo page = new PageInfo(spotmana, 5);
        session.setAttribute("spotmana", page);
        return "redirect:tingche.jsp";
    }
}
