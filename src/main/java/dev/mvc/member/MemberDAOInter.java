package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MemberDAOInter {
  /**
   * 중복 아이디 검사
   * @param id
   * @return 중복 아이디 갯수
   */
  public int checkID(String id);
  /**
   * admin 검사
   * @param id,passwd
   * @return 중복 admin 갯수
   */
  public int admincheck(HashMap<Object, Object> map);
  /**
   * member 검사
   * @param id,passwd
   * @return 중복 member 갯수
   */
  public int membercheck(HashMap<Object, Object> map);
  
  /**
   * 회원 가입
   * @param memberVO
   * @return
   */
  public int create(MemberVO memberVO);
  
  /**
   * 회원 전체 목록
   * @return
   */
  public List<MemberVO> list();
  
  /**
   * memberno로 회원 정보 조회
   * @param memberno
   * @return
   */
  public MemberVO read(int memberno);
  
  /**
   * id로 회원 정보 조회
   * @param id
   * @return
   */
  public MemberVO readById(String id);
  
  /**
   * 수정 처리
   * @param memberVO
   * @return
   */
  public int update(MemberVO memberVO);
  
  /**
   * 회원 삭제 처리
   * @param memberno
   * @return
   */
  public int delete(int memberno);
  
  
  /**
   * 로그인 처리
   */
  public int login(Map<String, Object> map);
  
  /**
   * admin 로그인 처리
   */
  public int admin_login(Map<String, Object> map);

  /**
   * adminno 번호 가져오기
   */
  public int adminno(String id);
}




