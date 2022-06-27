package dev.mvc.fav;

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
public class FavCont {

    @Autowired
    @Qualifier("dev.mvc.fav.FavProc")
    private FavProcInter favProc;

    public FavCont() {

    }

    @RequestMapping(value = "/fav/test.do", method = RequestMethod.GET)
    public ModelAndView test(int storeno, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("usersno", (Integer) session.getAttribute("usersno"));
        mav.addObject("storeno", storeno);
        mav.setViewName("/fav/test");
        return mav;
    }
    
    /**
     * 
     * @param email
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/fav/visit.do", method = RequestMethod.GET)
    public String favData(int storeno, HttpSession session) {
        JSONObject json = new JSONObject();
        Object tmp_usersno = session.getAttribute("usersno");// 임시
        int usersno = -1;
        if (tmp_usersno != null) {
            usersno = (Integer) tmp_usersno;
        }

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("usersno", usersno);
        map.put("storeno", storeno);
        FavVO favVO = this.favProc.read(map);

        
        int favcheck = 0;
        if (favVO != null) {
            favcheck = favVO.getFavcheck();
            System.out.println("fav not null");
            json.put("storeno", favVO.getStoreno());
        }
        
        if (this.favProc.countfav(map) == 0) {
            this.favProc.create(map);
        }

        
        json.put("favcheck", favcheck);

        return json.toString();
    }

    /**
     * 
     * @param email
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/fav/fav.do", method = RequestMethod.GET)
    public String favorite(int storeno, HttpSession session) {
        JSONObject json = new JSONObject();
        Object tmp_usersno = session.getAttribute("usersno");// 임시
        int usersno = -1;
        if (tmp_usersno != null) {
            usersno = (Integer) tmp_usersno;
        }

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("usersno", usersno);
        map.put("storeno", storeno);
        FavVO favVO = this.favProc.read(map);

        
        int favcheck = 0;
        if (favVO != null) {
            favcheck = favVO.getFavcheck();
            System.out.println("fav not null");
        }
        
        if (this.favProc.countfav(map) == 0) {
            this.favProc.create(map);
        }

        if (favcheck == 0) {
            this.favProc.favcheck(map);
            favcheck++;
        }
        else {
            this.favProc.favcheck_cancel(map);
            favcheck = 0;
        }

        json.put("storeno", favVO.getStoreno());
        json.put("favcheck", favcheck);

        return json.toString();
    }
    
    @RequestMapping(value="/favorite.do" ,method = RequestMethod.GET)
    public ModelAndView favlist(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        Object tmp_usersno = session.getAttribute("usersno");// 임시
        int usersno = 0;
        if (tmp_usersno != null) {
            usersno = (Integer) tmp_usersno;
            List<FavDataVO> list = this.favProc.favorite_list(usersno);
            
            mav.addObject("list", list);
            mav.addObject("usersno", usersno);
            mav.setViewName("/fav/fav_list");
            
        } else {
            mav.setViewName("redirect:/");
        }
        
        return mav;
    }

}
