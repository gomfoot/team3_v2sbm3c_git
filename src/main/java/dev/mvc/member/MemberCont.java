package dev.mvc.member;
 
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

import dev.mvc.users.UsersProcInter;
 
@Controller
public class MemberCont {
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  @Autowired
  @Qualifier("dev.mvc.users.UsersProc")
  private UsersProcInter usersProc;
  
  public MemberCont(){
    System.out.println("-> MemberCont created.");
  }
  
  // http://localhost:9091/member/checkID.do?id=user1
  /**
  * ID 중복 체크, JSON 출력
  * @return
  */
  @ResponseBody
  @RequestMapping(value="/member/checkID.do", method=RequestMethod.GET ,
                         produces = "text/plain;charset=UTF-8" )
  public String checkID(String id) {
 System.out.println("id 확인 요청됨: " + id);
    
    int cnt = this.memberProc.checkID(id);
   
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
   
    return json.toString(); 
  }
  
  
  @ResponseBody
  @RequestMapping(value="/member/admincheck.do", method=RequestMethod.GET )
  public String admincheck(String id,String passwd) {
    System.out.println("id 확인 요청됨: " + id);
    System.out.println("passwd 확인 요청됨: " + passwd);
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("id", id);
    map.put("passwd", passwd);
    int cnt = this.memberProc.admincheck(map);
    System.out.println(cnt);
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
   
    return json.toString(); 
  }
  
  @ResponseBody
  @RequestMapping(value="/member/membercheck.do", method=RequestMethod.GET )
  public String membercheck(String id,String passwd) {
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("id", id);
    map.put("passwd", passwd);
    int cnt = this.memberProc.membercheck(map);
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
   
    return json.toString(); 
  }
  
  // http://localhost:9091/member/create.do
  /**
  * 등록 폼
  * @return
  */
  @RequestMapping(value="/member/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/create"); // webapp/member/create.jsp
   
