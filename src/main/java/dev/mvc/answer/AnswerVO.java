package dev.mvc.answer;
 
/*
mboardno                          NUMBER(10)     NOT NULL,
    content                           VARCHAR2(300)    NOT NULL,
    rdate                             DATE     NOT NULL,
    memberno                          NUMBER(10)     NOT NULL
 */
public class AnswerVO {
  private int answerno;
  private int qnano;
  private String content;
  private String rdate;
  private int adminno;
  
  public int getAnswerno() {
    return answerno;
  }
  public void setAnswerno(int answerno) {
    this.answerno = answerno;
  }
  public int getQnano() {
    return qnano;
  }
  public void setQnano(int qnano) {
    this.qnano = qnano;
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
  public int getAdminno() {
    return adminno;
  }
  public void setAdminno(int adminno) {
    this.adminno = adminno;
  }
  
  
  
}







 