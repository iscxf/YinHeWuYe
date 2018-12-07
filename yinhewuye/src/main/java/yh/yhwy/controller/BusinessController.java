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
import yh.yhwy.bean.*;
import yh.yhwy.service.ICommInfoService;
import yh.yhwy.service.IHousTranService;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author YQ
 */
@Controller
@RequestMapping("admin")
public class BusinessController {
    @Autowired
    @Qualifier("CommInfoService")
    private ICommInfoService iCommInfoService;
    @Autowired
    @Qualifier("HousTranService")
    private IHousTranService iHousTranService;
    /*
     * 查询条件
     * mode =
     * "1":根据房产号查房产信息
     * "2":根据楼号查房产信息
     * "3":根据单元号查房产信息
     * "4":根据门牌号查房产信息
     * "5":根据住户编号查住户信息
     * "6":根据房产号查住户信息
     * "7":根据户主姓名查住户信息
     * "8":根据户主身份证查住户信息
     * "9":根据家庭常住人口查住户信息
     * "A":根据交接编号查房屋交接信息
     * "B":根据房产号查房屋交接信息
     * "all":查询所有信息
     */
    static String mode = "all";
    //查询参数
    static String selectParam;

    public void setiCommInfoService(ICommInfoService iCommInfoService) {
        this.iCommInfoService = iCommInfoService;
    }

    public void setiHousTranService(IHousTranService iHousTranService) {
        this.iHousTranService = iHousTranService;
    }

    /**
     * 管理员如果点了查找按钮，先将请求表单提交到这里，然后用mode和selectParam这两个类变量接收请求参数
     * 这样做是当给定查询条件的查询结果有多条需要分页显示时，点击分页条的分页按钮时必须保证查询条件一致
     */
    @RequestMapping(value = "queryCondi.do", method = RequestMethod.POST)
    public String queryCondi(/*@RequestParam(value = "pn", defaultValue = "1") Integer pn, */String condition,
                                     @RequestParam(value = "condiValue", defaultValue = " ")String condiValue/*, HttpSession session*/) {
        mode = condition;
        selectParam = condiValue;
        return "distribution.do";
    }
    /**
     * 判断查询条件，将其交给指定的请求方法
     */
    @RequestMapping("distribution.do")
    public String distributionRequest(/*HttpSession session*/) {
        switch (mode){
            case "1":
            case "2":
            case "3":
            case "4":
                return "queryHousProp.do";
            case "5":
            case "6":
            case "7":
            case "8":
            case "9":
                return "queryResident.do";
            case "A":
            case "B":
                return "queryHousTran.do";
            case "C":
            case "D":
            case "E":
                return "queryBuilding.do";
            default:
                return "";
        }
    }

    /**
     * 执行这个请求时，会将查询条件设置为"all",查询所有房产信息
     */
    @RequestMapping("default.do")
    public String doDefault(/*HttpSession session*/) {
        mode = "all";
        return "queryHousProp.do";
    }

