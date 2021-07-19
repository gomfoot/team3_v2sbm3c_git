package dev.mvc.member;
 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
 
@Component("dev.mvc.member.MemberProc")
public class MemberProc implements MemberProcInter {
  @Autowired
  private MemberDAOInter memberDAO;
  
  public MemberProc(){
    System.out.println("-> MemberProc created.");
  }

  @Override
  public int checkID(String id) {
    int cnt = this.memberDAO.checkID(id);
    return cnt;
  }

  @Override
  public int admincheck(HashMap<Object, Object> map) {
    int cnt = this.memberDAO.admincheck(map);
    return cnt;
  }
  
  @Override
  public int membercheck(HashMap<Object, Object> map) {
    int cnt = this.memberDAO.membercheck(map);
    return cnt;
  }  
  
  @Override
  public int create(MemberVO memberVO) {
    int cnt = this.memberDAO.create(memberVO);
    return cnt;
  }
  
  @Override
  public List<MemberVO> list() {
    List<MemberVO> list = this.memberDAO.list();
    return list;
  }
  
  @Override
  public MemberVO read(int memberno) {
    MemberVO memberVO = this.memberDAO.read(memberno);
    return memberVO;
  }

  @Override
  public MemberVO readById(String id) {
    MemberVO memberVO = this.memberDAO.readById(id);
    return memberVO;
  }
  
  @Override
  public int update(MemberVO memberVO) {
    int cnt = this.memberDAO.update(memberVO);
    return cnt;
  }
  
  @Override
  public int delete(int memberno) {
    int cnt = this.memberDAO.delete(memberno);
    return cnt;
  }
 
  @Override
  public int passwd_check(HashMap<Object, Object> map) {
    int cnt = this.memberDAO.passwd_check(map);
    return cnt;
  }

  @Override
  public int passwd_update(HashMap<Object, Object> map) {
    int cnt = this.memberDAO.passwd_update(map);
    return cnt;
  }
  
  @Override
  public int login(Map<String, Object> map) {
    int cnt = this.memberDAO.login(map);
    return cnt;
  }
  
  @Override
  public boolean isMember(HttpSession session){
    boolean sw = false; // 로그인하지 않은 것으로 초기화
    int grade = 99;
    
    // System.out.println("-> grade: " + session.getAttribute("grade"));
    if (session != null) {
      String id = (String)session.getAttribute("id");
    }
    
    return sw;
  }

  @Override
  public boolean isAdmin(HttpSession session) {
    boolean sw = false; // 로그인하지 않은 것으로 초기화
    int grade = 99;
    
    // System.out.println("-> grade: " + session.getAttribute("grade"));
    if (session != null) {
      String id = (String)session.getAttribute("id");
     
    }
    
    return sw;
  }

  @Override
  public int admin_login(Map<String, Object> map) {
    int cnt = this.memberDAO.admin_login(map);
    return cnt;
  }

  @Override
  public int adminno(String id) {
    int adminno = this.memberDAO.adminno(id);
    return adminno;
  }

  
}



