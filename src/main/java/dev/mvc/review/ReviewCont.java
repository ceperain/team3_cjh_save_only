package dev.mvc.review;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.keylist.KeylistProcInter;
import dev.mvc.keylist.KeylistVO;
import dev.mvc.keyword.KeywordProcInter;
import dev.mvc.keyword.KeywordVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;



@Controller
public class ReviewCont {
    @Autowired
    @Qualifier("dev.mvc.review.ReviewProc")
    private ReviewProcInter reviewProc;
    
    @Autowired
    @Qualifier("dev.mvc.keyword.KeywordProc")
    private KeywordProcInter keywordProc;
    
    @Autowired
    @Qualifier("dev.mvc.keylist.KeylistProc")
    private KeylistProcInter keylistProc;

    
    public ReviewCont() {
        
    }

    /**
     * 등록폼 사전 준비된 레코드: 관리자 1번, reviewno 1번, reviewno 1번을 사용하는 경우 테스트 URL
     * http://localhost:9091/review/create.do?reviewno=2
     * 
     * @return
     */
    @RequestMapping(value = "/review/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("/review/create"); // /webapp/WEB-INF/views/review/create.jsp
        // String content = "장소:\n인원:\n준비물:\n비용:\n기타:\n";
        // mav.addObject("content", content);

        return mav; // forward
    }

    /**
     * 등록 처리 http://localhost:9091/review/create.do
     * 
     * @return
     */
    @SuppressWarnings("unused")
    @RequestMapping(value = "/review/create.do", method = RequestMethod.POST)
    public ModelAndView create(ReviewVO reviewVO, @RequestParam(value="keylistno", required = false) List<Integer> keylistno ) {
        System.out.println("->ReviewCreate생성");
        ModelAndView mav = new ModelAndView();

        // ------------------------------------------------------------------------------
        // 파일 전송 코드 시작
        // ------------------------------------------------------------------------------
        String file1 = ""; // 원본 파일명 image
        String file1saved = ""; // 저장된 파일명, image
        String thumb = ""; // preview image
        
        // 기준 경로 확인
        String user_dir = System.getProperty("user.dir"); // 시스템 제공
        System.out.println("-> User dir: " + user_dir);
        // --> User dir: C:\kd\ws_java\team3_v2sbm3c

        // 파일 접근임으로 절대 경로 지정, static 폴더 지정
        // 완성된 경로 C:/kd/ws_java/team3_v2sbm3c/src/main/resources/static/review/storage
        String upDir = user_dir + "/src/main/resources/static/review/storage/"; // 절대 경로
        System.out.println("-> upDir: " + upDir);

        // 전송 파일이 없어도 file1MF 객체가 생성됨.
        // <input type='file' class="form-control" name='file1MF' id='file1MF'
        // value='' placeholder="파일 선택">
        MultipartFile mf = reviewVO.getFile1MF();
        System.out.println(mf);
        file1 = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출
        System.out.println("-> file1: " + file1);

        if(file1.length() <1) {
            file1saved="";
        } else {
            file1saved = Upload.saveFileSpring(mf, upDir);
        }
        if (Tool.isImage(file1saved)) { // 이미지인지 검사
            // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
            thumb = Tool.preview(upDir, file1saved, 200, 150);
        }

        reviewVO.setFile1(file1);
        reviewVO.setFile1saved(file1saved);
        reviewVO.setThumb(thumb);
        // ------------------------------------------------------------------------------
        // 파일 전송 코드 종료
        // ------------------------------------------------------------------------------

        // Call By Reference: 메모리 공유, Hashcode 전달
        int cnt = this.reviewProc.create(reviewVO);
        // ------------------------------------------------------------------------------
        // PK의 return
        // ------------------------------------------------------------------------------
//        System.out.println("--> reviewno: " + reviewVO.getReviewno());
//        mav.addObject("reviewno", reviewVO.getReviewno()); // redirect
        // parameter 적용
        // ------------------------------------------------------------------------------

//        if (cnt == 1) {
//            mav.addObject("code", "create_success");
//            // reviewProc.increaseCnt(reviewVO.getReviewno()); // 글수 증가
//        } else {
//            mav.addObject("code", "create_fail");
//        }
        //mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
       // mav.addObject("reviewno", + reviewVO.getReviewno());

        System.out.println("--> reviewno: " + reviewVO.getReviewno());
        // redirect시에 hidden tag로 보낸것들이 전달이 안됨으로 request에 다시 저장
     //   mav.addObject("reviewVO", reviewVO); // redirect parameter 적용
        //mav.addObject("url", "/review/msg"); // msg.jsp, redirect parameter 적용
        
        //==============================================================
        
        
        
        if(!(keylistno == null)) {
            for (int k : keylistno) {
                cnt=this.keywordProc.create(k);
               }
        }
        
        
        

        mav.setViewName("redirect:/review/list.do");

        return mav; // forward
    }
    
    
    // http://localhost:9091/review/list.do
    /**
     * 목록
     * 
     * @return
     */
    @RequestMapping(value = "/review/list.do", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();

        // 등록 순서별 출력
        //List<ReviewVO> list = this.reviewProc.list_reviewno_asc();

        // 출력
       List<ReviewVO> list = this.reviewProc.list_reviewno();
       
        mav.addObject("list", list); // request.setAttribute("list", list);

        mav.setViewName("/review/list"); // /webapp/WEB-INF/views/review/list.jsp
        return mav;
    }
    
