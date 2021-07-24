package dev.mvc.mgenre;

import java.util.List;

public interface MgenreProcInter {
  /**
   * 등록
   */
  public int create(MgenreVO mgenreVO);
  
  /**
   * 등록 순서별 목록
   */
  public List<MgenreVO> list_mgenreno_asc();

  /**
   * 조회, 수정폼, 삭제폼
   */
  public MgenreVO read(int mgenreno);
  
  /**
   * 수정 처리
   */
  public int update(MgenreVO mgenreVO);
  
  /**
   * 삭제 처리
   */
  public int delete(int genreno);

  /**
   * genre1의 mgenreno 조회
   */
  public int read_genre1(String id);
  
  /**
   * genre2의 mgenreno 조회
   */
  public int read_genre2(String id);
  
  /**
   * 조회수 증가
   * @param mgenreno
   * @return
   */
  public int update_cnt_up(int mgenreno);
  
  /**
   * 조회수 감소
   * @param mgenreno
   * @return
   */
  public int update_cnt_down(int mgenreno);
  
  /**
   * 이름 조회, 수정폼, 삭제폼
   */
  public String read_name(int mgenreno);
}
