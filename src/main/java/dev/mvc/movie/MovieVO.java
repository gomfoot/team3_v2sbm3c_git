package dev.mvc.movie;

import org.springframework.web.multipart.MultipartFile;

/*
        CREATE TABLE movie( COMMENT ON TABLE movie is '영화 상품';
    movieno                           NUMBER(10)     NOT NULL, COMMENT ON COLUMN movie.movieno is '영화 번호';
    mtitle                            VARCHAR2(300)    NOT NULL, COMMENT ON COLUMN movie.mtitle is '영화 제목';
    mcontent                          VARCHAR2(1000)     NOT NULL, COMMENT ON COLUMN movie.mcontent is '영화 내용'; 
    mtime                             NUMBER(10)     NOT NULL, COMMENT ON COLUMN movie.mtime is '영화 길이';
    director                          VARCHAR2(100)    NOT NULL, COMMENT ON COLUMN movie.director is '감독'; 
    caster                            VARCHAR2(100)    NOT NULL, COMMENT ON COLUMN movie.caster is '출연진';
    viewclass                         VARCHAR2(100)    NOT NULL, COMMENT ON COLUMN movie.viewclass is '관람등급';
    goodscore                         NUMBER(7)    DEFAULT 0     NOT NULL, COMMENT ON COLUMN movie.goodscore is '좋아요 수'; 
    hatescore                         NUMBER(7)    DEFAULT 0     NOT NULL,  COMMENT ON COLUMN movie.hatescore is '싫어요 수';
    cnt                               NUMBER(7)    DEFAULT 0     NOT NULL, COMMENT ON COLUMN movie.cnt is '조회수';
    mdate                             DATE     NOT NULL,  COMMENT ON COLUMN movie.mdate is '출시일';
    rdate                             DATE     NOT NULL, COMMENT ON COLUMN movie.rdate is '등록일';
    imgfile1                          VARCHAR2(100)    NULL , COMMENT ON COLUMN movie.imgfile1 is '메인 이미지';
    imgthumb1                         VARCHAR2(100)    NULL , COMMENT ON COLUMN movie.imgthumb1 is '메인 이미지 미리보기';
    videofile1                        VARCHAR2(100)    NULL , COMMENT ON COLUMN movie.videofile1 is '메인 영상';
    mgenreno                          NUMBER(10)     NULL COMMENT ON COLUMN movie.mgenreno is '영화 장르 번호';
);
 */
public class MovieVO {
  
  /** 영화 번호 */
  private int movieno;
  /** 영화 장르 번호 */
  private int mgenreno;
  /** 영화 제목 */
  private String mtitle = "";
  /** 영화 내용 */
  private String mcontent = "";
  /** 영화 길이 */
  private int mtime;
  /** 감독 */
  private String director = "";
  /** 출연진 */
  private String caster = "";
  /** 관람등급 */
  private String viewclass= "";
  /** 좋아요 수 */
  private int goodscore;
  /** 싫어요 수 */
  private int hatescore;
  /** 조회수 */
  private int mcnt;
  /** 출시일 */
  private String mdate= "";
  /** 등록일 */
  private String rdate = "";
  /** 메인 이미지 */
  private String imgfile1= "";
  /** 메인 이미지 미리보기 */
  private String imgthumb1= "";
  /** 메인 이미지 크기 */
  private long imgsize1;
  /** 메인 영상 */
  private String videofile1= "";
  /** 메인 영상 크기 */
  private long videosize1;
  
  /** 검색어 */
  private String word= "";
 
  /** 
  이미지 MultipartFile 
  <input type='file' class="form-control" name='file1MF' id='file1MF' 
                   value='' placeholder="파일 선택">
  */
  private MultipartFile file1MF;
  private MultipartFile file2MF;
  
  private String size1_label;
  private String size2_label;
  
  private int favorites_check;
  
  /** 영화 펑점 번호 */
  private int mscoreno;
  
  /** 회원 번호 */
  private int memberno;
  
  /** 펑점 체크 */
  private int score_check;
  private int mscore_check;

