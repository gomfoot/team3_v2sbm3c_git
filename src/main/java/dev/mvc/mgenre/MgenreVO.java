package dev.mvc.mgenre;

/*
CREATE TABLE mgenre(
    mgenreno                          NUMBER(10)     NOT NULL,
    mgenrename                        VARCHAR2(50)     NOT NULL,
    cnt                               NUMBER(10)     DEFAULT 0     NOT NULL
);

COMMENT ON TABLE mgenre is '영화 장르';
COMMENT ON COLUMN mgenre.mgenreno is '영화 장르 번호';
COMMENT ON COLUMN mgenre.mgenrename is '영화 장르 이름';
COMMENT ON COLUMN mgenre.cnt is '관련 자료 수';
 */

public class MgenreVO {
  /** 영화 장르 번호 */
  private int mgenreno;  
  /** 영화 장르 이름 */
  private String mgenrename;
  /** 관련 영화 수 */
  private int cnt;
  
  
  public int getMgenreno() {
    return mgenreno;
  }
  public void setMgenreno(int mgenreno) {
    this.mgenreno = mgenreno;
  }
  public String getMgenrename() {
    return mgenrename;
  }
  public void setMgenrename(String mgenrename) {
    this.mgenrename = mgenrename;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  
}
