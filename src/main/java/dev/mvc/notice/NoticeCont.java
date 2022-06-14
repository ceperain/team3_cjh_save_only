package dev.mvc.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cate.CateVO;

    @Controller
    public class NoticeCont {
        @Autowired
        @Qualifier("dev.mvc.notice.NoticeProc") // @Component("dev.mvc.notice.NoticeProc")
        private NoticeProcInter noticeProc;

        public NoticeCont() {
            System.out.println("-> NoticeCont created.");

        }
        
        /**
         * http://localhost:9091/notice/list.do
         * 
         * @return
         */
        @RequestMapping(value = "/notice/list.do", method = RequestMethod.GET)
        public ModelAndView list() {
            ModelAndView mav = new ModelAndView();

            List<NoticeVO> list = this.noticeProc.list();
            mav.addObject("list", list); // request.setAttribute("list", list);

            mav.setViewName("/notice/list"); // /WEB-INF/views/notice/list.jsp
            return mav;
        }
        
}
