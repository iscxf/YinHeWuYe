package yh.yhwy.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import yh.yhwy.bean.History;
import yh.yhwy.bean.Park;
import yh.yhwy.bean.SpotMana;
import yh.yhwy.bean.User;
import yh.yhwy.service.IParkService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("admin")
public class MyController {
    @Autowired
    @Qualifier("parkService")
    private IParkService parkService;

//    @Autowired
//    @Qualifier("csrService")
//    private ICSRService csrservice;

    static String type="all";  //接收的查询方式
    static Integer data; //接收的查询条件数据


    public static void setType(String type) {
        MyController.type = type;
    }

    public static void setData(Integer data) {
        MyController.data = data;
    }

    public void setParkService(IParkService parkService) {
        this.parkService = parkService;
    }

//    查询总入口
    @RequestMapping(value = "doparkselect.do")
    public String Select(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session,
                         @RequestParam(value = "id", defaultValue = "0") Integer id, String selecttype){
        data=id;
        type=selecttype;
        switch (selecttype) {
            case "1":
            case "2":
                return "selectpark.do";
            case "3":
            case "4":
            case "5":
            case "6":
                return "selectspotmana.do";
            case "7":
            case "8":
                return "selecthistory.do";
            default:
                return " ";
        }
    }

//    停车场查询总入口
    @RequestMapping(value = "selectpark.do")
    public String SelectPark(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session){
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        if (type.equals("1") || type.equals("all")){
            List<Park> stus = parkService.selectAllPark();
            PageInfo page = new PageInfo(stus, 5);
            session.setAttribute("stu", page);
            return "redirect:park_1.jsp";
        }else if (type.equals("2")){
//            if (data!="" && data!=null){
                List<Park> stus = parkService.selectParkById(data);
                PageInfo page = new PageInfo(stus, 5);
                session.setAttribute("stu", page);
                return "redirect:park_1.jsp";
//            }else
//                return "selectallpark.do";
        }else {
            return "redirect:admin.jsp";
        }
    }

//       查询全部停车场信息
    @RequestMapping(value = "selectallpark.do")
    public String SelectAllPark(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        List<Park> stus = parkService.selectAllPark();
//        if(stus.list)
        PageInfo page = new PageInfo(stus, 5);
        session.setAttribute("stu", page);
        return "redirect:park_1.jsp";

    }

//    根据停车号来查询停车场信息
    @RequestMapping(value = "selectparkbyid.do",method = RequestMethod.POST)
    public String selectParkById (@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session,
                                  @RequestParam(value = "id", defaultValue = "1") int id, int selecttype){
        if(selecttype==1) {
            return "selectallpark.do";
        }else if(selecttype==2){
            String temp= String.valueOf(id);
            if (temp!="" && temp!=null){
                int pageSize = 10;
                PageHelper.startPage(pn, pageSize);
                List<Park> stus = parkService.selectParkById(id);
                PageInfo page = new PageInfo(stus, 5);
                session.setAttribute("stu", page);
                return "redirect:park_1.jsp";
            }else return "selectallpark.do";
        }else
            return "redirect:park_1.jsp";
    }

//    新增停车场信息
    @RequestMapping("addpark.do")
    public String addPark (Park park){
        if (parkService.addPark(park)==1) {
            return "selectallpark.do";
        }else
            return "redirect:index.jsp";
    }

//        修改停车场信息
    @RequestMapping("updateparkbyid.do")
    public String updateParkById (Park park){
        if (parkService.updateParkById(park)==1) {
            return "selectallpark.do";
        }else
            return "redirect:index.jsp";
    }

//            根据id来删除停车场信息
    @RequestMapping(value = "deleteparkbyid.do",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String deleteParkById (int id){
        if (parkService.deleteParkById(id)==1)
            return "删除成功";
        else
            return "删除失败";
    }


    ////////////////////////
    //    停车位表操作   //
    ///////////////////////

//    查询停车位总入口
    @RequestMapping("selectspotmana.do")
    public String selectSpotMana (@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session){
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        if(type.equals("3") || type.equals("all")) {   //查询全部
            List<SpotMana> spotmana = parkService.selectAllSpotMana();
            PageInfo page = new PageInfo(spotmana, 5);
            session.setAttribute("spotmana", page);
            return "redirect:park_2.jsp";
        }else if(type.equals("4")){   //根据车位号查询
            List<SpotMana> spotmana = parkService.selectSpotManaById(data);
            PageInfo page = new PageInfo(spotmana, 5);
            session.setAttribute("spotmana", page);
            return "redirect:park_2.jsp";
        }else if(type.equals("5")){   //根据用户id查询
            List<SpotMana> spotmana = parkService.selectSpotManaByUserId(data);
            PageInfo page = new PageInfo(spotmana, 5);
            session.setAttribute("spotmana", page);
            return "redirect:park_2.jsp";
        }else if(type.equals("6")){   //根据是否出租查询
            List<SpotMana> spotmana = parkService.selectSpotManaIsRent();
            PageInfo page = new PageInfo(spotmana, 5);
            session.setAttribute("spotmana", page);
            return "redirect:park_2.jsp";
        }else {
            System.out.println("***************************1**************************");
            return " ";
        }

    }

    //    查询所有停车位信息
    @RequestMapping("selectallspotmana.do")
    public String selectAllSpotMana (@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session){
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        List<SpotMana> spotmana = parkService.selectAllSpotMana();
        PageInfo page = new PageInfo(spotmana, 5);
        session.setAttribute("spotmana", page);
        return "redirect:park_2.jsp";
    }

    //    查询所有已经出租的停车位信息
    @RequestMapping("selectspotmanaisrent.do")
    public String selectSpotManaIsRent (@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session){
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        List<SpotMana> spotmana = parkService.selectSpotManaIsRent();
        PageInfo page = new PageInfo(spotmana, 5);
        session.setAttribute("spotmana", page);
        return "redirect:park_2.jsp";
    }

    //    根据停车位号来查询停车位信息
    @RequestMapping("selectspotmanabyid.do")
    public String selectSpotManaById (@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session,@RequestParam Integer id){
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        List<SpotMana> spotmana = parkService.selectSpotManaById(id);
        PageInfo page = new PageInfo(spotmana, 5);
        session.setAttribute("spotmana", page);
        return "redirect:park_2.jsp";
    }

//    根据用户id来查询停车位信息
    @RequestMapping("selectspotmanabyuserid.do")
    public String selectSpotManaByUserId (@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session,@RequestParam Integer id){
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        List<SpotMana> spotmana = parkService.selectSpotManaByUserId(id);
        PageInfo page = new PageInfo(spotmana, 5);
        session.setAttribute("spotmana", page);
        return "redirect:park_2.jsp";
    }

//    根据登录用户id来查询停车位信息
    @RequestMapping("selectspotmanabylogin.do")
    public String selectSpotManaByLogin (@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session){
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        int id= ((User)session.getAttribute("user")).getUserid();
        List<SpotMana> spotmana = parkService.selectSpotManaByUserId(id);
        PageInfo page = new PageInfo(spotmana, 5);
        session.setAttribute("spotmana", page);
        return "redirect:/index/tingche.jsp";
    }

//    根据停车位号来修改停车位信息
@RequestMapping(value = "updatespotmanabyid.do",method = RequestMethod.POST)
    public String updateSpotManaById (@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session, SpotMana spotMana){
        int pageSize =10;
        if (parkService.updateSpotManaById(spotMana)==1) {
            return "selectallspotmana.do";
        }else
            return "redirect:index.jsp";
    }
    //    根据停车位号来删除停车位信息

//    @RequestMapping(value = "/deletespotmanabyid.do", method = RequestMethod.POST)
//    @ResponseBody
//    public Object deleteSpotManaById (HttpServletRequest req){
//        JSONObject jsonObject = new JSONObject();
//        String id = req.getParameter("id");
//        Integer id2=Integer.parseInt(id);
//        if (parkService.deleteSpotManaById(id2)==1) {
//            jsonObject.put("result", "删除成功");
//            return jsonObject;
//        }else{
//            jsonObject.put("result", "删除失败");
//            return jsonObject;
//        }
//    }
    @RequestMapping(value = "deletespotmanabyid.do", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String deleteSpotManaById (int id){
        if (parkService.deleteSpotManaById(id)==1)
            return "删除成功";
        else
            return "删除失败";
    }

    ///////////////////////////////
    //    停车位历史记录表操作   //
    //////////////////////////////


//    查询停车历史总入口
    @RequestMapping("selecthistory.do")
    public String selectHistory (@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session){
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        if(type.equals("7") || type.equals("all")){
            List<History> history = parkService.selectAllHistory();
            PageInfo page = new PageInfo(history, 5);
            session.setAttribute("history", page);
            return "redirect:park_3.jsp";
        }else if (type.equals("8")){
            List<History> history = parkService.selectAllHistoryById(data);
            PageInfo page = new PageInfo(history, 5);
            session.setAttribute("history", page);
            return "redirect:park_3.jsp";
        }else
            return " ";
    }


//        查询所有停车历史记录信息
    @RequestMapping("selectallhistory.do")
    public String selectAllHistory (@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session){
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        List<History> history = parkService.selectAllHistory();
        PageInfo page = new PageInfo(history, 5);
        session.setAttribute("history", page);
        return "redirect:park_3.jsp";
    }

    //    根据停车位号来查询停车位相关历史信息
    @RequestMapping("selecallthistorybyid.do")
    public String selectAllHistoryById (@RequestParam(value = "pn", defaultValue = "1") Integer pn,  HttpSession session,@RequestParam Integer id){
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        List<History> history = parkService.selectAllHistoryById(id);
        PageInfo page = new PageInfo(history, 5);
        session.setAttribute("history", page);
        return "redirect:park_3.jsp";
    }

    //    根据历史编号来删除停车位相关历史记录
    @RequestMapping(value = "deletehistorybyid.do", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String deleteHistoryById (int id){
        if (parkService.deleteHistoryById(id)==1)
            return "删除成功";
        else
            return "删除失败";
    }

    ///////////////////////////////
    //    建议投诉报修操作      //
    //////////////////////////////

//    @RequestMapping("selectcsr.do")
//    public String selectCSR (@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session){
//        int pageSize = 10;
//        PageHelper.startPage(pn, pageSize);
//
//        if(type.equals("9") || type.equals("all")){
//            List<CompSuggRepa> csr = csrservice.selectCSRById(1,data);
//            PageInfo page = new PageInfo(csr, 5);
//            session.setAttribute("csr", page);
//            return "redirect:service_1.jsp";
//        }else if(type.equals("A")){
//            List<CompSuggRepa> csr = csrservice.selectCSRById(2,data);
//            PageInfo page = new PageInfo(csr, 5);
//            session.setAttribute("csr", page);
//            return "redirect:service_2.jsp";
//        }else if (type.equals("B")){
//            List<CompSuggRepa> csr = csrservice.selectCSRById(3,data);
//            PageInfo page = new PageInfo(csr, 5);
//            session.setAttribute("csr", page);
//            return "redirect:service_3.jsp";
//        }else
//            return " ";
//
//    }
//
////    查询所有投诉记录
//    @RequestMapping("selecallcomplaint.do")
//    public String selectAllCSR (@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session){
//        int pageSize = 10;
//        PageHelper.startPage(pn, pageSize);
//        List<CompSuggRepa> csr = csrservice.selectAllCSR(1);
//        PageInfo page = new PageInfo(csr, 5);
//        session.setAttribute("csr", page);
//        return "redirect:service_1.jsp";
//    }
//
////    查询所有建议记录
//    @RequestMapping("selecallsuggest.do")
//    public String selectAllSuggest (@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session){
//        int pageSize = 10;
//        PageHelper.startPage(pn, pageSize);
//        List<CompSuggRepa> csr = csrservice.selectAllCSR(2);
//        PageInfo page = new PageInfo(csr, 5);
//        session.setAttribute("csr", page);
//        return "redirect:service_1.jsp";
//    }
//
////    查询所有报修记录
//    @RequestMapping("selecallsuggest.do")
//    public String selectAllSuggest (@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session){
//        int pageSize = 10;
//        PageHelper.startPage(pn, pageSize);
//        List<CompSuggRepa> csr = csrservice.selectAllCSR(2);
//        PageInfo page = new PageInfo(csr, 5);
//        session.setAttribute("csr", page);
//        return "redirect:service_1.jsp";
//    }
//
////        新增投诉信息
//    @RequestMapping("addcomplaint.do")
//    public String addComplaint (CompSuggRepa csr){
//        Date csrDate=new Date();
//        csr.setCsrDate(csrDate);
//        if (csrservice.addComplaint(csr)==1) {
//            return "selecallcsr.do";
//        }else
//            return "redirect:index.jsp";
//    }

}
