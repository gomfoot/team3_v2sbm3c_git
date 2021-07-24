package dev.mvc.mboard_reply;

import java.util.List;

public interface Mboard_replyProcInter {
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



