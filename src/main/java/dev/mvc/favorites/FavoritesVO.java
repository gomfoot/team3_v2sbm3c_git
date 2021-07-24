package dev.mvc.favorites;
 
public class FavoritesVO {
  /*
  CREATE TABLE favorites(
    favoritesno                       NUMBER(10)     NOT NULL,
    movieno                           NUMBER(10)     NOT NULL,
    memberno                          NUMBER(10)     NOT NULL
);

COMMENT ON TABLE favorites is '찜 목록';
COMMENT ON COLUMN favorites.favoritesno is '찜번호';
COMMENT ON COLUMN favorites.movieno is '영화 번호';
COMMENT ON COLUMN favorites.memberno is '회원 번호';
  */
 
  /** 찜번호 */
  private int favoritesno;  
  
  /** 회원 번호 */
  private int memberno;
  
  /** 영화 번호 */
  private int movieno;
  /** 영화 이름 */
  private String mtitle;
  /** 이미지 미리보기 */
  private String imgthumb1= "";
  /** 메인 이미지 크기 */
  private long imgsize1;
  
  public int getFavoritesno() {
    return favoritesno;
  }
  public void setFavoritesno(int favoritesno) {
    this.favoritesno = favoritesno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public int getMovieno() {
    return movieno;
  }
  public void setMovieno(int movieno) {
    this.movieno = movieno;
  }
  public String getMtitle() {
    return mtitle;
  }
  public void setMtitle(String mtitle) {
    this.mtitle = mtitle;
  }
  public String getImgthumb1() {
    return imgthumb1;
  }
  public void setImgthumb1(String imgthumb1) {
    this.imgthumb1 = imgthumb1;
  }
  public long getImgsize1() {
    return imgsize1;
  }
  public void setImgsize1(long imgsize1) {
    this.imgsize1 = imgsize1;
  }
 

}




