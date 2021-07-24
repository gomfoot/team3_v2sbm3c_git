package dev.mvc.mhistory;

import java.util.HashMap;
import java.util.List;

public interface MhistoryDAOInter {
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
