package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


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
        
        /**
         * 등록 폼
         * 
         * @return
         */
        @RequestMapping(value = "/notice/create.do", method = RequestMethod.GET)
        public ModelAndView create() {
            ModelAndView mav = new ModelAndView();
            mav.setViewName("/notice/create"); // webapp/WEB-INF/views/notice/create.jsp

            return mav; // forward
        }

        // http://localhost:9091/notice/create.do
       
        /**
         * 등록처리
         * MyctVO myctVO 객체안의 필드들이 <form> 태그에 존재하면 자동으로 setter 호출됨. 
         * http://localhost:9091/myct/create.do?ptucgno=2
         * Exception: FK 전달이 안됨.
         * Field error in object 'myctVO' on field 'ptucgno': rejected value [];
         * codes [typeMismatch.myctVO.ptucgno,typeMismatch.ptucgno,typeMismatch.int,typeMismatch]; 
         * arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [myctVO.ptucgno,ptucgno];
         * arguments []; default message [ptucgno]]; 
         * default message [Failed to convert property value of type 'java.lang.String' to required type 'int' for property 'ptucgno';
         * nested exception is java.lang.NumberFormatException: For input string: ""]]
         * @return
         */
        @RequestMapping(value = "/notice/create.do", method = RequestMethod.POST)
        public ModelAndView create(NoticeVO noticeVO) {
          ModelAndView mav = new ModelAndView();

          // System.out.println("-> ptucgno: " + myctVO.getPtucgno());
          
          int cnt = this.noticeProc.create(noticeVO);
          System.out.println("====>"+cnt);

          mav.addObject("code", "create_success");
          mav.addObject("cnt", cnt);
          mav.addObject("noticeno", noticeVO.getNoticeno());
          mav.addObject("title", noticeVO.getTitle());
          mav.addObject("contents", noticeVO.getContents());
          
          mav.setViewName("redirect:/notice/list.do");
         
          return mav;
        }
        


    
    
        /**
         * 수정 폼
         * http://localhost:9091/notice/update.do?noticeno=1
         * 
         * @return
         */
        @RequestMapping(value = "/notice/update_text.do", method = RequestMethod.GET)
        public ModelAndView update(int noticeno) {
          ModelAndView mav = new ModelAndView();
          
          NoticeVO noticeVO = this.noticeProc.read(noticeno);
          
          mav.addObject("noticeVO", noticeVO);
          
          mav.setViewName("/notice/update"); // /WEB-INF/views/notice/update.jsp
          // String contents = "장소:\n인원:\n준비물:\n비용:\n기타:\n";
          // mav.addObject("contents", contents);

          return mav; // forward
        }

        /**
         * 수정 처리
         * http://localhost:9091/notice/update.do?noticeno=1
         * 
         * @return
         */
        @RequestMapping(value = "/notice/update.do", method = {RequestMethod.POST, RequestMethod.GET})
        public ModelAndView update(NoticeVO noticeVO) {
          ModelAndView mav = new ModelAndView();
          
          HashMap<String, Object> map = new HashMap<String, Object>();
          map.put("noticeno", noticeVO.getNoticeno());
          
          int cnt = 0;
              cnt = this.noticeProc.update(noticeVO); // 수정 처리
              
              mav.addObject("noticeno", noticeVO.getNoticeno());
              mav.setViewName("redirect:/notice/read.do");             

          return mav; // forward
        }
    
        
    // http://localhost:9091/notice/delete.do
    /**
     * 조회 + 삭제폼
     * @param noticeno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/notice/delete.do", method=RequestMethod.GET )
    public ModelAndView delete1(int noticeno) {
      ModelAndView mav = new ModelAndView();
      
      NoticeVO noticeVO = this.noticeProc.read(noticeno); // 삭제할 자료 읽기
      mav.addObject("noticeVO", noticeVO);  // request 객체에 저장
      
      List<NoticeVO> list = this.noticeProc.list();
      mav.addObject("list", list);  // request 객체에 저장

      mav.setViewName("/notice/delete"); // delete.jsp
      return mav;
    }
    
    // http://localhost:9091/notice/delete.do
    /**
     * 삭제
     * @param ptucgno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/notice/delete.do", method=RequestMethod.POST )
    public ModelAndView delete(int noticeno) {
      ModelAndView mav = new ModelAndView();
      
      NoticeVO noticeVO = this.noticeProc.read(noticeno); // 삭제 정보
      mav.addObject("noticeVO", noticeVO);  // request 객체에 저장
      
      int cnt = this.noticeProc.delete(noticeno); // 삭제 처리
      mav.addObject("cnt", cnt);  // request 객체에 저장
      
      // mav.setViewName("/notice/msg"); // delete_msg.jsp
      mav.setViewName("redirect:/notice/list.do");

      return mav;
    }
    
    // http://localhost:9091/notice/read.do?noticeno=3
    /**
     * 조회
     * @return
     */
    @RequestMapping(value="/notice/read.do", method=RequestMethod.GET )
    public ModelAndView read(int noticeno) {
      ModelAndView mav = new ModelAndView();

      NoticeVO noticeVO = this.noticeProc.read(noticeno);
      mav.addObject("noticeVO", noticeVO); // request.setAttribute("noticeVO", noticeVO);


      
      mav.setViewName("/notice/read"); // /WEB-INF/views/notice/read.jsp
          
      return mav;
    }
    
}