 // http://localhost:9091/review/read.do
    /**
     * 조회
     * 
     * @return
     */
    @RequestMapping(value = "/review/read.do", method = RequestMethod.GET)
    public ModelAndView read(int reviewno) {
        ModelAndView mav = new ModelAndView();

        ReviewVO reviewVO = this.reviewProc.read(reviewno);
        mav.addObject("reviewVO", reviewVO); // request.setAttribute("reviewVO", reviewVO);
        
        List<KeywordVO> list=this.keywordProc.read(reviewno);
        mav.addObject("list", list);
        
        if(!(list == null)) {
            HashMap< Integer, String>  m= new HashMap<Integer, String>(); 
            KeylistVO keylistVO= null;
            for (KeywordVO k : list) {
                keylistVO = this.keylistProc.read(k.getKeylistno());   
                m.put(keylistVO.getKeylistno(), keylistVO.getKeytext());
               }
            
            mav.addObject("m", m);
        }
       

        mav.setViewName("/review/read"); // /WEB-INF/views/review/read.jsp

        return mav;
    }
    
    /**
     * 수정 폼 http://localhost:9091/review/update.do?reviewno=1
     * 
     * @return
     */
    @RequestMapping(value = "/review/update.do", method = RequestMethod.GET)
    public ModelAndView update(int reviewno) {
        ModelAndView mav = new ModelAndView();

        ReviewVO reviewVO = this.reviewProc.read(reviewno);
        mav.addObject("reviewVO", reviewVO);
        
     
        
        List<KeywordVO> list=this.keywordProc.read(reviewno);
        mav.addObject("list", list);
        
        if(!(list == null)) {
            HashMap< Integer, String>  m= new HashMap<Integer, String>(); 
            KeylistVO keylistVO= null;
            for (KeywordVO k : list) {
                keylistVO = this.keylistProc.read(k.getKeylistno());   
                m.put(keylistVO.getKeylistno(), keylistVO.getKeytext());
               }
            
            mav.addObject("m", m);
        }
        

        mav.setViewName("/review/update"); // /WEB-INF/views/review/update_text.jsp
        // String content = "장소:\n인원:\n준비물:\n비용:\n기타:\n";
        // mav.addObject("content", content);

        return mav; // forward
    }

    /**
     * 수정 처리 http://localhost:9091/review/update.do?reviewno=1
     * 
     * @return
     */
    @RequestMapping(value = "/review/update.do", method = RequestMethod.POST)
    public ModelAndView update(HttpServletRequest request, ReviewVO reviewVO, KeywordVO keywordVO, @RequestParam(value="keylistno", required = false) List<Integer> keylistno) {
        ModelAndView mav = new ModelAndView();
        
       
        

       // 삭제할 파일 정보를 읽어옴, 기존에 등록된 레코드 저장용
        ReviewVO reviewVO_old = reviewProc.read(reviewVO.getReviewno());

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("reviewno", reviewVO.getReviewno());

        int cnt = this.reviewProc.update(reviewVO);
        //System.out.println(cnt);

        mav.addObject("reviewno", reviewVO.getReviewno());
        mav.setViewName("redirect:/review/list.do");
        
        cnt=this.keywordProc.delete(reviewVO.getReviewno());
        int reviewno = reviewVO.getReviewno();
        keywordVO.setReviewno(reviewno);       
        if(!(keylistno == null)) {
            for (int k : keylistno) {
                keywordVO.setKeylistno(k);             
                cnt=this.keywordProc.create2(keywordVO);
               }
        }


        // -------------------------------------------------------------------
        // 파일 삭제 코드 시작
        // -------------------------------------------------------------------
//          System.out.println("reviewno: " + vo.getReviewno());
//          System.out.println("file1: " + vo.getFile1());

        String file1saved = reviewVO_old.getFile1saved(); // 실제 저장된 파일명
        //System.out.println(file1saved);
        String thumb = reviewVO_old.getThumb(); // 실제 저장되니 preview 이미지 파일명
        
        // 완성된 경로 C:/kd/ws_java/team3_v2sbm3c/src/main/resources/static/review/storage/
        String upDir = System.getProperty("user.dir") + "/src/main/resources/static/review/storage/"; // 절대 경로
        System.out.println(upDir);
        // -------------------------------------------------------------------
        // 파일 삭제 종료 시작
        // -------------------------------------------------------------------

        // -------------------------------------------------------------------
        // 파일 전송 코드 시작
        // -------------------------------------------------------------------
        String file1 = ""; // 원본 파일명 image

        // 완성된 경로 F:/ai8/ws_frame/team3_v2sbm3c/src/main/resources/static/review/storage/
        // String upDir = System.getProperty("user.dir") +
        // "/src/main/resources/static/review/storage/"; // 절대 경로

        // 전송 파일이 없어도 fnamesMF 객체가 생성됨.
        // <input type='file' class="form-control" name='file1MF' id='file1MF'
        // value='' placeholder="파일 선택">
        MultipartFile mf = reviewVO.getFile1MF();//File1MFnull
        System.out.println(mf); // null
     
        file1 = mf.getOriginalFilename(); // 원본 파일명
        System.out.println(file1+"파일");
        
        if(file1.length() <1) {
            file1saved="";
        } else {
            System.out.println(file1+"파일2");
            file1saved = Upload.saveFileSpring(mf, upDir);
        }
        if (Tool.isImage(file1saved)) { // 이미지인지 검사
            // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
            thumb = Tool.preview(upDir, file1saved, 200, 150);
        }

        

        reviewVO.setFile1(file1);
        reviewVO.setFile1saved(file1saved);
        reviewVO.setThumb(thumb);
        // -------------------------------------------------------------------
        // 파일 전송 코드 종료
        // -------------------------------------------------------------------

        // Call By Reference: 메모리 공유, Hashcode 전달
        cnt = this.reviewProc.update(reviewVO);
        // System.out.println("-> cnt: " + cnt);

        mav.addObject("reviewno", reviewVO.getReviewno());
        mav.setViewName("redirect:/review/list.do"); // request -> param으로 접근 전환

        mav.addObject("reviewno", reviewVO_old.getReviewno());
        // System.out.println("-> reviewno: " + reviewVO_old.getReviewno());

        
        return mav; // forward
    }

