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
     * 등록폼 http://localhost:9091/cate/list.do http://localhost:9091/cate/korean.do
     * http://localhost:9091/cate/create.do?categrpno=2
     * 
     * @return
     */
    /*
     * @RequestMapping(value = "/cate/list.do", method = RequestMethod.GET) public
     * ModelAndView create() { ModelAndView mav = new ModelAndView();
     * mav.setViewName("/cate/list"); // /webapp/WEB-INF/views/cate/list.jsp
     * 
     * return mav; }
     */

    /**
     * Categrp + Cate join, 연결 목록
     * http://localhost:9091/cate/lis.do 
     * @return
     */
    @RequestMapping(value="/cate/list.do", method=RequestMethod.GET )
    public ModelAndView list(int cateno) {
      ModelAndView mav = new ModelAndView();
      
      List<CateVO> list = this.cateProc.list(cateno);
      mav.addObject("list", list); // request.setAttribute("list", list);
      
      mav.setViewName("/cate/list"); // /WEB-INF/views/cate/list.jsp
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
