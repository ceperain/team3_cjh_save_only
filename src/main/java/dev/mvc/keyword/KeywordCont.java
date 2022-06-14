package dev.mvc.keyword;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller
public class KeywordCont {
    @Autowired
    @Qualifier("dev.mvc.keyword.KeywordProc")
    private KeywordProcInter keywordProc;

    public KeywordCont() {

    }

    /*    *//**
             * 등록폼 사전 준비된 레코드: 관리자 1번, keywordno 1번, keywordno 1번을 사용하는 경우 테스트 URL
             * http://localhost:9091/keyword/create.do?keywordno=2
             * 
             * @return
             */
    /*
     * @RequestMapping(value = "/keyword/create.do", method = RequestMethod.GET)
     * public ModelAndView create() { ModelAndView mav = new ModelAndView();
     * 
     * mav.setViewName("/keyword/create"); //
     * /webapp/WEB-INF/views/keyword/create.jsp // String content =
     * "장소:\n인원:\n준비물:\n비용:\n기타:\n"; // mav.addObject("content", content);
     * 
     * return mav; // forward }
     * 
     *//**
        * 등록 처리 http://localhost:9091/keyword/create.do
        * 
        * @return
        *//*
           * @SuppressWarnings("unused")
           * 
           * @RequestMapping(value = "/keyword/create.do", method = RequestMethod.POST)
           * public ModelAndView create(ReviewVO keywordVO) {
           * System.out.println("->ReviewCreate생성"); ModelAndView mav = new
           * ModelAndView();
           * 
           * //
           * -----------------------------------------------------------------------------
           * - // 파일 전송 코드 시작 //
           * -----------------------------------------------------------------------------
           * - String file1 = ""; // 원본 파일명 image String file1saved = ""; // 저장된 파일명,
           * image String thumb = ""; // pkeyword image
           * 
           * // 기준 경로 확인 String user_dir = System.getProperty("user.dir"); // 시스템 제공
           * System.out.println("-> User dir: " + user_dir); // --> User dir:
           * C:\kd\ws_java\team3_v2sbm3c
           * 
           * // 파일 접근임으로 절대 경로 지정, static 폴더 지정 // 완성된 경로
           * C:/kd/ws_java/team3_v2sbm3c/src/main/resources/static/keyword/storage String
           * upDir = user_dir + "/src/main/resources/static/keyword/storage/"; // 절대 경로
           * System.out.println("-> upDir: " + upDir);
           * 
           * // 전송 파일이 없어도 file1MF 객체가 생성됨. // <input type='file' class="form-control"
           * name='file1MF' id='file1MF' // value='' placeholder="파일 선택"> MultipartFile mf
           * = keywordVO.getFile1MF(); System.out.println(mf); file1 =
           * Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출
           * System.out.println("-> file1: " + file1);
           * 
           * if(file1.length() <1) { file1saved=""; } else { file1saved =
           * Upload.saveFileSpring(mf, upDir); } if (Tool.isImage(file1saved)) { // 이미지인지
           * 검사 // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150 thumb =
           * Tool.pkeyword(upDir, file1saved, 200, 150); }
           * 
           * keywordVO.setFile1(file1); keywordVO.setFile1saved(file1saved);
           * keywordVO.setThumb(thumb); //
           * -----------------------------------------------------------------------------
           * - // 파일 전송 코드 종료 //
           * -----------------------------------------------------------------------------
           * -
           * 
           * // Call By Reference: 메모리 공유, Hashcode 전달 int cnt =
           * this.keywordProc.create(keywordVO); //
           * -----------------------------------------------------------------------------
           * - // PK의 return //
           * -----------------------------------------------------------------------------
           * - // System.out.println("--> keywordno: " + keywordVO.getReviewno()); //
           * mav.addObject("keywordno", keywordVO.getReviewno()); // redirect // parameter
           * 적용 //
           * -----------------------------------------------------------------------------
           * -
           * 
           * // if (cnt == 1) { // mav.addObject("code", "create_success"); // //
           * keywordProc.increaseCnt(keywordVO.getReviewno()); // 글수 증가 // } else { //
           * mav.addObject("code", "create_fail"); // } //mav.addObject("cnt", cnt); //
           * request.setAttribute("cnt", cnt) // mav.addObject("keywordno", +
           * keywordVO.getReviewno());
           * 
           * System.out.println("--> keywordno: " + keywordVO.getReviewno()); //
           * redirect시에 hidden tag로 보낸것들이 전달이 안됨으로 request에 다시 저장 //
           * mav.addObject("keywordVO", keywordVO); // redirect parameter 적용
           * //mav.addObject("url", "/keyword/msg"); // msg.jsp, redirect parameter 적용
           * 
           * mav.setViewName("redirect:/keyword/list.do");
           * 
           * return mav; // forward }
           */

}
