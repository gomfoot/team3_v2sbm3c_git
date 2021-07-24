package dev.mvc.movie;

import java.util.HashMap;
import java.util.List;

public interface MovieProcInter {
  /**
   * 특정 그룹에 속한 레코드 갯수 산출
   * @param mgenreno
   * @return
   */
  public int count_by_mgenreno(int mgenreno);
  
  /**
   * 등록
   * @param movieVO
   * @return
   */
  public int create(MovieVO movieVO);
  
  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param list_file 목록 파일명 
   * @param mgenre wkdfm번호
   * @param search_count 검색 갯수
   * @param now_page 현재 페이지, now_page는 1부터 시작
   * @param word 검색어
   * @return
   */
  public String pagingBox(String list_file, int mgenreno, int search_count, int now_page, String word);
  
  /**
   * 검색 + 페이징 목록
   * @param map
   * @return
   */
  public List<MovieVO> list_search_paging(HashMap<String, Object> map);
  
  /**
   * 조회
   * @param movieno
   * @return
   */
  public MovieVO read(int movieno);
  
  /**
   * 텍스트 정보 수정
   * @param movieVO
   * @return
   */
  public int update_text(MovieVO movieVO);
  
  /**
   * 텍스트 수정용 조회
   * @param contentsno
   * @return
   */
  public MovieVO read_update_text(int movieno);
  
  /**
   * 파일 정보 수정
   * @param movieVO
   * @return
   */
  public int update_file(MovieVO movieVO);
  
  
  /**
   * 삭제
   * @param movieno
   * @return
   */
  public int delete(int movieno);
  
  /**
   * 조회수 증가
   * @param movieno
   * @return
   */
  public int update_mcnt(int movieno);
  
  /**
   * 인기 등록된 영화 목록
   * @return
   */
  public List<MovieVO> list_popular();
  
  /**
   * 최신 등록된 영화 목록
   * @return
   */
  public List<MovieVO> list_latest();
  
  /**
   * 장르의 등록된 영화 목록
   * @return
   */
  public List<MovieVO> list_genre(int mgenreno);
  
  /**
   * 해당 영화 평점 등록 
   */
  public int create_mscore(HashMap<String, Object> hashMap);
  
  /**
   * 좋아요수 증가
   * @param movieno
   * @return
   */
  public int update_goodscore_up(int movieno);
  
  /**
   * 좋아요수 감소
   * @param movieno
   * @return
   */
  public int update_goodscore_down(int movieno);
  
  /**
   * 싫어요수 증가
   * @param movieno
   * @return
   */
  public int update_hatescore_up(int movieno);
  
  /**
   * 싫어요수 감소
   * @param movieno
   * @return
   */
  public int update_hatescore_down(int movieno);
  
  /**
   * 좋아요 평점 체크용 수정 처리 
   */
  public int gscore_check(HashMap<String, Object> hashMap);
  /**
   * 싫어요 평점 체크용 수정 처리 
   */
  public int hscore_check(HashMap<String, Object> hashMap);
  
  /**
   * 평점 체크용 수정 처리 취소
   */
  public int score_check_cancel(HashMap<String, Object> hashMap);
 
  /**
   * 평점 확인 레코드 갯수
   * @param hashMap
   * @return
   */
  public int mscore_check(HashMap<String, Object> hashMap);

  /**
   * 평점 조회
   * @param hashMap
   * @return
   */
  public int mscore_read(HashMap<String, Object> hashMap);
  
  /**
   * 장르 번호 조회
   * @return
   */
  public int genre_read(int movieno);
}
