package dev.mvc.notice;

public class NoticeVO {

  /**공지사항 번호 **/
  private int noticeno;
  /**공지사항 제목 **/
  private String title;
  /**공지사항 내용 **/
  private String ncontent;
  /**공지사항 날짜 **/
  private String rdate;
  /**공지사항 관리자 **/
  private int adminno;
  /**공지사항 관리자 이름 **/
  private String name;
  /**공지사항 메인 이미지 **/
  private String file1;
  /**공지사항 실제 저장된 이미지 **/
  private String file1saved; 
  /**공지사항 메인 이미지 preview **/
  private String thumb1;

  
  public NoticeVO(int noticeno, String title, String ncontent, String rdate, int adminno, String name, String file1,
      String file1saved, String thumb1) {
    super();
    this.noticeno = noticeno;
    this.title = title;
    this.ncontent = ncontent;
    this.rdate = rdate;
    this.adminno = adminno;
    this.name = name;
    this.file1 = file1;
    this.file1saved = file1saved;
    this.thumb1 = thumb1;
  }
  public NoticeVO() {
    super();
  }
  public int getNoticeno() {
    return noticeno;
  }
  public void setNoticeno(int noticeno) {
    this.noticeno = noticeno;
  }
  public String gettitle() {
    return title;
  }
  public void settitle(String title) {
    this.title = title;
  }
  public String getNcontent() {
    return ncontent;
  }
  public void setNcontent(String ncontent) {
    this.ncontent = ncontent;
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
  public String getname() {
    return name;
  }
  public void setname(String name) {
    this.name = name;
  }
  public String getFile1() {
    return file1;
  }
  public void setFile1(String file1) {
    this.file1 = file1;
  }
  public String getFile1saved() {
    return file1saved;
  }
  public void setFile1saved(String file1saved) {
    this.file1saved = file1saved;
  }
  public String getThumb1() {
    return thumb1;
  }
  public void setThumb1(String thumb1) {
    this.thumb1 = thumb1;
  }
  
  
  
}
