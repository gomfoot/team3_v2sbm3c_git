package dev.mvc.answer;

import java.util.List;

// MyBATIS의 <mapper namespace="dev.mvc.categrp.CategrpDAOInter">에 선언
// 스프링이 자동으로 구현
public interface AnswerDAOInter {
  /**
   * 등록
   * @param categrpVO
   * @return 등록된 레코드 갯수
   */
  public int create(AnswerVO answerVO);
  
  public List<AnswerVO> list(int qnano);
  
  public AnswerVO read(int answerno);
  
  public int delete(int answerno);
}






