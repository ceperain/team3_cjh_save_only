package dev.mvc.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.login.LoginType;

@Controller
public class UsersCont {

    @Autowired
    @Qualifier("dev.mvc.users.UsersProc")
    private UsersProcInter usersProc;

    public UsersCont() {

    }

    /**
     * 회원가입 페이지
     * 
     * @return
     */
    @RequestMapping(value = "/users/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/users/create");
        return mav;
    }

    /**
     * 회원가입 기능 처리
     * 
     * @param usersVO
     * @return
     */
    @RequestMapping(value = "/users/create.do", method = RequestMethod.POST)
    public ModelAndView create(UsersVO usersVO) {
        ModelAndView mav = new ModelAndView();

        int cnt = this.usersProc.create(usersVO);

        if (cnt == 1) {
            // 회원가입 성공
            System.out.println("성공");

        }
        else {
            System.out.println("실패");
            // 회원가입 실패

        }

        mav.addObject("cnt", cnt);

        mav.setViewName("redirect:/users/msg.do");
        return mav;
    }

    @RequestMapping(value = "/users/list.do", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();
        List<UsersVO> list = this.usersProc.list();

        mav.addObject("list", list);

        mav.setViewName("/users/list");
        return mav;
    }

    @RequestMapping(value = "/login.do", method = RequestMethod.GET)
    public ModelAndView login(HttpServletRequest request,
            @RequestParam(value = "", defaultValue = "") String return_url) {
        ModelAndView mav = new ModelAndView();

        // 아이디 비밀번호 저장 기능 미구현
//        Cookie[] cookies = request.getCookies();
//        Cookie cookie = null;

        mav.addObject("return_url", return_url);

        mav.setViewName("/users/login");
        return mav;
    }

    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request, HttpServletResponse respone, HttpSession session,
            String email, String pwd, String return_url) {
        ModelAndView mav = new ModelAndView();

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("email", email);
        map.put("pwd", pwd);

        int cnt = this.usersProc.login(map);
        if (cnt == 1) {
            UsersVO usersVO = this.usersProc.readByEmail(email);
            session.setAttribute("usersno", usersVO.getUsersno());
            session.setAttribute("email", email);
            session.setAttribute("name", usersVO.getName());
            session.setAttribute("type", LoginType.Normal);

            if (return_url.length() > 0) {
                mav.setViewName("redirect:" + return_url);
            }
            else {
                mav.setViewName("redirect:/index.do");
            }
        }
        else {
            mav.addObject("url", "login_fail_msg");
            mav.setViewName("redirect:/users/msg.do");
        }

        return mav;

    }

}
