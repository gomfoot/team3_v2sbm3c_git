package dev.mvc.mboard;

import java.util.HashMap;
import java.util.List;

public interface MboardProcInter {
  /**
   * 등록
   * @param categrpVO
   * @return 등록된 레코드 갯수
   */
  public int create(MboardVO mboardVO);
  public List<MboardVO> list_all(HashMap<String, Object> map);
  public int search_count();
  public String pagingBox(String list_file, int search_count, int now_page);
  public MboardVO read(int mboardno);
  public int delete(int mboardno);
  public int update(MboardVO mboardVO);
  public MboardVO read_update(int mboardno);
  public int cnt_update(int mboardno);
}



