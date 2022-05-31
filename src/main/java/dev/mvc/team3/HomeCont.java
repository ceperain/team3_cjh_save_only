package dev.mvc.team3;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeCont {
    public HomeCont() {
        System.out.println("-> HomeCont created.");
    }

    // http://localhost:9091
    @RequestMapping(value = { "/", "/index.do" }, method = RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/index"); // /WEB-INF/views/index.jsp

        return mav;
    }
    
//    @RequestMapping(value = {"/", "/index.do"}, method = RequestMethod.GET)
//    public String home(Locale locale, Model model) {
//
//        return "index";  // /resort/index.jsp
//    }
}