package dev.mvc.menu;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.store.StoreProcInter;
import dev.mvc.store.StoreVO;

@Controller
public class MenuCont {
    @Autowired
    @Qualifier("dev.mvc.store.StoreProc") 
    private StoreProcInter storeProc;

    @Autowired
    @Qualifier("dev.mvc.menu.MenuProc") 
    private MenuProcInter menuProc;
    
    public MenuCont() {
        System.out.println("-> MenuCont created.");
    }
    
    @RequestMapping(value = "/menu/create.do", method = RequestMethod.POST)
    public ModelAndView create(MenuVO menuVO) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.menuProc.create(menuVO);
      mav.addObject("storeno", menuVO.getStoreno());
      mav.setViewName("redirect:/menu/list_storeno.do"); // GET 방식 호출, 전달되는데이터도 URL에 결합됨.
      
      return mav;
    }
    
    @RequestMapping(value="/menu/list_storeno.do", method=RequestMethod.GET )
    public ModelAndView list_storeno(int storeno) {
      ModelAndView mav = new ModelAndView();
      
      List<MenuVO> list = this.menuProc.list_storeno(storeno);
      mav.addObject("list", list); 
      StoreVO  storeVO = this.storeProc.read(storeno);
      mav.addObject("storeVO", storeVO); 
      
      mav.setViewName("/menu/list_storeno"); 
      return mav;
    }
    
    @RequestMapping(value="/menu/read.do", method=RequestMethod.GET )
    @ResponseBody
    public String read(int menuno) {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }    
      
      MenuVO menuVO = this.menuProc.read(menuno);
      JSONObject json = new JSONObject();
      json.put("menuno", menuVO.getMenuno());
      json.put("name", menuVO.getName());
      json.put("price", menuVO.getPrice());
      json.put("storeno", menuVO.getStoreno());
      
      return json.toString();
      
    }
    
    @RequestMapping(value="/menu/update.do", method=RequestMethod.POST )
    public ModelAndView update(MenuVO menuVO) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.menuProc.update(menuVO); 
      if(cnt==1) {
          mav.addObject("storeno", menuVO.getStoreno());           
          mav.setViewName("redirect:/menu/list_storeno.do");
      }
      return mav;
    }
    
    @RequestMapping(value="/menu/delete.do", method=RequestMethod.POST )
    public ModelAndView delete(int menuno) {
      ModelAndView mav = new ModelAndView();   
      MenuVO menuVO = this.menuProc.read(menuno);
      int cnt = this.menuProc.delete(menuno);     
      if(cnt==1) {        
          mav.addObject("storeno", menuVO.getStoreno());       
          mav.setViewName("redirect:/menu/list_storeno.do");
      }
      
      return mav;
    }
    
}
