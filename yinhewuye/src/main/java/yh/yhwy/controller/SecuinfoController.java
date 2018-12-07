package yh.yhwy.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import yh.yhwy.bean.Dailsecu;
import yh.yhwy.bean.Secuinfo;
import yh.yhwy.service.impl.DailSecuService;
import yh.yhwy.service.impl.SecuinfoService;

import java.util.List;


/*處理增刪改查
 *
 */
@Controller
@RequestMapping("admin")
public class SecuinfoController {

    @Autowired
    SecuinfoService secuinfoService;

    @Autowired
    DailSecuService dailSecuService;

    @RequestMapping("staff.do")
    public String getinfos(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        // 不是分頁查詢
        // 引入pagehelper分頁插件
        PageHelper.startPage(pn, 5);// 分页以及每页的大小
        // startpage紧跟查询是分页查询
        List<Secuinfo> secuinfos = secuinfoService.getAll();
        // 使用pageinfo包装查询后的结果，将pageinfo交给页面
        // 封装了详细的分页信息,传入连续显示的页数
        PageInfo page = new PageInfo(secuinfos, 5);
        model.addAttribute("pageInfo", page);
        return "security_1.jsp";
    }


    @RequestMapping("addsecuinfo.do")
    public String insertinfos(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model,Secuinfo secuinfo) {
        // 不是分頁查詢
        // 引入pagehelper分頁插件
        PageHelper.startPage(pn, 5);// 分页以及每页的大小
        // startpage紧跟查询是分页查询
        int secu = secuinfoService.save(secuinfo);

        List<Secuinfo> secuinfos = secuinfoService.getAll();
        // 使用pageinfo包装查询后的结果，将pageinfo交给页面
        // 封装了详细的分页信息,传入连续显示的页数
        PageInfo page = new PageInfo(secuinfos, 5);
        model.addAttribute("pageInfo", page);
        return "security_1.jsp";
    }
    @RequestMapping("updatesecuinfo.do")
    public String updateinfos(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model,Secuinfo secuinfo) {
        // 不是分頁查詢
        // 引入pagehelper分頁插件
        PageHelper.startPage(pn, 5);// 分页以及每页的大小
        // startpage紧跟查询是分页查询
        int secu = secuinfoService.udate(secuinfo);
        List<Secuinfo> secuinfos = secuinfoService.getAll();
        // 使用pageinfo包装查询后的结果，将pageinfo交给页面
        // 封装了详细的分页信息,传入连续显示的页数
        PageInfo page = new PageInfo(secuinfos, 5);
        model.addAttribute("pageInfo", page);
        return "security_1.jsp";
    }

//    @RequestMapping("/delsecuinfo.do")
    @RequestMapping(value = "delsecuinfo.do",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String delinfos(Integer id) {

        int secu = secuinfoService.del(id);
        if(secu==1){
            return "success";
        }
        else{
            return "false";
        }
    }

    @RequestMapping("dali.do")
    public String getdalis(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        // 不是分頁查詢
        // 引入pagehelper分頁插件
        PageHelper.startPage(pn, 5);// 分页以及每页的大小
        // startpage紧跟查询是分页查询
        List<Dailsecu> dailsecuList = dailSecuService.getAll();
        // 使用pageinfo包装查询后的结果，将pageinfo交给页面
        // 封装了详细的分页信息,传入连续显示的页数
        PageInfo page = new PageInfo(dailsecuList, 5);
        model.addAttribute("pageInfo", page);
        return "security_2.jsp";
    }
    @RequestMapping("updatedail.do")
    public String savedalis(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model,Dailsecu dailsecu) {
        // 不是分頁查詢
        // 引入pagehelper分頁插件
        PageHelper.startPage(pn, 5);// 分页以及每页的大小
        // startpage紧跟查询是分页查询
        int dail = dailSecuService.udate(dailsecu);
        List<Dailsecu> dailsecuList = dailSecuService.getAll();
        // 使用pageinfo包装查询后的结果，将pageinfo交给页面
        // 封装了详细的分页信息,传入连续显示的页数
        PageInfo page = new PageInfo(dailsecuList, 5);
        model.addAttribute("pageInfo", page);
        return "security_2.jsp";
    }

    @RequestMapping("adddail.do")
    public String adddalis(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model,Dailsecu dailsecu) {
        // 不是分頁查詢
        // 引入pagehelper分頁插件
        PageHelper.startPage(pn, 5);// 分页以及每页的大小
        // startpage紧跟查询是分页查询
        int dail = dailSecuService.save(dailsecu);
        List<Dailsecu> dailsecuList = dailSecuService.getAll();
        // 使用pageinfo包装查询后的结果，将pageinfo交给页面
        // 封装了详细的分页信息,传入连续显示的页数
        PageInfo page = new PageInfo(dailsecuList, 5);
        model.addAttribute("pageInfo", page);
        return "security_2.jsp";
    }

    @RequestMapping("deldail.do")
    public String deldalis(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model,Integer id) {

        int da = dailSecuService.del(id);
        if(da==1){
            return "success";
        }
        else{
            return "false";
        }
    }
}