package dev.mvc.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
     * 
     * @param email
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/users/checkEmail.do", method = RequestMethod.GET)
    public String checkEmail(String email) {
        int cnt = this.usersProc.checkEmail(email);

        JSONObject json = new JSONObject();
        json.put("cnt", cnt);

        return json.toString();
    }

    /**
     * 새로고침 방지
     * 
     * @return
     */
    @RequestMapping(value = "/users/msg.do", method = RequestMethod.GET)
    public ModelAndView msg(String url) {
        ModelAndView mav = new ModelAndView();

        mav.setViewName(url); // forward

        return mav; // forward
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
            mav.addObject("name", usersVO.getName());
            mav.addObject("code", "create_success");
            System.out.println("성공");

        }
        else {
            System.out.println("실패");
            mav.addObject("code", "create_fail");
            // 회원가입 실패

        }

        mav.addObject("cnt", cnt);
//        mav.addObject("url", "/user/msg");

        mav.setViewName("redirect:/users/msg.do");
        return mav;
    }

    /**
     * 
     * @return
     */
    @RequestMapping(value = "/users/list.do", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();
        List<UsersVO> list = this.usersProc.list();

        mav.addObject("list", list);

        mav.setViewName("/users/list");
        return mav;
    }

    /**
     * 
     * @param request
     * @param return_url
     * @return
     */
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

    /**
     * 
     * @param request
     * @param respone
     * @param session
     * @param email
     * @param pwd
     * @param return_url
     * @return
     */
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
            mav.addObject("cnt", cnt);
            mav.addObject("code", "login_fail_msg");
//            mav.addObject("url", "/users/msg");
            mav.setViewName("redirect:/users/msg.do");
        }
        return mav;
    }

    /**
     * 로그아웃 처리
     * 
     * @param session
     * @return
     */
    @RequestMapping(value = "/logout.do", method = RequestMethod.GET)
    public ModelAndView logout(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        session.invalidate();

        mav.setViewName("redirect:/index.do");

        return mav;
    }

    /**
     * 
     * @param session
     * @return
     */
    @RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
    public ModelAndView myPage(HttpSession session) {
        ModelAndView mav = new ModelAndView();
//        System.out.println(session.isNew());
        Object s_usersno = session.getAttribute("usersno");
        if(s_usersno != null) {
            int usersno = (int)s_usersno;
            UsersVO usersVO = this.usersProc.read(usersno);
            
            mav.addObject("usersVO", usersVO);
            
            mav.setViewName("/users/myPage");
        } 
        else {
            mav.setViewName("redirect:/index.do");
        }
        
        
        return mav;
    }
    
    @RequestMapping(value = "/users/update.do", method = RequestMethod.POST)
    public ModelAndView update(UsersVO usersVO) {
        ModelAndView mav = new ModelAndView();
        
        int cnt = this.usersProc.update(usersVO);
        int usersno = usersVO.getUsersno();
        UsersVO n_usersVO = this.usersProc.read(usersno);
        mav.addObject("usersVO", n_usersVO);
        
        mav.setViewName("redirect:/mypage.do");
        
        return mav;
    }

}
