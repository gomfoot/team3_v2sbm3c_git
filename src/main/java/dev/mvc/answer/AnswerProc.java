package dev.mvc.answer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.answer.AnswerProc")
public class AnswerProc implements AnswerProcInter {
  @Autowired  // DI: Spring 자동으로 구현한 DAO class 객체를 할당
  private AnswerDAOInter answerDAO;

  @Override
  public int create(AnswerVO answerVO) {
    int cnt = answerDAO.create(answerVO);
    
    return cnt;
  }

  @Override
  public List<AnswerVO> list(int mboardno) {
    List<AnswerVO> list = this.answerDAO.list(mboardno);
    return list;
  }

  @Override
  public AnswerVO read(int answerno) {
    AnswerVO answerVO=this.answerDAO.read(answerno);
    return answerVO;
  }

  @Override
  public int delete(int answerno) {
    int cnt=this.answerDAO.delete(answerno);
    return cnt;
  }

  



}






