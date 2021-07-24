package dev.mvc.qna;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import dev.mvc.admin.AdminVO;
import dev.mvc.answer.AnswerProcInter;
import dev.mvc.answer.AnswerVO;
import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;


@Controller
public class QnaCont {
  @Autowired // CategrpProcInter를 구현한 CategrpProc.java의 객체가 할당
  @Qualifier("dev.mvc.qna.QnaProc")
  private QnaProcInter qnaProc;
  
  @Autowired // CategrpProcInter를 구현한 CategrpProc.java의 객체가 할당
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  @Autowired // CategrpProcInter를 구현한 CategrpProc.java의 객체가 할당
  @Qualifier("dev.mvc.answer.AnswerProc")
  private AnswerProcInter answerProc;
  
  
  public QnaCont() {
    System.out.println("-> QnaCont created.");
  }
  
  // http://localhost:9091/categrp/create.do
  

  /**
   * 새로고침 방지
   * @return
   */
  @RequestMapping(value="/qna/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/qna/create.do", method=RequestMethod.GET )
  public ModelAndView create(int memberno) {
    ModelAndView mav = new ModelAndView();
    
    MemberVO memberVO = this.memberProc.read(memberno);
    
    mav.addObject("memberVO",memberVO);

    
    mav.setViewName("/qna/create"); // /WEB-INF/views/categrp/create.jsp
    
    return mav; // forward
  }
  
  // http://localhost:9091/categrp/create.do
  /**
   * 등록 처리
   * @param categrpVO
   * @return
   */
  @RequestMapping(value="/qna/create.do", method=RequestMethod.POST )
  public ModelAndView create(QnaVO qnaVO) { 
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.qnaProc.create(qnaVO); // 등록 처리
    
    mav.addObject("cnt",cnt);
    
    mav.setViewName("redirect:/qna/list_all.do");

    return mav; // forward
  }
  
  @RequestMapping(value = "/qna/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all(
    @RequestParam(value = "now_page", defaultValue = "1") int now_page,
    HttpServletRequest request ) {

  ModelAndView mav = new ModelAndView();
  if(now_page<0) {
    now_page=1;
  }
  // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
  HashMap<String, Object> map = new HashMap<String, Object>();
  map.put("now_page", now_page); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용

  // 검색 목록
  List<QnaVO> list = qnaProc.list_all(map);
  mav.addObject("list", list);
  // 검색된 레코드 갯수
  int search_count = qnaProc.search_count();
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
  String paging = qnaProc.pagingBox("list_all.do", search_count, now_page);
  mav.addObject("paging", paging);

  mav.addObject("now_page", now_page);

    mav.setViewName("/qna/list_all"); // /views/contents/list_by_cateno.jsp
    
    return mav; // forward 
  }
  
  @RequestMapping(value="/qna/qna_read.do", method=RequestMethod.GET )
  public ModelAndView read(HttpSession session,HttpServletRequest request, int qnano) {
    
    ModelAndView mav = new ModelAndView();

    QnaVO qnaVO = this.qnaProc.read(qnano);
    mav.addObject("qnaVO", qnaVO); // request.setAttribute("contentsVO", contentsVO);
   
    
    mav.setViewName("/qna/qna_read"); // /WEB-INF/views/contents/read.jsp
    if(session.getAttribute("adminno")!=null) {
      int adminno = (int)session.getAttribute("adminno");
      mav.addObject("adminno",adminno);
      
    }
    List<AnswerVO> answer_list = this.answerProc.list(qnano);
    mav.addObject("answer_list",answer_list);
   

    
    return mav;
  }
  
  @RequestMapping(value="/qna/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int qnano) {
    ModelAndView mav = new ModelAndView();
    
    QnaVO qnaVO= this.qnaProc.read(qnano);
    
    
    int cnt=this.qnaProc.delete(qnano);
    
    mav.addObject("memberno",qnaVO.getMemberno());
    
    mav.setViewName("redirect:/qna/list_all.do"); // /WEB-INF/views/categrp/create.jsp
    
    return mav; // forward
  }
  

  
}



