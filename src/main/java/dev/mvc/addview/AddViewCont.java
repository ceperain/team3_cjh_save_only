package dev.mvc.addview;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cate.CateProcInter;
import dev.mvc.cate.CateVO;

@Controller
public class AddViewCont {
    @Autowired
    @Qualifier("dev.mvc.cate.CateProc") // @Component("dev.mvc.cate.CateProc")
    private CateProcInter cateProc;
  public AddViewCont(){
    System.out.println("-> AddViewCont created.");
  }
  
  private int save_index;
  
  /**
   * JSON 페이징 출력
   * http://localhost:9091/add_view/add_view.do
   * @param replyPage
   * @return
   */
  @RequestMapping(value = "/add_view/add_view.do", 
                            method = RequestMethod.GET,
                            produces="text/plain;charset=UTF-8")
  public ModelAndView add_view() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/add_view/add_view"); // /add_view/add_view.jsp
    
    return mav;
  }
  
  /**
   * JSON 페이징 출력
   * http://localhost:9091/add_view/add_view_ajax.do?replyPage=1
   * @param replyPage
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/add_view/add_view_ajax.do", 
                            method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String add_view_ajax(int replyPage) {
    System.out.println("addView 호출됨: " + replyPage);
    JSONObject obj = new JSONObject();
    obj.put("replyPage", replyPage);
    obj.put("name","JTBC");
    obj.put("title","물가상승");
    obj.put("content","5년간 물가 11%↑..담배·탄산음료·과자값 많이 올라");
  
    return obj.toString();
  }
  
  /**
   * JSON 페이징 출력
   * http://localhost:9091/add_view/add_view_pg.do
   * @param replyPage
   * @return
   */
  @RequestMapping(value = "/add_view/add_view_pg.do", 
                            method = RequestMethod.GET,
                            produces="text/plain;charset=UTF-8")
  public ModelAndView add_view_pg() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/add_view/add_view_pg"); // /add_view/add_view_pg.jsp
    
    return mav;
  }
  
  /**
   * JSON 페이징 출력
   * http://localhost:9091/add_view/add_view_pg_ajax.do?replyPage=1
   * {
   *   "list":[
   *     {"name":"JTBC","title":"물가상승","content":"5년간 물가 11%↑..담배·탄산음료·과자값 많이 올라"},
   *     {"name":"JTBC","title":"안종범/정호성","content":"'朴대통령 지시 따르고 받들어' 한목소리"}
   *   ],
   *   "replyPage":2
   * }
   * 
   * @param replyPage
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/add_view/add_view_pg_ajax.do", 
                            method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String add_view_pg(int replyPage) {
    System.out.println("addView 호출됨: " + replyPage);
    
    JSONObject main_obj = new JSONObject();
    main_obj.put("replyPage", replyPage+1);

    JSONArray list = new JSONArray();
    
    int cateno = 7;
    List<CateVO> catelist = this.cateProc.list(cateno);
    
    System.out.println("--> catelist.size(): " + catelist.size());
    
    //for(int idx = 0; idx < catelist.size(); idx++) {
    for(CateVO l : catelist) {
        JSONObject obj = new JSONObject();
        obj.put("s_name", l.getS_name());
        obj.put("s_address",l.getS_address());
        obj.put("s_storeno",l.getS_storeno());
        list.put(obj);
        
        save_index = l.getCateno();
    }
//    obj = new JSONObject();
//    obj.put("name","JTBC");
//    obj.put("title","안종범/정호성");
//    obj.put("content","'朴대통령 지시 따르고 받들어' 한목소리");
//    list.put(obj);
    
    main_obj.put("list", list);
    
    return main_obj.toString();
  }
  
  
}


 