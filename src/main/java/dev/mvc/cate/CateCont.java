package dev.mvc.cate;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cate.CateVO;
import dev.mvc.store.StoreProcInter;
import dev.mvc.store.StoreVO;

@Controller
public class CateCont {
    @Autowired
    @Qualifier("dev.mvc.cate.CateProc") // @Component("dev.mvc.cate.CateProc")
    private CateProcInter cateProc;

    @Autowired
    @Qualifier("dev.mvc.store.StoreProc")
    private StoreProcInter storeProc;

    public CateCont() {
        System.out.println("-> CateCont created.");

    }

    /**
     * Categrp + Cate join, 연결 목록 http://localhost:9091/cate/lis.do
     * 
     * @return
     */
    @RequestMapping(value = "/cate/list.do", method = RequestMethod.GET)
    public ModelAndView list(int cateno) {
        ModelAndView mav = new ModelAndView();

        List<CateVO> list = this.cateProc.list(cateno);
        mav.addObject("list", list); // request.setAttribute("list", list);

        mav.setViewName("/cate/list"); // /WEB-INF/views/cate/list.jsp
        return mav;
    }


}
