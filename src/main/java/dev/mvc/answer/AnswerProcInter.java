package dev.mvc.answer;

import java.util.List;

public interface AnswerProcInter {
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

