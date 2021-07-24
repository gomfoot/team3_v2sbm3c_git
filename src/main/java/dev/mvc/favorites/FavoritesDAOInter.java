package dev.mvc.favorites;

import java.util.HashMap;
import java.util.List;

public interface FavoritesDAOInter {
  /**
   * 찜에 영화 등록
   * @param favoritesVO
   * @return 
   */
  public int create(FavoritesVO favoritesVO);
  
  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
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




