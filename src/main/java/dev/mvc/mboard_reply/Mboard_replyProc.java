package dev.mvc.mboard_reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.mboard_reply.Mboard_replyProc")
public class Mboard_replyProc implements Mboard_replyProcInter {
  @Autowired  // DI: Spring 자동으로 구현한 DAO class 객체를 할당
  private Mboard_replyDAOInter mboard_replyDAO;

  @Override
  public int create(Mboard_replyVO mboard_replyVO) {
    int cnt = mboard_replyDAO.create(mboard_replyVO);
    
    return cnt;
  }

  @Override
  public List<Mboard_replyVO> list(int mboardno) {
    List<Mboard_replyVO> list = this.mboard_replyDAO.list(mboardno);
    return list;
  }

  @Override
  public int delete(int replyno) {
   int cnt=this.mboard_replyDAO.delete(replyno);
   return cnt;
  }

  @Override
  public Mboard_replyVO read(int replyno) {
    Mboard_replyVO mboard_replyVO=this.mboard_replyDAO.read(replyno);
    return mboard_replyVO;
  }



}






