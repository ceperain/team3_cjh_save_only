package dev.mvc.cate;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cate.CateVO;

@Controller
public class CateCont {
    @Autowired
    @Qualifier("dev.mvc.cate.CateProc") // @Component("dev.mvc.cate.CateProc")
    private CateProcInter cateProc;

    public CateCont() {
        System.out.println("-> CateCont created.");
     
    }
    
    /**
     * 등록폼
     * http://localhost:9091/cate/ddmenu.do 
     * http://localhost:9091/cate/korean.do 
     * http://localhost:9091/cate/create.do?categrpno=2
     * 
     * @return
     */
    @RequestMapping(value = "/cate/ddmenu.do", method = RequestMethod.GET)
    public ModelAndView create() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/cate/ddmenu"); // /webapp/WEB-INF/views/cate/ddmenu.jsp

      return mav;
    }

    /**
     * Categrp + Cate join, 연결 목록 http://localhost:9091/cate/list_all_join.do
     * 
     * @return
     */
    @RequestMapping(value = "/cate/list.do", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();

        /*
         * List<CateVO> list = this.cateProc.list(); mav.addObject("list", list); //
         * request.setAttribute("list", list);
         * 
         * mav.setViewName("/cate/list"); // /WEB-INF/views/cate/list_all_join.jsp
         */
        return mav;
    }
}
