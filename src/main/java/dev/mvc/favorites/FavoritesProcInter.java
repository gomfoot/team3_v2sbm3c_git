package dev.mvc.favorites;

import java.util.HashMap;
import java.util.List;

public interface FavoritesProcInter {
  /**
   * 등록
   * @param favoritesVO
   * @return 등록된 갯수
   */
  public int create(FavoritesVO favoritesVO);
  
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
   * Movie + Member + Favorites join, 연결 목록
   * @return
   */
  public List<FavoritesVO> list_favorites(HashMap<String, Object> map); 
  
  /**
   * 삭제 처리 
   * @param favoritesno
   * @return
   */
  public int delete(int favoritesno);
  
  /**
   * 찜 확인 레코드 갯수
   * @param hashMap
   * @return
   */
  public int favorites_check(HashMap<String, Object> hashMap);
}







