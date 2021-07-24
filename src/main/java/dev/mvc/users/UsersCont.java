package dev.mvc.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import dev.mvc.member.MemberProcInter;

@Controller
public class UsersCont {
  @Autowired
  @Qualifier("dev.mvc.users.UsersProc")
  private UsersProcInter usersProc;

  public UsersCont() {
    System.out.println("-> UsersProcInter created.");
  }

  // http://localhost:9091/member/create.do
  /**
   * 등록 폼
   * 
   * @return
   */
  @RequestMapping(value = "/users/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/users/create"); // webapp/member/create.jsp

    return mav; // forward
  }

  @RequestMapping(value = "/users/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpSession session, UsersVO usersVO) { // order_payVO 자동 생성, Form -> VO
    ModelAndView mav = new ModelAndView();
    System.out.println("addday->"+usersVO.getAddday());
    int cnt = this.usersProc.create(usersVO);
    
    session.setAttribute("pay_exist", 1);

    mav.setViewName("redirect:/index.do");

    return mav;

  }

    /**
         * ID 중복 체크, JSON 출력
         * 
         */
         @ResponseBody
         @RequestMapping(value="/users/checkmemberno.do", method=RequestMethod.GET) 
         public String checkmemberno(int memberno) { 
           System.out.println("memberno 확인 요청됨: " + memberno);
         
         int cnt = this.usersProc.checkmemberno(memberno);
         
         JSONObject json = new JSONObject(); 
         json.put("cnt", cnt);
         
         
         return json.toString();
         
         }
            
}
