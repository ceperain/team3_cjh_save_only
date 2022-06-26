package dev.mvc.admin;

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
import dev.mvc.users.UsersVO;

@Controller
public class AdminCont {

    @Autowired
    @Qualifier("dev.mvc.admin.AdminProc")
    private AdminProcInter adminProc;

    public AdminCont() {

    }
    /**
     * 관리자 로그인 페이지로 이동
     * @return
     */
    @RequestMapping(value="/ad/login.do", method = RequestMethod.GET)
    public ModelAndView login() {
        ModelAndView mav = new ModelAndView();
        
        mav.setViewName("/admin/ad_login");
        return mav;
    }
    
    /**
     * 로그인 처리
     * @param id
     * @param pwd
     * @return
     */
    @RequestMapping(value="/ad/login.do", method = RequestMethod.POST)
    public ModelAndView login(HttpSession session ,String id, String pwd) {
        ModelAndView mav = new ModelAndView();
        

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("id", id);
        map.put("pwd", pwd);

        int cnt = this.adminProc.login(map);
        if (cnt == 1) {
            AdminVO adminVO = this.adminProc.readById(id);
            session.setAttribute("adminno", adminVO.getAdminno());
            session.setAttribute("id", id);
            session.setAttribute("name", adminVO.getName());
            session.setAttribute("type", LoginType.Admin);

            
        }
        else {
            //로그인 실패
        }
        mav.setViewName("redirect:/index.do");
        
        return mav;
        
    }


}
