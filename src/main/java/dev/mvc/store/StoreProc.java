package dev.mvc.store;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.cate.Cate;
import dev.mvc.cate.Cate_StoreVO;


@Component("dev.mvc.store.StoreProc")
public class StoreProc implements StoreProcInter{
    @Autowired
    private StoreDAOInter storeDAO;
    public StoreProc() {
     //   System.out.println("-> StoreProc created");
    }
    
    @Override
    public int create(StoreVO storevo) {
        int cnt = this.storeDAO.create(storevo);
        return cnt;
    }

    @Override
    public List<StoreVO> list_all() {
        List<StoreVO> list = this.storeDAO.list_all();
        return list;
    }
    
    @Override
    public StoreVO read(int storeno) {
        StoreVO storeVO = this.storeDAO.read(storeno);
        return storeVO;
    }
    
    @Override
    public int update(StoreVO storeVO) {
        int cnt = this.storeDAO.update(storeVO);
        return cnt;
    }
    
    @Override
    public int delete(int storeno) {
        int cnt = this.storeDAO.delete(storeno);
        return cnt;
    }
    
    @Override
    public List<StoreVO> list_search_paging(HashMap<String, Object> map) {
 
        int begin_of_page = ((Integer)map.get("now_page") - 1) * Store.RECORD_PER_PAGE;
        int start_num = begin_of_page + 1;

        int end_num = begin_of_page + Store.RECORD_PER_PAGE;   
        map.put("start_num", start_num);
        map.put("end_num", end_num);
        
        List<StoreVO> list = this.storeDAO.list_search_paging(map);
        
        return list;
    }


    @Override
    public String pagingBox(int storeno, int cnt,int now_page) {
        int total_page = (int)(Math.ceil((double)cnt/Store.RECORD_PER_PAGE)); // 전체 페이지 수 
        int total_grp = (int)(Math.ceil((double)total_page/Store.PAGE_PER_BLOCK)); // 전체 그룹  수
        int now_grp = (int)(Math.ceil((double)now_page/Store.PAGE_PER_BLOCK));  // 현재 그룹 번호
        
        int start_page = ((now_grp - 1) * Store.PAGE_PER_BLOCK) + 1; // 특정 그룹의 시작  페이지  
        int end_page = (now_grp * Store.PAGE_PER_BLOCK);               // 특정 그룹의 마지막 페이지   
         
        StringBuffer str = new StringBuffer(); 
         
        str.append("<style type='text/css'>"); 
        str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
        str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
        str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
        str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
        str.append("  .span_box_1{"); 
        str.append("    text-align: center;");    
        str.append("    font-size: 1em;"); 
        str.append("    border: 1px;"); 
        str.append("    border-style: solid;"); 
        str.append("    border-color: #cccccc;"); 
        str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
        str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
        str.append("  }"); 
        str.append("  .span_box_2{"); 
        str.append("    text-align: center;");    
        str.append("    background-color: #668db4;"); 
        str.append("    color: #FFFFFF;"); 
        str.append("    font-size: 1em;"); 
        str.append("    border: 1px;"); 
        str.append("    border-style: solid;"); 
        str.append("    border-color: #cccccc;"); 
        str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
        str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
        str.append("  }"); 
        str.append("</style>"); 
        str.append("<DIV id='paging'>"); 
//        str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
     
    
        int _now_page = (now_grp - 1) * Store.PAGE_PER_BLOCK;  
        if (now_grp >= 2){ // 현재 그룹번호가 2이상이면 페이지수가 11페이 이상임으로 이전 그룹으로 갈수 있는 링크 생성 
          str.append("<span class='span_box_1'><A href='"+Store.LIST_FILE+"?now_page="+_now_page+"&storeno="+storeno+"'>이전</A></span>"); 
        } 
     
        // 중앙의 페이지 목록
        for(int i=start_page; i<=end_page; i++){ 
          if (i > total_page){ // 마지막 페이지를 넘어갔다면 페이 출력 종료
            break; 
          } 
      
          if (now_page == i){ // 목록에 출력하는 페이지가 현재페이지와 같다면 CSS 강조(차별을 둠)
            str.append("<span class='span_box_2'>"+i+"</span>"); // 현재 페이지, 강조 
          }else{
            // 현재 페이지가 아닌 페이지는 이동이 가능하도록 링크를 설정
            str.append("<span class='span_box_1'><A href='"+Store.LIST_FILE+"?now_page="+i+"&storeno="+storeno+"'>"+i+"</A></span>");   
          } 
        } 
     
        // 10개 다음 페이지로 이동
        // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
        // 현재 페이지 5일경우 -> 현재 1그룹: (1 * 10) + 1 = 2그룹의 시작페이지 11
        // 현재 페이지 15일경우 -> 현재 2그룹: (2 * 10) + 1 = 3그룹의 시작페이지 21
        // 현재 페이지 25일경우 -> 현재 3그룹: (3 * 10) + 1 = 4그룹의 시작페이지 31
        _now_page = (now_grp * Store.PAGE_PER_BLOCK)+1; //  최대 페이지수 + 1 
        if (now_grp < total_grp){ 
          str.append("<span class='span_box_1'><A href='"+Store.LIST_FILE+"?now_page="+_now_page+"&storeno="+storeno+"'>다음</A></span>"); 
        } 
        str.append("</DIV>"); 
         
        return str.toString(); 
      }

    @Override
    public int count() {
       int cnt = this.storeDAO.count();
        return cnt;
    }
    
    
      

}