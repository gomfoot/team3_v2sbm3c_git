package dev.mvc.users;
 
public class UsersVO {
  /*
    usersno                           NUMBER(10)     NOT NULL,
    sdate                             DATE     NOT NULL,
    edate                             DATE     NOT NULL,
    MEMBERNO                          NUMBER(10)     NOT NULL,
    paytype                           VARCHAR2(50)     NOT NULL
  */
 
  private int usersno;
  private String sdate;
  private int addday;
  public int getAddday() {
    return addday;
  }
  public void setAddday(int addday) {
    this.addday = addday;
  }
  private String edate;
  private int memberno;
  private String paytype;
  public int getUsersno() {
    return usersno;
  }
  public void setUsersno(int usersno) {
    this.usersno = usersno;
  }
  public String getSdate() {
    return sdate;
  }
  public void setSdate(String sdate) {
    this.sdate = sdate;
  }
  public String getEdate() {
    return edate;
  }
  public void setEdate(String edate) {
    this.edate = edate;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public String getPaytype() {
    return paytype;
  }
  public void setPaytype(String paytype) {
    this.paytype = paytype;
  }
  
  
  

 
}




