package dev.mvc.mboard_reply;

import java.util.List;

// MyBATIS의 <mapper namespace="dev.mvc.categrp.CategrpDAOInter">에 선언
// 스프링이 자동으로 구현
public interface Mboard_replyDAOInter {
  /**
   * 등록
   * @param categrpVO
   * @return 등록된 레코드 갯수
   */
  public int create(Mboard_replyVO mboard_replyVO);
  
  public List<Mboard_replyVO> list(int mboardno);
  
  public int delete(int replyno);
  
  public Mboard_replyVO read(int replyno);
}