    return mav; // forward
  }
  
  /**
   * 등록 처리
   * @param memberVO
   * @return
   */
  @RequestMapping(value="/member/create.do", method=RequestMethod.POST)
  public ModelAndView create(MemberVO memberVO){
    ModelAndView mav = new ModelAndView();
    
    
    int cnt= memberProc.create(memberVO);
    mav.addObject("url", "login"); // create_msg.jsp, redirect parameter 적용
    
    mav.setViewName("redirect:/member/login.do"); // 새로고침 방지
    
    return mav;
  }
  

  /**
  * 목록 출력 가능
  * @param session
  * @return
  */
  @RequestMapping(value="/member/list.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
   
      List<MemberVO> list = memberProc.list();
      mav.addObject("list", list);

      mav.setViewName("/member/list"); // /webapp/WEB-INF/views/member/list.jsp

    
    
    return mav;
  }  
  
  /**
   * 회원 조회
   * @param memberno
   * @return
   */
  @RequestMapping(value="/member/read.do", method=RequestMethod.GET)
  public ModelAndView read(int memberno){
    ModelAndView mav = new ModelAndView();
    
    MemberVO memberVO = this.memberProc.read(memberno);
    mav.addObject("memberVO", memberVO);
    mav.setViewName("/member/read"); // /member/read.jsp
    
    return mav; // forward
  }
  
  
  
  /**
   * 회원 정보 수정 처리
   * @param memberVO
   * @return
   */
  @RequestMapping(value="/member/update.do", method=RequestMethod.POST)
  public ModelAndView update(MemberVO memberVO){
    ModelAndView mav = new ModelAndView();
    
    // System.out.println("id: " + memberVO.getId());
    
    int cnt= memberProc.update(memberVO);
    mav.addObject("url", "index"); // update_msg.jsp, redirect parameter 적용

    mav.setViewName("redirect:/index.do");
    
    return mav;
  }
 
  
  /**
   * 로그아웃 처리
   * @param session
   * @return
   */
  @RequestMapping(value="/member/logout.do", 
                             method=RequestMethod.GET)
  public ModelAndView logout(HttpSession session){
    ModelAndView mav = new ModelAndView();
    session.invalidate(); // 모든 session 변수 삭제
    
    mav.addObject("url", "index"); // logout_msg.jsp, redirect parameter 적용
    
    mav.setViewName("redirect:/index.do"); // 새로고침 방지
    
    return mav;
  }
  /**
   * 회원 삭제 처리
   * @param memberVO
   * @return
   */
  @RequestMapping(value="/member/delete.do", method=RequestMethod.POST)
  public ModelAndView delete(MemberVO memberVO){
    ModelAndView mav = new ModelAndView();
    int memberno = memberVO.getMemberno();
    //찜목록삭제
    //qna삭제
    //커뮤니티삭제
    int cnt= memberProc.delete(memberno);
    mav.setViewName("redirect:/member/logout.do");
    
    return mav;
  }
  
 
  /**
   * Cookie 기반 로그인 폼
   * @return
   */
  // http://localhost:9091/member/login.do 
  @RequestMapping(value = "/member/login.do", 
                             method = RequestMethod.GET)
  public ModelAndView login_cookie(HttpServletRequest request,
                                                @RequestParam(value="return_url", defaultValue="") String return_url ) {
    ModelAndView mav = new ModelAndView();
    
    Cookie[] cookies = request.getCookies();
    Cookie cookie = null;

    String ck_id = ""; // id 저장
    String ck_id_save = ""; // id 저장 여부를 체크
    String ck_passwd = ""; // passwd 저장
    String ck_passwd_save = ""; // passwd 저장 여부를 체크

    if (cookies != null) {  // Cookie 변수가 있다면
      for (int i=0; i < cookies.length; i++){
        cookie = cookies[i]; // 쿠키 객체 추출
        
        if (cookie.getName().equals("ck_id")){
          ck_id = cookie.getValue();                                 // Cookie에 저장된 id
        }else if(cookie.getName().equals("ck_id_save")){
          ck_id_save = cookie.getValue();                          // Cookie에 id를 저장 할 것인지의 여부, Y, N
        }else if (cookie.getName().equals("ck_passwd")){
          ck_passwd = cookie.getValue();                          // Cookie에 저장된 password
        }else if(cookie.getName().equals("ck_passwd_save")){
          ck_passwd_save = cookie.getValue();                  // Cookie에 password를 저장 할 것인지의 여부, Y, N
        }
      }
    }
    
    mav.addObject("ck_id", ck_id); 
    mav.addObject("ck_id_save", ck_id_save);
    mav.addObject("ck_passwd", ck_passwd);
    mav.addObject("ck_passwd_save", ck_passwd_save);
    mav.addObject("return_url", return_url);
    
    mav.setViewName("/member/login_ck_form");
    return mav;
  }
   
  
  /**
   * Cookie 기반 로그인 처리
   * @param request Cookie를 읽기위해 필요
   * @param response Cookie를 쓰기위해 필요
   * @param session 로그인 정보를 메모리에 기록
   * @param id  회원 아이디
   * @param passwd 회원 패스워드
   * @param id_save 회원 아이디 Cookie에 저장 여부
   * @param passwd_save 패스워드 Cookie에 저장 여부
   * @return
   */
  // http://localhost:9091/member/login.do 
  @RequestMapping(value = "/member/login.do", 
                             method = RequestMethod.POST)
  public ModelAndView login_cookie_proc(
                             HttpServletRequest request,
                             HttpServletResponse response,
                             HttpSession session,
                             String id, String passwd,
                             @RequestParam(value="id_save", defaultValue="") String id_save,
                             @RequestParam(value="passwd_save", defaultValue="") String passwd_save,
                             @RequestParam(value="return_url", defaultValue="") String return_url) {
    ModelAndView mav = new ModelAndView();
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("id", id);
    map.put("passwd", passwd);
    int count = memberProc.login(map);
    
    
    
    if (count == 1) { // 로그인 성공
      //System.out.println(id + " 로그인 성공");
      MemberVO memberVO = memberProc.readById(id);
      session.setAttribute("memberno", memberVO.getMemberno()); // 서버의 메모리에 기록
      int users_check = usersProc.checkmemberno(memberVO.getMemberno());
      if(users_check >= 1 ) {
        session.setAttribute("pay_exist",1);
      }else {
        session.setAttribute("pay_exist",0);
      }
      
      session.setAttribute("id", id);
      session.setAttribute("mname", memberVO.getMname());
      session.setAttribute("grade","member");
      // -------------------------------------------------------------------
      // id 관련 쿠기 저장
      // -------------------------------------------------------------------
      if (id_save.equals("Y")) { // id를 저장할 경우, Checkbox를 체크한 경우
        Cookie ck_id = new Cookie("ck_id", id);
        ck_id.setPath("/");  // root 폴더에 쿠키를 기록함으로 모든 경로에서 쿠기 접근 가능
        ck_id.setMaxAge(60 * 60 * 72 * 10); // 30 day, 초단위
        response.addCookie(ck_id); // id 저장
      } else { // N, id를 저장하지 않는 경우, Checkbox를 체크 해제한 경우
        Cookie ck_id = new Cookie("ck_id", "");
        ck_id.setPath("/");
        ck_id.setMaxAge(0);
        response.addCookie(ck_id); // id 저장
      }
      // id를 저장할지 선택하는  CheckBox 체크 여부
      Cookie ck_id_save = new Cookie("ck_id_save", id_save);
      ck_id_save.setPath("/");
      ck_id_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_id_save);
      // -------------------------------------------------------------------

      // -------------------------------------------------------------------
      // Password 관련 쿠기 저장
      // -------------------------------------------------------------------
      if (passwd_save.equals("Y")) { // 패스워드 저장할 경우
        Cookie ck_passwd = new Cookie("ck_passwd", passwd);
        ck_passwd.setPath("/");
        ck_passwd.setMaxAge(60 * 60 * 72 * 10); // 30 day
        response.addCookie(ck_passwd);
      } else { // N, 패스워드를 저장하지 않을 경우
        Cookie ck_passwd = new Cookie("ck_passwd", "");
        ck_passwd.setPath("/");
        ck_passwd.setMaxAge(0);
        response.addCookie(ck_passwd);
      }
      // passwd를 저장할지 선택하는  CheckBox 체크 여부
      Cookie ck_passwd_save = new Cookie("ck_passwd_save", passwd_save);
      ck_passwd_save.setPath("/");
      ck_passwd_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_passwd_save);
      // -------------------------------------------------------------------
      
      mav.setViewName("redirect:/index.do");

        
    } else {
      mav.setViewName("redirect:/index.do"); 
    }
        
    return mav;
  }
  
  
  /**
   * Cookie 기반 로그인 처리
   * @param request Cookie를 읽기위해 필요
   * @param response Cookie를 쓰기위해 필요
   * @param session 로그인 정보를 메모리에 기록
   * @param id  회원 아이디
   * @param passwd 회원 패스워드
   * @param id_save 회원 아이디 Cookie에 저장 여부
   * @param passwd_save 패스워드 Cookie에 저장 여부
   * @return
   */
  // http://localhost:9091/member/admin_login.do 
  @RequestMapping(value = "/member/admin_login.do", 
                             method = RequestMethod.POST)
  public ModelAndView admin_login_cookie_proc(
                             HttpServletRequest request,
                             HttpServletResponse response,
                             HttpSession session,
                             String id, String passwd,
                             @RequestParam(value="id_save", defaultValue="") String id_save,
                             @RequestParam(value="passwd_save", defaultValue="") String passwd_save,
                             @RequestParam(value="return_url", defaultValue="") String return_url) {
    ModelAndView mav = new ModelAndView();
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("id", id);
    map.put("passwd", passwd);
    int count = memberProc.admin_login(map);
    if (count == 1) { // 로그인 성공
      // System.out.println(id + " 로그인 성공");
      int adminno = memberProc.adminno(id);
      session.setAttribute("id", id);
      session.setAttribute("grade","admin");
      session.setAttribute("adminno", adminno);
      session.setAttribute("pay_exist", 1);
      // -------------------------------------------------------------------
      // id 관련 쿠기 저장
      // -------------------------------------------------------------------
      if (id_save.equals("Y")) { // id를 저장할 경우, Checkbox를 체크한 경우
        Cookie ck_id = new Cookie("ck_id", id);
        ck_id.setPath("/");  // root 폴더에 쿠키를 기록함으로 모든 경로에서 쿠기 접근 가능
        ck_id.setMaxAge(60 * 60 * 72 * 10); // 30 day, 초단위
        response.addCookie(ck_id); // id 저장
      } else { // N, id를 저장하지 않는 경우, Checkbox를 체크 해제한 경우
        Cookie ck_id = new Cookie("ck_id", "");
        ck_id.setPath("/");
        ck_id.setMaxAge(0);
        response.addCookie(ck_id); // id 저장
      }
      // id를 저장할지 선택하는  CheckBox 체크 여부
      Cookie ck_id_save = new Cookie("ck_id_save", id_save);
      ck_id_save.setPath("/");
      ck_id_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_id_save);
      // -------------------------------------------------------------------

      // -------------------------------------------------------------------
      // Password 관련 쿠기 저장
      // -------------------------------------------------------------------
      if (passwd_save.equals("Y")) { // 패스워드 저장할 경우
        Cookie ck_passwd = new Cookie("ck_passwd", passwd);
        ck_passwd.setPath("/");
        ck_passwd.setMaxAge(60 * 60 * 72 * 10); // 30 day
        response.addCookie(ck_passwd);
      } else { // N, 패스워드를 저장하지 않을 경우
        Cookie ck_passwd = new Cookie("ck_passwd", "");
        ck_passwd.setPath("/");
        ck_passwd.setMaxAge(0);
        response.addCookie(ck_passwd);
      }
      // passwd를 저장할지 선택하는  CheckBox 체크 여부
      Cookie ck_passwd_save = new Cookie("ck_passwd_save", passwd_save);
      ck_passwd_save.setPath("/");
      ck_passwd_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_passwd_save);
      // -------------------------------------------------------------------
      
      
        mav.setViewName("redirect:/index.do");

        
    } else {
      mav.setViewName("redirect:/index.do"); 
    }
        
    return mav;
  }
  @RequestMapping(value="/member/choose.do", method=RequestMethod.GET)
  public ModelAndView choose(int memberno){
    ModelAndView mav = new ModelAndView();
    
    MemberVO memberVO = this.memberProc.read(memberno);
    mav.addObject("memberVO", memberVO);
    mav.setViewName("/member/choose"); // /member/read.jsp
    
    return mav; // forward
  }
  
  
 
}


