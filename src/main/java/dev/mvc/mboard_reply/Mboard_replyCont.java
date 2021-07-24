package dev.mvc.mboard_reply;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.mboard.MboardProcInter;
import dev.mvc.mboard.MboardVO;
import dev.mvc.member.MemberProcInter;


@Controller
public class Mboard_replyCont {
  @Autowired // CategrpProcInter를 구현한 CategrpProc.java의 객체가 할당
  @Qualifier("dev.mvc.mboard_reply.Mboard_replyProc")
  private Mboard_replyProcInter mboard_replyProc;
  
  @Autowired // CategrpProcInter를 구현한 CategrpProc.java의 객체가 할당
  @Qualifier("dev.mvc.mboard.MboardProc")
  private MboardProcInter mboardProc;
  
  @Autowired // CategrpProcInter를 구현한 CategrpProc.java의 객체가 할당
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  
  public Mboard_replyCont() {
    System.out.println("-> Mboard_replyCont created.");
  }
  
  // http://localhost:9091/categrp/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/mboard_reply/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mboard_reply/create.do"); // /WEB-INF/views/categrp/create.jsp
    
    return mav; // forward
  }
  
  /**
   * 등록 처리
   * @param categrpVO
   * @return
   */
  @RequestMapping(value="/mboard_reply/create.do", method=RequestMethod.POST )
  public ModelAndView create(Mboard_replyVO mboard_replyVO) { 
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.mboard_replyProc.create(mboard_replyVO); // 등록 처리
    
    mav.addObject("mboardno",mboard_replyVO.getMboardno());
    
    mav.setViewName("redirect:/mboard/mboard_read.do");
    

    return mav; // forward
  }
  
  
  @RequestMapping(value="/mboard_reply/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int replyno, int mboardno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt=this.mboard_replyProc.delete(replyno);
    
        
    mav.setViewName("redirect:/mboard/mboard_read.do?mboardno="+mboardno); // /WEB-INF/views/categrp/create.jsp
    
    return mav; // forward
  }
}



