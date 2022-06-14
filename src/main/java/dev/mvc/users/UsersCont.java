package dev.mvc.users;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UsersCont {
    
    @Autowired
    @Qualifier("dev.mvc.users.UsersProc")
    private UsersProcInter usersProc;
    
    public UsersCont() {
        
    }
    /**
     * 회원가입 페이지
     * @return
     */
    @RequestMapping(value="/users/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/users/create");
        return mav;
    }
    
    /**
     * 회원가입 기능 처리
     * @param usersVO
     * @return
     */
    @RequestMapping(value="/users/create.do", method = RequestMethod.POST)
    public ModelAndView create(UsersVO usersVO) {
        ModelAndView mav = new ModelAndView();
        
        int cnt = this.usersProc.create(usersVO);
        
        if(cnt == 1) {
            //회원가입 성공
            System.out.println("성공");
            
            
        }
        else {
            System.out.println("실패");
            //회원가입 실패
            
        }
        
        mav.addObject("cnt", cnt);
        
        mav.setViewName("redirect:/users/msg.do");
        return mav;
    }
    
    @RequestMapping(value="/users/list.do", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();
        List<UsersVO> list = this.usersProc.list();
        
        mav.addObject("list", list);
        
        mav.setViewName("/users/list");
        return mav;
    }
    
    @RequestMapping(value="/login.do", method = RequestMethod.GET)
    public ModelAndView login() {
        ModelAndView mav = new ModelAndView();
        
        
        mav.setViewName("/users/login");
        return mav;
        
    }
    
    

}
