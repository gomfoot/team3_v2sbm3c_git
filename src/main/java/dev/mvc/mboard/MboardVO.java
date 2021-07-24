package dev.mvc.mboard;
 
/*

   mboardno                         NUMBER(10)     NOT NULL,
    title                             VARCHAR2(100)    NOT NULL,
    content                           VARCHAR2(1000)     NOT NULL,
    rdate                             DATE     NOT NULL,
    cnt                               NUMBER(10)     NOT NULL,
    memberno                          NUMBER(10)     NOT NULL
 
 */
public class MboardVO {
  private int mboardno;
  private String title;
  private String content;
  private String rdate;
  private int cnt;
  private int memberno;
  private String mname;
  
  public String getMname() {
    return mname;
  }
  public void setMname(String mname) {
    this.mname = mname;
  }
  public int getMboardno() {
    return mboardno;
  }
  public void setMboardno(int mboardno) {
    this.mboardno = mboardno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }

  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  
  
  
  
  
}







 