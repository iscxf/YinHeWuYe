package yh.yhwy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import yh.yhwy.bean.CompSuggRepa;
import yh.yhwy.service.ICSRService;

import java.util.Date;

@Controller
@RequestMapping("index")
public class UserCSRController {
    @Autowired
    @Qualifier("csrService")
    private ICSRService csrservice;

    public void setCsrservice(ICSRService csrservice) {
        this.csrservice = csrservice;
    }

//    跳转到投诉
    @RequestMapping("tousu.do")
    public String toTousu(){
        return "/index/tousu.jsp";
    }

    //    跳转到建议
    @RequestMapping("jianyi.do")
    public String toJianyi(){
        return "/index/jianyi.jsp";
    }
    //    跳转到报修
    @RequestMapping("baoxiu.do")
    public String toBaoxiu(){
        return "/index/baoxiu.jsp";
    }


    //    新增记录
    @RequestMapping("addcsr.do")
    public String addComplaint (CompSuggRepa csr){
        Date csrDate=new Date();
        csr.setCsrDate(csrDate);
        if (csrservice.addComplaint(csr)==1) {
            return "redirect:/index/tousu.jsp";
        }else
            return " ";
    }

}
