package dev.mvc.qna;
 
/*

   mboardno                         NUMBER(10)     NOT NULL,
    title                             VARCHAR2(100)    NOT NULL,
    content                           VARCHAR2(1000)     NOT NULL,
    rdate                             DATE     NOT NULL,
    goodscore                         NUMBER(10)     NOT NULL,
    cnt                               NUMBER(10)     NOT NULL,
    memberno                          NUMBER(10)     NOT NULL
 
 */
public class QnaVO {
  private int qnano;
  private String title;
  private String content;
  private String rdate;
  private String qtype;
  private int memberno;
  private String mname;
  
  
  
  public String getMname() {
    return mname;
  }
  public void setMname(String mname) {
    this.mname = mname;
  }
  public String getQtype() {
    return qtype;
  }
  public void setQtype(String qtype) {
    this.qtype = qtype;
  }
  public int getQnano() {
    return qnano;
  }
  public void setQnano(int qnano) {
    this.qnano = qnano;
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

  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
 
  
  
  
  
  
}







 