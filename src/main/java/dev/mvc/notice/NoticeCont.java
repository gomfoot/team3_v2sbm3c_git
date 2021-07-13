package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class NoticeCont {
  @Autowired
  @Qualifier("dev.mvc.notice.NoticeProc")
  private NoticeProcInter noticeProc;
  
  public NoticeCont() {
    System.out.println("-> NoticeCont created.");
  }
  
  
  /**
   * 새로고침 방지
   * @return
   */
  @RequestMapping(value="/notice/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }

  
  
  
  /**
   * 목록 + 검색 + 페이징 지원
   * http://localhost:9091/Notice/list_by_cateno_search_paging.do?cateno=1&word=스위스&now_page=1
   * 
   * @param cateno
   * @param word
   * @param now_page
   * @return
   */
  @RequestMapping(value = "/notice/list_notice_paging.do", method = RequestMethod.GET)
  public ModelAndView list_notice_paging(
      @RequestParam(value = "now_page", defaultValue = "1") int now_page,
      HttpServletRequest request) {

    ModelAndView mav = new ModelAndView();
    if(now_page<0) {
      now_page=1;
    }
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("now_page", now_page); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용

    // 검색 목록
    List<NoticeVO> list = noticeProc.list_notice_paging(map);
    mav.addObject("list", list);
    // 검색된 레코드 갯수
    int search_count = noticeProc.search_count();
    mav.addObject("search_count", search_count);
    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
     * 18 19 20 [다음]
     * @param list_file 목록 파일명
     * @param cateno 카테고리번호
     * @param search_count 검색(전체) 레코드수
     * @param now_page 현재 페이지
     * @param word 검색어
     * @return 페이징 생성 문자열
     */
    String paging = noticeProc.pagingBox("list_notice_paging.do", search_count, now_page);
    mav.addObject("paging", paging);

    mav.addObject("now_page", now_page);

    // /Notice/list_by_cateno_table_img1_search_paging.jsp
    mav.setViewName("/notice/list_notice_paging");
    
    return mav;
  }
  
  /**
   * 조회
   * @return
   */
  @RequestMapping(value="/notice/notice_read.do", method=RequestMethod.GET )
  public ModelAndView read(HttpServletRequest request, int noticeno) {
    // public ModelAndView read(int contentsno, int now_page) {
    // System.out.println("-> now_page: " + now_page);
    
    ModelAndView mav = new ModelAndView();

    NoticeVO noticeVO = this.noticeProc.read(noticeno);
    mav.addObject("noticeVO", noticeVO); // request.setAttribute("contentsVO", contentsVO);

    mav.setViewName("/notice/notice_read"); // /WEB-INF/views/contents/read.jsp

    
    return mav;
  }
  
  /**
   * 삭제
   * @return
   */
  @RequestMapping(value="/notice/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int noticeno) {
    // public ModelAndView read(int contentsno, int now_page) {
    // System.out.println("-> now_page: " + now_page);
    
    ModelAndView mav = new ModelAndView();

    int cnt = this.noticeProc.delete(noticeno);
    mav.setViewName("redirect:/notice/list_notice_paging.do"); 

    
    return mav;
  }
  
  
  /**
   * 등록폼
   * 
   * @return
   */
  @RequestMapping(value = "/notice/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/notice/create");

    return mav; // forward
  }
  
  /**
   * 생성
   * @return
   */
  @RequestMapping(value="/notice/create.do", method=RequestMethod.POST )
  public ModelAndView create(NoticeVO noticeVO) {
    // public ModelAndView read(int contentsno, int now_page) {
    // System.out.println("-> now_page: " + now_page);
    
    ModelAndView mav = new ModelAndView();

    int cnt = this.noticeProc.create(noticeVO);
    mav.setViewName("redirect:/notice/list_notice_paging.do"); 

    
    return mav;
  }
  
}
