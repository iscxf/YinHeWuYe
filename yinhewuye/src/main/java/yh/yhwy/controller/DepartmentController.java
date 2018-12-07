package yh.yhwy.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import yh.yhwy.bean.Department;
import yh.yhwy.service.DepartmentService;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author ljb
 */
@Controller
@RequestMapping("admin")
public class DepartmentController {

    /**
     * 定义全局变量 ： selectValue 记录查询参数
     * 默认为空 即，selectValue =  ""
     */
    private String selectValue = "";

    /**
     * 定义selectMode从前端获取查询模式
     *  用不同的阿拉伯数字代表不同的模式。
     *  查询部门信息：1：查询全部   2：按部门编号   3:按部门名称
     *  默认： 1：查询全部
     */
    private int selectMode = 1;

    private List<Department> departmentList = null;

    @Autowired
    @Qualifier("DepartmentService")
    private DepartmentService departmentService;

    public void setDepartmentService(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }

    //    新增部门信息
    @RequestMapping("InserDepartment.do")
    public String doInserDepartment(Department depa) {

        if (departmentService.addDepartment(depa)) {
            selectMode = 1;
            return "forward:listDepartment.do";
        }
        return "redirect:official_1.jsp";
    }

    //    通过部门编号删除部门
    @RequestMapping(value = "DelectDepartmentByPartid.do", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String doDelectDepartmentByPartid(int partid) {

        if (departmentService.rmDepartmentByPartid(partid)) {

            return "删除成功";
        }

        return "删除失败";
    }

    //    通过部门名称删除部门
    @RequestMapping("DelectDepartmentByPartName.do")
    public String doDelectDepartmentByPartName(String partName) {

        if (departmentService.rmDepartmentByPartName(partName)) {
            selectMode = 1;
            return "forward:listDepartment.do";
        }
        return "redirect:official_1.jsp";

    }

    //    更新部门信息
    @RequestMapping("UpdateDepartment.do")
    public String doUpdateDepartment(Department depa) {

        if (departmentService.modifyDepartment(depa)) {

            selectMode = 1;
            return "forward:listDepartment.do";
        }
        return "redirect:official_1.jsp";
    }

    //    查询部门
    @RequestMapping("SelectDepartment.do")
    public String doSelectDepartment(int selectmode,@RequestParam(value = "selectvalue",defaultValue = "0") String selectvalue) {

        /**
         * 定义selectMode从前端获取查询模式
         *  用不同的阿拉伯数字代表不同的模式。
         *  查询部门信息：1：查询所有   2：按部门编号   3:按部门名称
         */
        selectMode = selectmode;
        selectValue = selectvalue;

        return "forward:listDepartment.do";
    }

    //使用分页插件显示信息
    @RequestMapping("listDepartment.do")
    public String doListDepartment(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {

        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        int pageSize = 10;
        // startPage后面紧跟的这个查询就是一个分页查询
        switch (selectMode){
            case 1 :
                PageHelper.startPage(pn, pageSize);
                departmentList = departmentService.findAllDepartment();
                break;
            case 2 :
                int partid = Integer.parseInt(selectValue);
                PageHelper.startPage(pn, pageSize);
                departmentList = departmentService.findDepartmentByPartid(partid);
                break;

            case 3 :
                String partName = selectValue;
                PageHelper.startPage(pn, pageSize);
                departmentList = departmentService.findDepartmentByPartName(partName);
                break;
        }
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        if(departmentList == null){
            return "redirect:official_1.jsp";
        }
        PageInfo page = new PageInfo(departmentList, 5);

        session.setAttribute("pageInfo", page);

        return "official_1.jsp";
    }

}
