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
import yh.yhwy.bean.Charge;
import yh.yhwy.bean.User;
import yh.yhwy.service.IChargeService;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author YQ
 */
@Controller
@RequestMapping("admin")
public class ChargeController {
    @Autowired
    @Qualifier("ChargeService")
    private IChargeService iChargeService;

    private String mode;
    private String selectParam;

    public void setiChargeService(IChargeService iChargeService) {
        this.iChargeService = iChargeService;
    }
    @RequestMapping(value = "chargeCondi.do", method = RequestMethod.POST)
    public String queryChargeCondi(/*@RequestParam(value = "pn", defaultValue = "1") Integer pn, */String condition,
                                                                                             @RequestParam(value = "condiValue", defaultValue = " ")String condiValue/*, HttpSession session*/) {
        mode = condition;
        selectParam = condiValue;
        return "queryCharge.do";
    }
    /**
     * 执行这个请求时，会将查询条件设置为"all",查询所有收费信息
     */
    @RequestMapping("queryChargeDefault.do")
    public String queryChargeDefault(/*HttpSession session*/) {
        mode = "all";
        return "queryCharge.do";
    }
    /**
     * 查询收费信息请求
     */
    @RequestMapping(value = "queryCharge.do")
    public String queryCharge(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
        Charge charge = new Charge();
        if (mode.equals("charid")) {
            charge.setCharid(Integer.parseInt(selectParam));
        } else if (mode.equals("hp_id")) {
            charge.setHp_id(selectParam);
        } else if (mode.equals("all")) {

        }

        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        int pageSize = 10;
        PageHelper.startPage(pn, pageSize);
        // startPage后面紧跟的这个查询就是一个分页查询
        List<Charge> charges = iChargeService.queryChargeInfo(charge);
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(charges, 5);
        //model.addAttribute("pageInfo", page);
        session.setAttribute("pageInfo", page);

        return "redirect:charge_1.jsp";
    }
    /**
     * 修改收费信息
     */
    @RequestMapping("updateCharge.do")
    public String updateCharge(Charge charge) {
        if (iChargeService.modifyChargeInfo(charge)) {
            return "queryChargeDefault.do";
        }
        return "";
    }
    /**
     * 增加收费信息
     */
    @RequestMapping("insertCharge.do")
    public String insertCharge(Charge charge) {
        if (iChargeService.addChargeInfo(charge)) {
            return "queryChargeDefault.do";
        }
        return "";
    }
    /**
     * 删除收费信息
     */
    @RequestMapping(value = "deleteCharge.do", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String deleteCharge(int charid) {
        if (iChargeService.deleteChargeInfo(charid)) {
            return "删除成功";
        }
        return "删除失败";
    }


}