  private int mhistory_check;
  
  public int getMovieno() {
    return movieno;
  }

  public void setMovieno(int movieno) {
    this.movieno = movieno;
  }

  public int getMgenreno() {
    return mgenreno;
  }

  public void setMgenreno(int mgenreno) {
    this.mgenreno = mgenreno;
  }

  public String getMtitle() {
    return mtitle;
  }

  public void setMtitle(String mtitle) {
    this.mtitle = mtitle;
  }

  public String getMcontent() {
    return mcontent;
  }

  public void setMcontent(String mcontent) {
    this.mcontent = mcontent;
  }

  public int getMtime() {
    return mtime;
  }

  public void setMtime(int mtime) {
    this.mtime = mtime;
  }

  public String getDirector() {
    return director;
  }

  public void setDirector(String director) {
    this.director = director;
  }

  public String getCaster() {
    return caster;
  }

  public void setCaster(String caster) {
    this.caster = caster;
  }

  public String getViewclass() {
    return viewclass;
  }

  public void setViewclass(String viewclass) {
    this.viewclass = viewclass;
  }

  public int getGoodscore() {
    return goodscore;
  }

  public void setGoodscore(int goodscore) {
    this.goodscore = goodscore;
  }

  public int getHatescore() {
    return hatescore;
  }

  public void setHatescore(int hatescore) {
    this.hatescore = hatescore;
  }

  public int getMcnt() {
    return mcnt;
  }

  public void setMcnt(int mcnt) {
    this.mcnt = mcnt;
  }

  public String getMdate() {
    return mdate;
  }

  public void setMdate(String mdate) {
    this.mdate = mdate;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }

  public String getImgfile1() {
    return imgfile1;
  }

  public void setImgfile1(String imgfile1) {
    this.imgfile1 = imgfile1;
  }

  public String getImgthumb1() {
    return imgthumb1;
  }

  public void setImgthumb1(String imgthumb1) {
    this.imgthumb1 = imgthumb1;
  }

  public String getVideofile1() {
    return videofile1;
  }

  public void setVideofile1(String videofile1) {
    this.videofile1 = videofile1;
  }

  public MultipartFile getFile1MF() {
    return file1MF;
  }

  public void setFile1MF(MultipartFile file1mf) {
    file1MF = file1mf;
  }
  
  public MultipartFile getFile2MF() {
    return file2MF;
  }

  public void setFile2MF(MultipartFile file2mf) {
    file2MF = file2mf;
  }

  public long getImgsize1() {
    return imgsize1;
  }

  public void setImgsize1(long imgsize1) {
    this.imgsize1 = imgsize1;
  }

  public long getVideosize1() {
    return videosize1;
  }

  public void setVideosize1(long videosize1) {
    this.videosize1 = videosize1;
  }

  public String getSize1_label() {
    return size1_label;
  }

  public void setSize1_label(String size1_label) {
    this.size1_label = size1_label;
  }
  
  public String getSize2_label() {
    return size2_label;
  }

  public void setSize2_label(String size2_label) {
    this.size2_label = size2_label;
  }

  public String getWord() {
    return word;
  }

  public void setWord(String word) {
    this.word = word;
  }

  public int getFavorites_check() {
    return favorites_check;
  }

  public void setFavorites_check(int favorites_check) {
    this.favorites_check = favorites_check;
  }

  public int getMscoreno() {
    return mscoreno;
  }

  public void setMscoreno(int mscoreno) {
    this.mscoreno = mscoreno;
  }

  public int getScore_check() {
    return score_check;
  }

  public void setScore_check(int score_check) {
    this.score_check = score_check;
  }

  public int getMscore_check() {
    return mscore_check;
  }

  public void setMscore_check(int mscore_check) {
    this.mscore_check = mscore_check;
  }

  public int getMemberno() {
    return memberno;
  }

  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }

  public int getMhistory_check() {
    return mhistory_check;
  }

  public void setMhistory_check(int mhistory_check) {
    this.mhistory_check = mhistory_check;
  }

}


