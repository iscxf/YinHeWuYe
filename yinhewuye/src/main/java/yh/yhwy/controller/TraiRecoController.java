package yh.yhwy.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import yh.yhwy.bean.TraiReco;
import yh.yhwy.service.TraiRecoService;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author ljb
 */
@Controller
@RequestMapping("admin")
public class TraiRecoController {

    private List<TraiReco> traiRecoList = null;

    /**
     * 定义全局变量 ： selectValue 记录查询参数
     * 默认为空 即，selectValue =  ""
     */
    private String selectValue = "";

    /**
     * 定义selectMode从前端获取查询模式
     * 用不同的阿拉伯数字代表不同的模式。
     * 查询培训信息：1：查询所有   2：按员工号   3:按员工姓名 4：按员工性别 5：按部门名称
     * 默认： 1：查询全部
     */
    private int selectMode = 1;

    @Autowired
    @Qualifier("TraiRecoService")
    private TraiRecoService traiRecoService;

    public void setTraiRecoService(TraiRecoService traiRecoService) {
        this.traiRecoService = traiRecoService;
    }

    //    新增培训记录
    @RequestMapping("InsertTraiReco.do")
    public String doInsertTraiReco(TraiReco traiReco) {

        traiRecoService.addTraiReco(traiReco);
        selectMode = 1;

        return "redirect:listTraiReco.do";
    }

    //删除培训记录
    //通过培训表编号删除培训记录
    @RequestMapping(value = "delectTraiRecoByTId.do", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String doDelectTraiRecoByInspid(int traiid) {

        if (traiRecoService.rmTraiRecoByTId(traiid)) {
            return "删除成功";
        }

        return "删除失败";
    }

    //    删除全部培训记录
    @RequestMapping(value = "delectAllraiReco.do", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String doDelectTraiReco() {

        if (traiRecoService.rmAllraiReco()) {

            return "删除成功";
        }

        return "删除失败";
    }

    //    更新培训记录
    @RequestMapping("updateTraiReco.do")
    public String doUpdateTraiReco(TraiReco traiReco) {

        traiRecoService.modifyTraiReco(traiReco);
        selectMode = 1;
        return "redirect:listTraiReco.do";
    }

    //查询培训信息
    @RequestMapping("selectTraiRecoByTId.do")
    public String doSelectTraiRecoByTId(int selectmode, @RequestParam(value = "selectvalue", defaultValue = "0") String selectvalue) {

        /**
         * 全局变量 ： selectValue 记录查询参数
         * 默认为空 即，selectValue =  ""
         */
        selectMode = selectmode;
        /**
         * 定义selectMode从前端获取查询模式
         * 用不同的阿拉伯数字代表不同的模式。
         * 查询培训信息：1：查询全部   2：按培训表号   3:按培训方向 4：按培训讲师
         * 默认： 1：查询全部
         */
        selectValue = selectvalue;

        return "forward:listTraiReco.do";

    }

    //使用分页插件显示信息
    @RequestMapping("listTraiReco.do")
    public String doListTraiReco(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        int pageSize = 10;
        // startPage后面紧跟的这个查询就是一个分页查询
        switch (selectMode) {
            case 1:
                PageHelper.startPage(pn, pageSize);
                traiRecoList = traiRecoService.findAllTraiReco();
                break;
            case 2:
                int traiid = Integer.parseInt(selectValue);
                PageHelper.startPage(pn, pageSize);
                traiRecoList = traiRecoService.findTraiRecoByTId(traiid);
                break;
            case 3:
                PageHelper.startPage(pn, pageSize);
                traiRecoList = traiRecoService.findTraiRecoByTD(selectValue);
                break;
            case 4:
                PageHelper.startPage(pn, pageSize);
                traiRecoList = traiRecoService.findTraiRecoByTL(selectValue);
                break;
        }
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        if (traiRecoList == null) {
            return "redirect:official_3.jsp";
        }
        PageInfo page = new PageInfo(traiRecoList, 5);
        session.setAttribute("pageInfo", page);

        return "redirect:official_3.jsp";
    }
}
