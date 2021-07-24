package dev.mvc.mboard_reply;
 
/*
mboardno                          NUMBER(10)     NOT NULL,
    content                           VARCHAR2(300)    NOT NULL,
    rdate                             DATE     NOT NULL,
    memberno                          NUMBER(10)     NOT NULL
 */
public class Mboard_replyVO {
  private int replyno;
  private int mboardno;
  private String content;
  private String rdate;
  private int memberno;
  
  public int getReplyno() {
    return replyno;
  }
  public void setReplyno(int replyno) {
    this.replyno = replyno;
  }
  public int getMboardno() {
    return mboardno;
  }
  public void setMboardno(int mboardno) {
    this.mboardno = mboardno;
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







 