    /**
     * 삭제 폼
     * 
     * @param reviewno
     * @return
     */
    @RequestMapping(value = "/review/delete.do", method = RequestMethod.GET)
    public ModelAndView delete(int reviewno) {
        ModelAndView mav = new ModelAndView();

        // 삭제할 정보를 조회하여 확인
        ReviewVO reviewVO = this.reviewProc.read(reviewno);

        mav.addObject("reviewVO", reviewVO);

        mav.setViewName("/review/delete"); // review/delete.jsp

        return mav;
    }

    /**
     * 삭제 처리 http://localhost:9091/review/delete.do
     * 
     * @return
     */
    @RequestMapping(value = "/review/delete.do", method = RequestMethod.POST)
    public ModelAndView delete(HttpServletRequest request, ReviewVO reviewVO) {
        ModelAndView mav = new ModelAndView();
        int reviewno = reviewVO.getReviewno();

        int cnt = 0;
        // -------------------------------------------------------------------
        // 파일 삭제 코드 시작
        // -------------------------------------------------------------------
        // 삭제할 파일 정보를 읽어옴.
        ReviewVO vo = reviewProc.read(reviewno);
//          System.out.println("reviewno: " + vo.getReviewno());
//          System.out.println("file1: " + vo.getFile1());

        String file1saved = vo.getFile1saved();
        String thumb = vo.getThumb();

        // 완성된 경로 C:/kd/ws_java/team3_v2sbm3c/src/main/resources/static/review/storage/
        String upDir = System.getProperty("user.dir") + "/src/main/resources/static/review/storage/"; // 절대 경로

        // sw = Tool.deleteFile(upDir, file1saved); // Folder에서 1건의 파일 삭제
        // sw = Tool.deleteFile(upDir, thumb); // Folder에서 1건의 파일 삭제
        // System.out.println("sw: " + sw);
        // -------------------------------------------------------------------
        // 파일 삭제 종료 시작
        // -------------------------------------------------------------------
        
        cnt = this.keywordProc.delete(reviewno);
        cnt = this.reviewProc.delete(reviewno); // DBMS 삭제

        // -------------------------------------------------------------------------------------
        // System.out.println("-> reviewno: " + vo.getReviewno());

        // 마지막 페이지의 레코드 삭제시의 페이지 번호 -1 처리

        // 10번째 레코드를 삭제후
        // 하나의 페이지가 3개의 레코드로 구성되는 경우 현재 9개의 레코드가 남아 있으면
        // 페이지수를 4 -> 3으로 감소 시켜야함.
        // -------------------------------------------------------------------------------------

        mav.setViewName("redirect:/review/list.do");
        mav.addObject("code", "delete_success");
        //mav.addObject("url", "/review/msg"); // msg.jsp, redirect parameter 적용
        mav.addObject("reviewno", reviewVO.getReviewno());
        // System.out.println("-> reviewno: " + reviewVO.getReviewno());

        return mav; // forward
    }


}
