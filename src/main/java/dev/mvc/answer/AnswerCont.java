package dev.mvc.answer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.member.MemberProcInter;
import dev.mvc.qna.QnaProcInter;


@Controller
public class AnswerCont {
  @Autowired // CategrpProcInter를 구현한 CategrpProc.java의 객체가 할당
  @Qualifier("dev.mvc.answer.AnswerProc")
  private AnswerProcInter answerProc;
  
  @Autowired // CategrpProcInter를 구현한 CategrpProc.java의 객체가 할당
  @Qualifier("dev.mvc.qna.QnaProc")
  private QnaProcInter qnaProc;
  
  
  public AnswerCont() {
    System.out.println("-> AnswerCont created.");
  }
  
  // http://localhost:9091/categrp/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/answer/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/answer/create.do"); // /WEB-INF/views/categrp/create.jsp
    
    return mav; // forward
  }
  
  /**
   * 등록 처리
   * @param categrpVO
   * @return
   */
  
    @RequestMapping(value="/answer/create.do", method=RequestMethod.POST ) 
    public ModelAndView create(AnswerVO answerVO, int qnano) { 
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.answerProc.create(answerVO); // 등록 처리
    
    
    mav.setViewName("redirect:/qna/qna_read.do?qnano="+qnano); 
    return mav; // forward 
    }
   
  
  /*
    @RequestMapping(value="/answer/create.do", method=RequestMethod.POST ) 
    public String create(HttpSession session,int qnano,int adminno,String content) {
      
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("qnano", qnano);
      map.put("adminno", adminno);
      map.put("content",content);
      
      int cnt = this.answerProc.create(answerVO);
      
      JSONObject json = new JSONObject(); 
      json.put("cnt", cnt);
      session.getAttribute("adminno");
      
      return json.toString(); // forward }
*/   
    @RequestMapping(value="/answer/delete.do", method=RequestMethod.GET )
    public ModelAndView delete(int answerno, int qnano) {
      ModelAndView mav = new ModelAndView();
      
      int cnt=this.answerProc.delete(answerno);
      
          
      mav.setViewName("redirect:/qna/qna_read.do?qnano="+qnano); // /WEB-INF/views/categrp/create.jsp
      
      return mav; // forward
    }

}


