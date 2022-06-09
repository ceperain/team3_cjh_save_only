package dev.mvc.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;



@Controller
public class ReviewCont {
    @Autowired
    @Qualifier("dev.mvc.review.ReviewProc")
    private ReviewProcInter reviewProc;
    
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
    public ModelAndView create(ReviewVO reviewVO) {
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

        file1 = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출
        System.out.println("-> file1: " + file1);

        file1saved = Upload.saveFileSpring(mf, upDir);

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
        System.out.println("--> reviewno: " + reviewVO.getReviewno());
        mav.addObject("reviewno", reviewVO.getReviewno()); // redirect
        // parameter 적용
        // ------------------------------------------------------------------------------

        if (cnt == 1) {
            mav.addObject("code", "create_success");
            // reviewProc.increaseCnt(reviewVO.getReviewno()); // 글수 증가
        } else {
            mav.addObject("code", "create_fail");
        }
        //mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
       // mav.addObject("reviewno", + reviewVO.getReviewno());

        System.out.println("--> reviewno: " + reviewVO.getReviewno());
        // redirect시에 hidden tag로 보낸것들이 전달이 안됨으로 request에 다시 저장
     //   mav.addObject("reviewVO", reviewVO); // redirect parameter 적용
        //mav.addObject("url", "/review/msg"); // msg.jsp, redirect parameter 적용

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

        mav.setViewName("/review/read"); // /WEB-INF/views/review/read.jsp

        return mav;
    }
    

}
