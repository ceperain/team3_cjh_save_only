package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
        public ModelAndView create(NoticeVO noticeVO, HttpSession session) {
          ModelAndView mav = new ModelAndView();

          // System.out.println("-> ptucgno: " + myctVO.getPtucgno());
          int adminno = (int)session.getAttribute("adminno");
          noticeVO.setAdminno(adminno);
          
          
          int cnt = this.noticeProc.create(noticeVO);
          System.out.println("====>"+cnt);

        //  mav.addObject("code", "create_success");
       //   mav.addObject("cnt", cnt);
         // mav.addObject("noticeno", noticeVO.getNoticeno());
          mav.addObject("title", noticeVO.getTitle());
          mav.addObject("contents", noticeVO.getContents());
          
          mav.setViewName("redirect:/notice/list_search_paging.do");
         
          return mav;
        }
        


    
    


        /**
         * 수정 처리
         * http://localhost:9091/notice/update.do?noticeno=5
         * 
         * @return
         */
        @RequestMapping(value = "/notice/read_update.do", method = RequestMethod.GET)
        public ModelAndView read_update(int noticeno) {
          ModelAndView mav = new ModelAndView();
          
          NoticeVO noticeVO = this.noticeProc.read(noticeno);
          mav.addObject("noticeVO", noticeVO );
          mav.setViewName("/notice/update");

          return mav; // forward
        }

        /**
         * 수정 처리
         * http://localhost:9091/notice/update.do?noticeno=5
         * 
         * @return
         */
        @RequestMapping(value = "/notice/update.do", method = RequestMethod.POST)
        public ModelAndView update(NoticeVO noticeVO) {
          ModelAndView mav = new ModelAndView();
          
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
    
    /**
     * 목록 + 검색 지원
     * http://localhost:9090/notice/list_search.do?noticeno=1&word=스위스
     * @param noticeno
     * @param word
     * @return
     */
      @RequestMapping(value = "/notice/list_search.do", method = RequestMethod.GET)
      public ModelAndView list_search(
              @RequestParam(value = "word", defaultValue = "") String word) {
                                                    
      ModelAndView mav = new ModelAndView(); 
           
      
      
      
      
      /* noticeno가 선언이 안되어 사용할 수 없음 ResultParam에 선언 ㄱ
       * 문자열 변수 2개 이상이면 HashMap을 만들어야함
       * // 숫자와 문자열 타입을 저장해야하므로 Obejct 사용 HashMap<String, Object> map = new
       * HashMap<String, Object>(); map.put("noticeno", noticeno); // #{noticeno}
       * map.put("title", title.toUpperCase()); // #{title}
       */                                  
      
      // 검색 목록 
      List<NoticeVO> list = this.noticeProc.list_search(word);
      mav.addObject("list", list);


      
      // 검색된 레코드 갯수 
      /* int search_count = noticeProc.search_count(word); */
      int search_count=0;
      mav.addObject("search_count", search_count);
      mav.setViewName("/notice/list_search");   // /notice/list_search.jsp
      
      return mav; 
    }
      
      /**
       * 목록 + 검색 + 페이징 지원
       * http://localhost:9090/contents/list_by_cateno_search_paging.do?cateno=1&word=스위스&now_page=1
       * 
       * @param noticeno
       * @param word
       * @param now_page
       * @return
       */
      @RequestMapping(value = "/notice/list_search_paging.do", method = RequestMethod.GET)
      public ModelAndView list_search_paging(@RequestParam(value = "noticeno", defaultValue = "1") int noticeno,
                                                              @RequestParam(value = "word", defaultValue = "") String word,
                                                              @RequestParam(value = "now_page", defaultValue = "1") int now_page) {
        System.out.println("--> now_page: " + now_page);

        ModelAndView mav = new ModelAndView();

        // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("noticeno", noticeno); // #{noticeno}
        map.put("word", word); // #{word}
        map.put("now_page", now_page); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용
        // 검색 목록
        List<NoticeVO> list = this.noticeProc.list_search_paging(map);
        mav.addObject("list", list);
      
        // 검색된 레코드 갯수
//System.out.println("noticeno : "+map.get("noticeno"));
        int search_count = this.noticeProc.search_count(map);
//System.out.println("왜"+search_count);
        mav.addObject("search_count", search_count);

        NoticeVO noticeVO = this.noticeProc.read(noticeno);
        mav.addObject("noticeVO", noticeVO);

        /*
         * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
         * 18 19 20 [다음]
         * @param cateno 카테고리번호
         * @param search_count 검색(전체) 레코드수
         * @param now_page 현재 페이지
         * @param word 검색어
         * @return 페이징용으로 생성된 HTML/CSS tag 문자열
         */
        String paging = this.noticeProc.pagingBox(noticeno, search_count, now_page, word);
        mav.addObject("paging", paging);

        // mav.addObject("now_page", now_page);

        // /contents/list_by_cateno_table_img1_search_paging.jsp
        mav.setViewName("/notice/list_search_paging");

        return mav;
      }

    
}