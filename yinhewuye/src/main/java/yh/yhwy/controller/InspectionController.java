package yh.yhwy.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import yh.yhwy.bean.Inspection;
import yh.yhwy.service.InsperctionService;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author ljb
 */
@Controller
@RequestMapping("admin")
public class InspectionController {

    private List<Inspection> inspectionList = null;

    /**
     * 定义全局变量 ： selectValue 记录查询参数
     * 默认为空 即，selectValue =  ""
     */
    private String selectValue = "";

    /**
     * 定义selectMode从前端获取查询模式
     * 用不同的阿拉伯数字代表不同的模式。
     * 查询培训信息：1：查询所有   2：按考核编码   3:按员工号 4：按员工姓名
     * 默认： 1：查询全部
     */
    private int selectMode = 1;

    @Autowired
    @Qualifier("InsperctionService")
    private InsperctionService insperctionService;

    public void setInsperctionService(InsperctionService insperctionService) {
        this.insperctionService = insperctionService;
    }

    //    新建考核记录
    @RequestMapping("InsertInsperction.do")
    public String doInsertInsperction(Inspection inspection) {

        insperctionService.addInspection(inspection);
        selectMode = 1;
        return "redirect:listInspection.do";
    }

    //删除考核记录
    //通过考核编码删除考核信息
    @RequestMapping(value = "DelectInsperctionByInspid.do", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String doDelectInspectionByInspid(int inspid) {

        if (insperctionService.rmInspectionByInspid(inspid)){

            return "删除成功";
        }

        return "删除失败";
    }

    //    通过员工号删除考核信息
    @RequestMapping("DelectInspectionByStaf_id.do")
    public String doDelectInspectionByStaf_id(int staf_id) {
        insperctionService.rmInspectionByStaf_id(staf_id);
        selectMode = 1;
        return "redirect:listInspection.do";
    }

    //    更新考核信息
    @RequestMapping("UpdateInspection.do")
    public String doUpdateInspection(Inspection insp) {
        insperctionService.modifyInspection(insp);
        selectMode = 1;
        return "redirect:listInspection.do";
    }

    //查询考核信息
    @RequestMapping("selectInspection.do")
    public String doSelectInspection(int selectmode, @RequestParam(value = "selectvalue", defaultValue = "0") String selectvalue) {

        /**
         * 定义全局变量 ： selectValue 记录查询参数
         * 默认为空 即，selectValue =  ""
         */
        selectValue = selectvalue;

        /**
         * 定义selectMode从前端获取查询模式
         * 用不同的阿拉伯数字代表不同的模式。
         * 查询培训信息：1：查询所有   2：按考核编码   3:按员工号 4：按员工姓名
         * 默认： 1：查询全部
         */
        selectMode = selectmode;

        return "redirect:listInspection.do";
    }

    //使用分页插件显示信息
    @RequestMapping("listInspection.do")
    public String doListInspection(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        int pageSize = 10;
        // startPage后面紧跟的这个查询就是一个分页查询
        switch (selectMode) {
            case 1:
                PageHelper.startPage(pn, pageSize);
                inspectionList = insperctionService.findAllInspection();
                break;
            case 2:
                int inspid = Integer.parseInt(selectValue);
                PageHelper.startPage(pn, pageSize);
                inspectionList = insperctionService.findInspectionByInspid(inspid);
                break;
            case 3:
                int staf_id = Integer.parseInt(selectValue);
                PageHelper.startPage(pn, pageSize);
                inspectionList = insperctionService.findInspectionByStaf_id(staf_id);
                break;
            case 4:
                PageHelper.startPage(pn, pageSize);
                inspectionList = insperctionService.findInspectionByStafName(selectValue);
                break;
        }

        if (inspectionList == null){
            return "redirect:official_4.jsp";
        }
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(inspectionList, 5);
        session.setAttribute("pageInfo", page);


        return "redirect:official_4.jsp";
    }
}
