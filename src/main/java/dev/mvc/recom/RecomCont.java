package dev.mvc.recom;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cate.CateProcInter;

@Controller
public class RecomCont {
    @Autowired
    @Qualifier("dev.mvc.cate.CateProc") // @Component("dev.mvc.cate.CateProc")
    private CateProcInter cateProc;
    
    public RecomCont() {
        System.out.println("-> RecomCont created.");
    }

    // http://localhost:9091
    @RequestMapping(value = {"/recom/recom.do"}, method = RequestMethod.GET)
    public ModelAndView recom(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        
        if (session.getAttribute("usersno") != null) {
            int usersno = (int)session.getAttribute("usersno");
            // System.out.println(usersno);
            
            mav.addObject("usersno", usersno);
            mav.setViewName("/recom/recom");
            
        } else {
            mav.addObject("return_url", "/recom/recom.do");
            mav.setViewName("/users/login");
        }

        return mav;
    }
}