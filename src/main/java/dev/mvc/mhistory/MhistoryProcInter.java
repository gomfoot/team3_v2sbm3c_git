package dev.mvc.mhistory;

import java.util.HashMap;
import java.util.List;

public interface MhistoryProcInter {
  /**
   * 등록
   */
  public int create_mhistory(HashMap<String, Object> map);

  /**
   * 조회
   */
  public int mhistory_check(HashMap<String, Object> map);
  
  /**
   * 수정 처리
   */
  public int update_mhistory(HashMap<String, Object> map);
  
  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param list_file 목록 파일명 
   * @param memberno 회원 번호
   * @param now_page 현재 페이지, now_page는 1부터 시작
   * @return
   */
  public String pagingBox(String list_file, int memberno, int search_count, int now_page);
  
  /**
   * Movie + Member + Mhistory join, 연결 목록
   * @return
   */
  public List<MhistoryVO> list_mhistory(HashMap<String, Object> map);
  
  /**
   * 회원 별 영화번호 목록
   * @param memberno
   * @return
   */
  public List<MhistoryVO> list_sort(int memberno);
  
}
