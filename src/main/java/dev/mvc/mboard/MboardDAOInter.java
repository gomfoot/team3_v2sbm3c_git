package dev.mvc.mboard;

import java.util.HashMap;
import java.util.List;


// MyBATIS의 <mapper namespace="dev.mvc.categrp.CategrpDAOInter">에 선언
// 스프링이 자동으로 구현
public interface MboardDAOInter {
  public int search_count();
  /**
   * 등록
   * @param categrpVO
   * @return 등록된 레코드 갯수
   */
  public int create(MboardVO mboardVO);
  
  public List<MboardVO> list_all(HashMap<String, Object> map);
  
  public MboardVO read(int mboardno);
  
  public int delete(int mboardno);
  
  public int update(MboardVO mboardVO);
  
  public int cnt_update(int mboardno);
}






