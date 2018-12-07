package yh.yhwy.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import yh.yhwy.bean.Staff;
import yh.yhwy.service.StaffService;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author ljb
 */
@Controller
@RequestMapping("admin")
public class StaffController {

    /**
     * 定义全局变量 ： selectValue 记录查询参数
     * 默认为空 即，selectValue =  ""
     */
    private String selectValue = "";

    /**
     * 定义selectMode从前端获取查询模式
     *  用不同的阿拉伯数字代表不同的模式。
     *  查询员工信息：1：查询所有   2：按员工号   3:按员工姓名 4：按员工性别 5：按部门名称
     *  默认： 1：查询全部
     */
    private int selectMode = 1;

    private List<Staff> staffList = null;

    @Autowired
    @Qualifier("StaffService")
    private StaffService staffService;

    public void setStaffService(StaffService staffService) {
        this.staffService = staffService;
    }

    //    新增员工信息
    @RequestMapping("InserStaff.do")
    public String doInserStaff(Staff staff) {

        if (staffService.addStaff(staff)) {
            selectMode = 1;
            return "forward:listStaff.do";
        }
        return "redirect:official_2.jsp";
    }

    //    通过员工号删除员工信息

    @RequestMapping(value = "DelectStaffByStafid.do", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String doDelectStaffByStafid(int stafid) {

        if (staffService.rmStaffByStafid(stafid)) {

            return "删除成功";
        }
        return "删除失败";
    }

    //    通过员工姓名删除信息
    @RequestMapping("DelectStaffByStafName.do")
    public String doDeleteStaffByStafName(String stafName) {

        if (staffService.rmStaffByStafName(stafName)) {
            selectMode = 1;
            return "forward:listStaff.do";
        }
        return "redirect:official_2.jsp";

    }

    //    更新员工信息
    @RequestMapping("UpdateStaff.do")
    public String doUpdateStaff(Staff staf) {

        if (staffService.modifyStaff(staf)) {

            selectMode = 1;
            return "forward:listStaff.do";
        }
        return "redirect:official_2.jsp";
    }
    //    通过员工号查询员工信息
    @RequestMapping("SelectStaff.do")
    public String doSelecttStaff(int selectmode,@RequestParam(value = "selectvalue",defaultValue = "0") String selectvalue) {

        /**
         * 定义selectMode从前端获取查询模式
         *  用不同的阿拉伯数字代表不同的模式。
         *  查询员工信息：1：查询所有   2：按员工号   3:按员工姓名 4：按员工性别 5：按部门名称
         */
        selectMode = selectmode;
        selectValue = selectvalue;

        return "forward:listStaff.do";
    }
    //    通过员工年龄范围查询员工信息
    //使用分页插件显示信息
    @RequestMapping("listStaff.do")
    public String doListStaff(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {

        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        int pageSize = 10;
        // startPage后面紧跟的这个查询就是一个分页查询
        switch (selectMode){
            //    查询全部员工信息
            case 1 :
                PageHelper.startPage(pn, pageSize);
                staffList = staffService.findAllStaff();
                break;
            //    通过员工号查询员工信息
            case 2 :
                int stafid = Integer.parseInt(selectValue);
                PageHelper.startPage(pn, pageSize);
                staffList = staffService.findStaffByStafid(stafid);
                break;
            //    通过员工姓名查询员工信息
            case 3 :
                String stafName = selectValue;
                PageHelper.startPage(pn, pageSize);
                staffList = staffService.findStaffByStafName(stafName);
                break;
            //    通过员工性别查询员工信息
            case 4:
                String stafSex = selectValue;
                PageHelper.startPage(pn, pageSize);
                staffList = staffService.findStaffByStafSex(stafSex);
                break;
            //    通过部门名称查询员工信息
            case 5 :
                String partName = selectValue;
                PageHelper.startPage(pn, pageSize);
                staffList = staffService.findStaffByPartName(partName);
                break;
        }
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        if(staffList == null){
            return "redirect:official_2.jsp";
        }
        PageInfo page = new PageInfo(staffList, 5);
        session.setAttribute("pageInfo", page);

        return "redirect:official_2.jsp";
    }
}
