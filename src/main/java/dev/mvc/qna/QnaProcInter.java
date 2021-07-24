package dev.mvc.qna;

import java.util.HashMap;
import java.util.List;

public interface QnaProcInter {
  public int search_count();

  /**
   * 등록
   * @param categrpVO
   * @return 등록된 레코드 갯수
   */
  public int create(QnaVO qnaVO);
  
  public QnaVO read(int qnano);
  
  public List<QnaVO> list_all(HashMap<String, Object> map);
  public String pagingBox(String list_file, int search_count, int now_page);
  public int delete(int qnano);

  


}



