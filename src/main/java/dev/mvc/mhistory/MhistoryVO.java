package dev.mvc.mhistory;

/*
CREATE TABLE mhistory(
    mhistoryno                      NUMBER(10)     NOT NULL,
    movieno                           NUMBER(10)     NOT NULL,
    memberno                          NUMBER(10)     NOT NULL,
    hcnt                        NUMBER(7)    DEFAULT 0     NOT NULL,
        rdate                             DATE     NOT NULL
);

COMMENT ON TABLE mhistory is '시청 기록';
COMMENT ON COLUMN mhistory.mhistoryno is '시청기록 번호';
COMMENT ON COLUMN mhistory.movieno is '영화 번호';
COMMENT ON COLUMN mhistory.memberno is '회원 번호';
COMMENT ON COLUMN mhistory.hcnt is '시청 횟수';
COMMENT ON COLUMN mhistory.rdate is '등록일';
 */

public class MhistoryVO {
  /** 시청기록 번호 */
  private int mhistoryno;  
  /** 영화 번호 */
  private int movieno;
  /** 회원 번호 */
  private int memberno;
  /** 시청 횟수 */
  private int hcnt;
  /** 등록일 */
  private String rdate;
  
  /** 영화 이름 */
  private String mtitle;
  /** 이미지 미리보기 */
  private String imgthumb1= "";
  /** 메인 이미지 크기 */
  private long imgsize1;
  public int getMhistoryno() {
    return mhistoryno;
  }
  public void setMhistoryno(int mhistoryno) {
    this.mhistoryno = mhistoryno;
  }
  public int getMovieno() {
    return movieno;
  }
  public void setMovieno(int movieno) {
    this.movieno = movieno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public int getHcnt() {
    return hcnt;
  }
  public void setHcnt(int hcnt) {
    this.hcnt = hcnt;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
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