    /**
     * 查询房产信息请求
     */
    @RequestMapping(value = "queryHousProp.do")
    public String queryHousProp(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
        HousProp housProp = new HousProp();
        if (mode.equals("3")) {
            housProp.setUnit(selectParam);
        } else if (mode.equals("4")) {
            housProp.setDoorplate(selectParam);
        } else if (mode.equals("1")) {
            housProp.setHpid(selectParam);
        } else if (mode.equals("2")) {
            housProp.setBuil_id(Integer.parseInt(selectParam));
        } else if (mode.equals("all")) {

        }

        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        // startPage后面紧跟的这个查询就是一个分页查询
        List<HousProp> housProps = iCommInfoService.queryHousInfo(housProp);
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(housProps, 5);
        //model.addAttribute("pageInfo", page);
        session.setAttribute("pageInfo", page);

        return "redirect:houseProp_1.jsp";
    }
    /**
     * 修改房产信息
     */
    @RequestMapping("updateHousProp.do")
    public String updateHousProp(HousProp housProp) {
        if (iCommInfoService.modifyHousInfo(housProp)) {
            return "default.do";
        }
        return "";
    }
    /**
     * 增加房产信息
     */
    @RequestMapping("insertHousProp.do")
    public String insertHousProp(HousProp housProp) {
        if (iCommInfoService.addHousInfo(housProp)) {
            return "default.do";
        }
        return "";
    }
    /**
     * 删除房产信息
     */
    @RequestMapping(value = "deleteHousProp.do", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String deleteHousProp(int id) {
        if (iCommInfoService.deleteHousInfo(id)) {
            return "删除成功";
        }
        return "删除失败";
    }
    /*@RequestMapping(value = "queryResidentCondi.do", method = RequestMethod.POST)
    public String queryResidentCondi(@RequestParam(value = "pn", defaultValue = "1") Integer pn, String condition,
                                     @RequestParam(value = "condiValue", defaultValue = " ")String condiValue, HttpSession session) {
        mode = condition;
        selectParam = condiValue;
        return "/queryResident.do";
    }*/

    /**
     * 执行这个请求时，会将查询条件设置为"all",查询所有住户信息
     */
    @RequestMapping("queryResidentdefault.do")
    public String queryResidentDefault(/*HttpSession session*/) {
        mode = "all";
        return "queryResident.do";
    }

    /**
     * 查询住户信息请求
     */
    @RequestMapping("queryResident.do")
    public String queryResident(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
        Resident resident = new Resident();
        if (mode.equals("5")) {
            resident.setResid(Integer.parseInt(selectParam));
        } else if (mode.equals("6")) {
            resident.setHp_id(selectParam);
        } else if (mode.equals("7")) {
            resident.setResiName(selectParam);
        } else if (mode.equals("8")) {
            resident.setResiIden(selectParam);
        } else if (mode.equals("9")) {
            resident.setResiTota(Integer.parseInt(selectParam));
        } else if (mode.equals("all")) {

        }

        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        // startPage后面紧跟的这个查询就是一个分页查询
        List<Resident> residents = iCommInfoService.queryResiInfo(resident);
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(residents, 5);
        session.setAttribute("pageInfo", page);

        return "redirect:houseProp_3.jsp";
    }

    /**
     * 修改住户信息
     */
    @RequestMapping("updateResident.do")
    public String updateResident(Resident resident) {
        if (iCommInfoService.modifyResiInfo(resident)) {
            return "queryResidentdefault.do";
        }
        return "";
    }
    /**
     * 增加住户信息
     */
    @RequestMapping("insertResident.do")
    public String insertResident(Resident resident) {
        if (iCommInfoService.addResiInfo(resident)) {
            return "queryResidentdefault.do";
        }
        return "";
    }
    /**
     * 删除住户信息
     */
    @RequestMapping(value = "deleteResident.do", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String deleteResident(int id) {
        if (iCommInfoService.deleteResiInfo(id)) {
            return "删除成功";
        }
        return "删除失败";
    }
    /**
     * 执行这个请求时，会将查询条件设置为"all",查询所有房屋交接信息
     */
    @RequestMapping("queryHousTrandefault.do")
    public String queryHousTranDefault(/*HttpSession session*/) {
        mode = "all";
        return "queryHousTran.do";
    }
    /**
     * 查询房屋交接信息
     */
    @RequestMapping("queryHousTran.do")
    public String queryHousTran(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
        HousTran housTran = new HousTran();
        if (mode.equals("A")) {
            housTran.setHtid(Integer.parseInt(selectParam));
        } else if (mode.equals("B")) {
            housTran.setHp_id(selectParam);
        } else if (mode.equals("all")) {

        }
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        // startPage后面紧跟的这个查询就是一个分页查询
        List<HousTran> housTrans = iHousTranService.queryHousTranInfo(housTran);
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(housTrans, 5);
        session.setAttribute("pageInfo", page);

        return "redirect:houseProp_4.jsp";
    }
    /**
     * 修改房屋交接信息
     */
    @RequestMapping("updateHousTran.do")
    public String updateHousTran(HousTran housTran) {
        if (iHousTranService.modifyHousTranInfo(housTran)) {
            return "queryHousTrandefault.do";
        }
        return "";
    }
    /**
     * 增加房屋交接信息
     */
    @RequestMapping("insertHousTran.do")
    public String insertHousTran(HousTran housTran) {
        if (iHousTranService.addHousTranInfo(housTran)) {
            return "queryHousTrandefault.do";
        }
        return "";
    }
    /**
     * 删除房屋交接信息
     */
    @RequestMapping(value = "deleteHousTran.do", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String deleteHousTran(int htid) {
        if (iHousTranService.deleteHousTranInfo(htid)) {
            return "删除成功";
        }
        return "删除失败";
    }

    /**
     * 执行这个请求时，会将查询条件设置为"all",查询所有楼宇交接信息
     */
    @RequestMapping("queryBuildingdefault.do")
    public String queryBuildingDefault(/*HttpSession session*/) {
        mode = "all";
        return "queryBuilding.do";
    }
    /**
     * 查询楼宇信息请求
     */
    @RequestMapping(value = "queryBuilding.do")
    public String queryBuilding(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
        Building building = new Building();
        if (mode.equals("C")) {
            building.setBuilid(Integer.parseInt(selectParam));
        } else if (mode.equals("D")) {
            building.setLayout(selectParam);
        } else if (mode.equals("E")) {
            building.setBuilComp(selectParam);
        } else if (mode.equals("all")) {

        }

        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        // startPage后面紧跟的这个查询就是一个分页查询
        List<Building> buildings = iCommInfoService.queryBuildingInfo(building);
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(buildings, 5);
        //model.addAttribute("pageInfo", page);
        session.setAttribute("pageInfo", page);

        return "redirect:houseProp_2.jsp";
    }
    /**
     * 修改楼宇信息
     */
    @RequestMapping("updateBuilding.do")
    public String updateBuilding(Building building) {
        if (iCommInfoService.modifyBuildingInfo(building)) {
            return "queryBuildingdefault.do";
        }
        return "";
    }
    /**
     * 增加楼宇信息
     */
    @RequestMapping("insertBuilding.do")
    public String insertBuilding(Building building) {
        if (iCommInfoService.addBuildingInfo(building)) {
            return "queryBuildingdefault.do";
        }
        return "";
    }
    /**
     * 删除楼宇信息
     */
    @RequestMapping(value = "deleteBuilding.do", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String deleteBuilding(int builid) {
        if (iCommInfoService.deleteBuildingInfo(builid)) {
            return "删除成功";
        }
        return "删除失败";
    }



}
