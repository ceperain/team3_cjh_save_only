package dev.mvc.keylist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class KeylistCont {
    @Autowired
    @Qualifier("dev.mvc.keylist.KeylistProc")
    private KeylistProcInter keylistProc;

    public KeylistCont() {

    }

    @RequestMapping(value = "/keylist/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/keylist/create"); // webapp/WEB-INF/views/keylist/create.jsp

        return mav; // forward
    }
    
}
