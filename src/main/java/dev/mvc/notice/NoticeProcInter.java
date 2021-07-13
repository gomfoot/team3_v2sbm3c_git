package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;

public interface NoticeProcInter {
  
  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count();
  
  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param list_file 목록 파일명 
   * @param categrpno 카테고리번호
   * @param search_count 검색 갯수
   * @param now_page 현재 페이지, now_page는 1부터 시작
   * @param word 검색어
   * @return
   */
  public String pagingBox(String list_file, int search_count, int now_page);
  
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
