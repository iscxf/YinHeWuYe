package yh.yhwy.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import yh.yhwy.bean.CompSuggRepa;
import yh.yhwy.service.ICSRService;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("admin")
public class CSRContorller {
    @Autowired
    @Qualifier("csrService")
    private ICSRService csrservice;

    public void setCsrservice(ICSRService csrservice) {
        this.csrservice = csrservice;
    }

    static String csrtype="all";  //接收的查询方式
    static Integer csrdata; //接收的查询条件数据

    public static void setCsrtype(String csrtype) {
        CSRContorller.csrtype = csrtype;
    }

    public static void setCsrdata(Integer csrdata) {
        CSRContorller.csrdata = csrdata;
    }

//    查询总入口
    @RequestMapping(value = "docsrselect.do")
    public String Select(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session,
                         @RequestParam(value = "id", defaultValue = "0") Integer id, String selecttype){
        csrdata=id;
        csrtype=selecttype;
        switch (selecttype) {
            case "A":
                return "selectallcomplaint.do";
            case "B":
                return "selectallsuggest.do";
            case "C":
                return "selectallrepaid.do";
            case "A1":
            case "B1":
            case "C1":
                return "selectcsr.do";
            default:
                return " ";
        }
    }

    ///////////////////////////////
    //    建议投诉报修操作      //
    //////////////////////////////

    @RequestMapping("selectcsr.do")
    public String selectCSR (@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session){
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        if(csrtype.equals("A1") || csrtype.equals("all")){
            List<CompSuggRepa> csr = csrservice.selectCSRById(1,csrdata);
            PageInfo page = new PageInfo(csr, 5);
            session.setAttribute("csr", page);
            return "redirect:service_1.jsp";
        }else if(csrtype.equals("B1")){
            List<CompSuggRepa> csr = csrservice.selectCSRById(2,csrdata);
            PageInfo page = new PageInfo(csr, 5);
            session.setAttribute("csr", page);
            return "redirect:service_2.jsp";
        }else if (csrtype.equals("C1")){
            List<CompSuggRepa> csr = csrservice.selectCSRById(3,csrdata);
            PageInfo page = new PageInfo(csr, 5);
            session.setAttribute("csr", page);
            return "redirect:service_3.jsp";
        }else
            return " ";

    }

    //    查询所有投诉记录
    @RequestMapping("selectallcomplaint.do")
    public String selectAllComplaint (@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session){
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        List<CompSuggRepa> csr = csrservice.selectAllCSR(1);
        PageInfo page = new PageInfo(csr, 5);
        session.setAttribute("csr", page);
        return "redirect:service_1.jsp";
    }

    //    查询所有建议记录
    @RequestMapping("selectallsuggest.do")
    public String selectAllSuggest (@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session){
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        List<CompSuggRepa> csr = csrservice.selectAllCSR(2);
        PageInfo page = new PageInfo(csr, 5);
        session.setAttribute("csr", page);
        return "redirect:service_2.jsp";
    }

    //    查询所有报修记录
    @RequestMapping("selectallrepaid.do")
    public String selectAllRepaid (@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session){
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        List<CompSuggRepa> csr = csrservice.selectAllCSR(3);
        PageInfo page = new PageInfo(csr, 5);
        session.setAttribute("csr", page);
        return "redirect:service_3.jsp";
    }

    //        新增记录
    @RequestMapping("addcsr.do")
    public String addComplaint (CompSuggRepa csr){
        Date csrDate=new Date();
        csr.setCsrDate(csrDate);
        if (csrservice.addComplaint(csr)==1) {
            return "selectallcsr.do";
        }else
            return "redirect:/index/index.jsp";
    }


}
