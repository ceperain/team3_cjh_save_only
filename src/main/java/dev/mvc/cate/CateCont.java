package dev.mvc.cate;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cate.CateVO;
import dev.mvc.notice.NoticeVO;
import dev.mvc.store.StoreProcInter;
import dev.mvc.store.StoreVO;

@Controller
public class CateCont {
    @Autowired
    @Qualifier("dev.mvc.cate.CateProc") // @Component("dev.mvc.cate.CateProc")
    private CateProcInter cateProc;

    @Autowired
    @Qualifier("dev.mvc.store.StoreProc")
    private StoreProcInter storeProc;

    public CateCont() {
        System.out.println("-> CateCont created.");

    }

    /**
     * Categrp + Cate join, 연결 목록 http://localhost:9091/cate/lis.do
     * 
     * @return
     */
    @RequestMapping(value = "/cate/list.do", method = RequestMethod.GET)
    public ModelAndView list(int cateno) {
        ModelAndView mav = new ModelAndView();

        List<CateVO> list = this.cateProc.list(cateno);
        mav.addObject("list", list); // request.setAttribute("list", list);

        mav.setViewName("/cate/list"); // /WEB-INF/views/cate/list.jsp
        return mav;
    }

    /**
     * 목록 + 검색 지원
     * http://localhost:9090/cate/list_search.do?word=강원도집
     * @param cateno
     * @param word
     * @return
     */
      @RequestMapping(value = "/cate/list_search.do", method = RequestMethod.GET)
      public ModelAndView list_search(
                          @RequestParam(value = "name", defaultValue = "") String name) {
          
      ModelAndView mav = new ModelAndView(); 
           
      /*
       * // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용 HashMap<String, Object> map = new
       * HashMap<String, Object>(); map.put("cateno", cateno); // #{cateno}
       * map.put("name", name.toUpperCase()); // #{name}
       */      
      
      // 검색 목록 
      List<Cate_StoreVO> list = this.cateProc.list_search(name);
 
      mav.addObject("list", list);
     
      
      // 검색된 레코드 갯수 
      int search_count = 0;
      mav.addObject("search_count", search_count);
      
      mav.setViewName("/cate/list_search");   // /cate/list_search.jsp
      
      return mav; 
    }
      
      /**
       * 목록 + 검색 + 페이징 지원
       * http://localhost:9090/cate/list_search_paging.do?cateno=1&name=스위스&now_page=1
       * 
       * @param cateno
       * @param word
       * @param now_page
       * @return
       */
      @RequestMapping(value = "/cate/list_search_paging.do", method = RequestMethod.GET)
      public ModelAndView list_search_paging(@RequestParam(value = "cateno", defaultValue = "1") int cateno,
                                                              @RequestParam(value = "word", defaultValue = "") String word,
                                                              @RequestParam(value = "now_page", defaultValue = "1") int now_page) {
        System.out.println("--> now_page: " + now_page);

        ModelAndView mav = new ModelAndView();

        // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("cateno", cateno); // #{cateno}
        map.put("word", word); // #{word}
        map.put("now_page", now_page); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용
        
        // 검색 목록
        List<Cate_StoreVO> list = this.cateProc.list_search_paging(map);
        List<Cate_StoreVO> list_r = new ArrayList<Cate_StoreVO>();
        List<String> s = null;
        
        for(Cate_StoreVO c : list) { 
            s = this.cateProc.read_r(c.getStoreno());       
            /*
             * if((s.size() != 0 )&&(s.get(0)==null) ) { System.out.println("ddd"+s.get(0));
             * c.setFile1saved(s.get(0)); }else if((s.size() != 0 )&&(s.get(1)==null)) {
             * System.out.println("ddd"+s.get(1)); c.setFile1saved(s.get(1)); }
             */
            if(s.size() >= 1) {
            int i = s.size()-1;
            String arrayToString = String.join(" ", s.get(i));
            c.setFile1saved(arrayToString);
           System.out.println("dd : "+arrayToString);
            }
            
            list_r.add(c);
            
        }
        mav.addObject("list", list_r);
    //    mav.addObject("list", list);

        // 검색된 레코드 갯수
        int search_count = this.cateProc.search_count(map);
        mav.addObject("search_count", search_count);

        /*
         * CateVO cateVO = this.cateProc.read(cateno); mav.addObject("cateVO", cateVO);
         */


        /*
         * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
         * 18 19 20 [다음]
         * @param cateno 카테고리번호
         * @param search_count 검색(전체) 레코드수
         * @param now_page 현재 페이지
         * @param word 검색어
         * @return 페이징용으로 생성된 HTML/CSS tag 문자열
         */
        String paging = cateProc.pagingBox(cateno, search_count, now_page, word);
        mav.addObject("paging", paging);

        // mav.addObject("now_page", now_page);

        // /cate/list_search_paging.jsp
        mav.setViewName("/cate/list_search_paging");

        return mav;
      }      
     
      
      

}
