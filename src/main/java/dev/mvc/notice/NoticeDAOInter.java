package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;


public interface NoticeDAOInter {
  
  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count();
  /**
   * 검색 + 페이징 목록
   * @param map
   * @return
   */
  public List<NoticeVO> list_notice_paging(HashMap<String, Object> map);
  
  public NoticeVO read(int noticeno);
  
  public int delete(int noticeno);
  
  public int create(NoticeVO noticeVO);
}
