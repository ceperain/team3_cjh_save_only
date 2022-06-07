package dev.mvc.work;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.menu.MenuVO;
import dev.mvc.store.StoreProcInter;
import dev.mvc.store.StoreVO;

@Controller
public class WorkCont {
    @Autowired
    @Qualifier("dev.mvc.store.StoreProc") 
    private StoreProcInter storeProc;
    
    @Autowired
    @Qualifier("dev.mvc.work.WorkProc") 
    private WorkProcInter workProc;
    
    public WorkCont() {
        System.out.println("-> WorkCont created.");
    }
    
    @RequestMapping(value = "/worktime/create.do", method = RequestMethod.POST)
    public ModelAndView create(WorkVO workVO) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.workProc.create(workVO);
      mav.addObject("storeno", workVO.getStoreno());
      mav.setViewName("redirect:/worktime/list_storeno.do"); // GET 방식 호출, 전달되는데이터도 URL에 결합됨.
      
      return mav;
    }
    
    @RequestMapping(value="/worktime/list_storeno.do", method=RequestMethod.GET )
    public ModelAndView list_storeno(int storeno) {
      ModelAndView mav = new ModelAndView();
      
      List<WorkVO> list = this.workProc.list_storeno(storeno);
      mav.addObject("list", list); 
      StoreVO  storeVO = this.storeProc.read(storeno);
      mav.addObject("storeVO", storeVO); 
      
      mav.setViewName("/working/list_storeno"); 
      return mav;
    }
    
    @RequestMapping(value="/work/read.do", method=RequestMethod.GET )
    @ResponseBody
    public String read(int workno) {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }    
      
      WorkVO workVO = this.workProc.read(workno);
      JSONObject json = new JSONObject();
      json.put("workno", workVO.getWorkno());
      json.put("day", workVO.getDay());
      json.put("starttime", workVO.getStarttime());
      json.put("endtime", workVO.getEndtime());
      json.put("storeno", workVO.getStoreno());
      
      return json.toString();
      
    }
    
    @RequestMapping(value="/worktime/update.do", method=RequestMethod.POST )
    public ModelAndView update(WorkVO workVO) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.workProc.update(workVO);
      if(cnt==1) {
          mav.addObject("storeno", workVO.getStoreno());           
          mav.setViewName("redirect:/worktime/list_storeno.do");
      }
      return mav;
    }
    
    @RequestMapping(value="/worktime/delete.do", method=RequestMethod.POST )
    public ModelAndView delete(int workno) {
      ModelAndView mav = new ModelAndView();   
      WorkVO workVO = this.workProc.read(workno);
      int cnt = this.workProc.delete(workno);
      if(cnt==1) {        
          mav.addObject("storeno", workVO.getStoreno());       
          mav.setViewName("redirect:/worktime/list_storeno.do");
      }
      
      return mav;
    }
    
}
