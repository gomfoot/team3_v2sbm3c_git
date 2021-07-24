package dev.mvc.movie;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.favorites.FavoritesProcInter;
import dev.mvc.mgenre.MgenreProcInter;
import dev.mvc.mgenre.MgenreVO;
import dev.mvc.mhistory.MhistoryProcInter;
//import dev.mvc.member.MemberProcInter;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class MovieCont {
  @Autowired
  @Qualifier("dev.mvc.mgenre.MgenreProc")
  private MgenreProcInter mgenreProc;
  
  @Autowired
  @Qualifier("dev.mvc.movie.MovieProc")
  private MovieProcInter movieProc;
  
  @Autowired
  @Qualifier("dev.mvc.favorites.FavoritesProc")
  private FavoritesProcInter favoritesProc;
  
  @Autowired
  @Qualifier("dev.mvc.mhistory.MhistoryProc")
  private MhistoryProcInter mhistoryProc;
  
  public MovieCont() {
    System.out.println("-> MovieCont created.");
  }

  /**
   * 새로고침 방지
   * @return
   */
  @RequestMapping(value="/movie/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
  
  /**
   * 등록폼
   * http://localhost:9091/movie/create.do?
   * 
   * @return
   */
  @RequestMapping(value = "/movie/create.do", method = RequestMethod.GET)
  public ModelAndView create(int mgenreno) {
    ModelAndView mav = new ModelAndView();
    
    MgenreVO mgenreVO = this.mgenreProc.read(mgenreno);
       
    mav.addObject("mgenreVO", mgenreVO);
    
    mav.setViewName("/movie/create"); // /webapp/WEB-INF/views/movie/create.jsp

    return mav; // forward
  }
  
  /**
   * 등록 처리 http://localhost:9090/movie/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/movie/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, MovieVO movieVO) {
    ModelAndView mav = new ModelAndView();
  
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String imgfile1 = "";          // 원본 파일명 image
    String imgthumb1 = "";     // preview image
    String videofile1 = "";          // 원본 파일명 video
    
    // 기준 경로 확인
    String user_dir = System.getProperty("user.dir");
    System.out.println("--> User dir: " + user_dir);
    
    // 파일 접근임으로 절대 경로 지정, static 지정
    String upDir_i =  user_dir + "/src/main/resources/static/movie/img_storage/"; // 절대 경로
    String upDir_v =  user_dir + "/src/main/resources/static/movie/video_storage/"; // 절대 경로
    
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    // <input type='file' class="form-control" name='file1MF' id='file1MF' 
    //           value='' placeholder="파일 선택">
    MultipartFile mf1 = movieVO.getFile1MF();
    MultipartFile mf2 = movieVO.getFile2MF();
    
    imgfile1 = mf1.getOriginalFilename(); // 원본 파일명
    long imgsize1 = mf1.getSize();  // 파일 크기
    
    if (imgsize1 > 0) { // 파일 크기 체크
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      imgfile1 = Upload.saveFileSpring(mf1, upDir_i); 
      
      if (Tool.isImage(imgfile1)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
        imgthumb1 = Tool.preview(upDir_i, imgfile1, 200, 150); 
      }
      
    }    
    
    videofile1 = mf2.getOriginalFilename(); // 원본 파일명
    
    long videosize1 = mf2.getSize();  // 파일 크기
    
    if (videosize1 > 0) { // 파일 크기 체크
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      videofile1 = Upload.saveFileSpring_RND(mf2, upDir_v, "MP4"); 
      
    }
    
    movieVO.setImgfile1(imgfile1);
    movieVO.setImgthumb1(imgthumb1);
    movieVO.setImgsize1(imgsize1);
    movieVO.setVideofile1(videofile1);
    movieVO.setVideosize1(videosize1);
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
    
    int cnt_up = this.mgenreProc.update_cnt_up(movieVO.getMgenreno());
    
    // Call By Reference: 메모리 공유, Hashcode 전달
    int cnt = this.movieProc.create(movieVO); 
    
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

    // System.out.println("--> mgenreno: " + movieVO.getMgenreno());
    // redirect시에 hidden tag로 보낸것들이 전달이 안됨으로 request에 다시 저장
    mav.addObject("mgenreno", movieVO.getMgenreno()); // redirect parameter 적용
    mav.addObject("url", "/movie/create_msg"); // create_msg.jsp, redirect parameter 적용

    mav.setViewName("redirect:/movie/msg.do"); 

    return mav; // forward
  }

  /**
   * 목록 + 검색 + 페이징 지원
   * http://localhost:9091/movie/list_search_paging.do?mgenreno=1&word=마인&now_page=1
   * 
   * @param mgenreno
   * @param word
   * @param now_page
   * @return
   */
  @RequestMapping(value = "/movie/list_search_paging.do", method = RequestMethod.GET)
  public ModelAndView list_search_paging(
      @RequestParam(value = "mgenreno", defaultValue = "1") int mgenreno,
      @RequestParam(value = "word", defaultValue = "") String word,
      @RequestParam(value = "now_page", defaultValue = "1") int now_page) {
    System.out.println("--> now_page: " + now_page);

    ModelAndView mav = new ModelAndView();

    if((Integer.toString(now_page)).equals("")) {
      now_page = 1;     
    }    
    //System.out.println("--> now_page: " + now_page);
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("mgenreno", mgenreno); // #{mgenreno}
    map.put("word", word); // #{word}
    map.put("now_page", now_page); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용
    
    // 검색 목록
    List<MovieVO> list = movieProc.list_search_paging(map);
    mav.addObject("list", list);

    //List<MovieVO> list2 = this.movieProc.list_by_mgenreno(mgenreno);
    //mav.addObject("list2", list2);
    
    // 검색된 레코드 갯수
    int search_count = movieProc.search_count(map);
    mav.addObject("search_count", search_count);

    MgenreVO mgenreVO = mgenreProc.read(mgenreno);
    mav.addObject("mgenreVO", mgenreVO);

    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
     * 18 19 20 [다음]
     * @param list_file 목록 파일명
     * @param mgenreno 상품번호
     * @param search_count 검색(전체) 레코드수
     * @param now_page 현재 페이지
     * @param word 검색어
     * @return 페이징 생성 문자열
     */
    String paging = movieProc.pagingBox("list_search_paging.do", mgenreno, search_count, now_page, word);
    mav.addObject("paging", paging);

    mav.addObject("now_page", now_page);

    // /movie/list_table_img1_search_paging.jsp
    mav.setViewName("/movie/list_search_paging");

    return mav;
  }
  
  /**
   * 조회
   * @return
   */
  @RequestMapping(value="/movie/read.do", method=RequestMethod.GET )
  public ModelAndView read(HttpSession session, int movieno, int now_page) {
    ModelAndView mav = new ModelAndView();
   
    if((int)session.getAttribute("pay_exist")==1 ) {
   // System.out.println("--> now_page: " + now_page);
      int mcnt = this.movieProc.update_mcnt(movieno); 
   
      MovieVO movieVO = this.movieProc.read(movieno);
      if(session.getAttribute("memberno")!=null) {
        
        int memberno = (Integer)session.getAttribute("memberno");
        
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("memberno", memberno); // #{memberno}
        map.put("movieno", movieno); // #{memberno}
        
        int favorites_check = this.favoritesProc.favorites_check(map);
        int mscore_check = this.movieProc.mscore_check(map);
        int score_check = 0;
        if(mscore_check == 0) {
          movieProc.create_mscore(map);
          score_check =this.movieProc.mscore_read(map);
        }else {
          score_check =this.movieProc.mscore_read(map);
        }
        
        movieVO.setFavorites_check(favorites_check);
        movieVO.setMscore_check(mscore_check);
        movieVO.setScore_check(score_check);
        
        
      }
   
      System.out.println("Favorites: " + movieVO.getFavorites_check());
      System.out.println("Mscore: " + movieVO.getMscore_check());
      mav.addObject("movieVO", movieVO); // request.setAttribute("movieVO", movieVO);

      MgenreVO mgenreVO = this.mgenreProc.read(movieVO.getMgenreno());
      mav.addObject("mgenreVO", mgenreVO); 

      mav.addObject("now_page", now_page);
      
      mav.setViewName("/movie/read"); // /WEB-INF/views/movie/read.jsp
    }else {
      mav.setViewName("/users/create");
    }
    
    return mav;
  }
  
  
  
  
  /**
   * 수정 폼
   * http://localhost:9091/movie/update_text.do?movieno=1
   * 
   * @return
   */
  @RequestMapping(value = "/movie/update_text.do", method = RequestMethod.GET)
  public ModelAndView update_text(int movieno) {
    ModelAndView mav = new ModelAndView();
    
    MovieVO movieVO = this.movieProc.read_update_text(movieno);
    MgenreVO mgenreVO = this.mgenreProc.read(movieVO.getMgenreno());
    
    mav.addObject("movieVO", movieVO);
    mav.addObject("mgenreVO", mgenreVO);
    
    mav.setViewName("/movie/update_text"); // /WEB-INF/views/movie/update_text.jsp
    // mav.addObject("content", content);

    return mav; // forward
  }
  
  /**
   * 수정 처리
   * http://localhost:9091/movie/update_text.do?movieno=1
   * 
   * @return
   */
  @RequestMapping(value = "/movie/update_text.do", method = RequestMethod.POST)
  public ModelAndView update_text(MovieVO movieVO, @RequestParam(value = "now_page", defaultValue = "1") int now_page) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.movieProc.update_text(movieVO); // 수정 처리
    
    mav.addObject("movieno", movieVO.getMovieno());
    mav.addObject("now_page",now_page);
    
    mav.setViewName("redirect:/movie/read.do"); 

    return mav; // forward
  }
  
  /**
   * 파일 수정 폼
   * http://localhost:9091/movie/update_file.do?movieno=1
   * 
   * @return
   */
  @RequestMapping(value = "/movie/update_file.do", method = RequestMethod.GET)
  public ModelAndView update_file( int movieno) {
    ModelAndView mav = new ModelAndView();
    
    MovieVO movieVO = this.movieProc.read(movieno);
    MgenreVO mgenreVO = this.mgenreProc.read(movieVO.getMgenreno());
    
    mav.addObject("movieVO", movieVO);
    mav.addObject("mgenreVO", mgenreVO);
    
    mav.setViewName("/movie/update_file"); // /WEB-INF/views/movie/update_file.jsp

    return mav; // forward
  }
  
  /**
   * 파일 수정 처리 http://localhost:9091/movie/update_file.do
   * 
   * @return
   */
  @RequestMapping(value = "/movie/update_file.do", method = RequestMethod.POST)
  public ModelAndView update_file(HttpServletRequest request, MovieVO movieVO,@RequestParam(value = "now_page", defaultValue = "1") int now_page) {
    ModelAndView mav = new ModelAndView();

    // -------------------------------------------------------------------
    // 파일 삭제 코드 시작
    // -------------------------------------------------------------------
    // 삭제할 파일 정보를 읽어옴.
    MovieVO vo = movieProc.read(movieVO.getMovieno());
//    System.out.println("movieno: " + vo.getMovieno());
//    System.out.println("file1: " + vo.getFile1());
    
    String imgfile1 = vo.getImgfile1();
    String imgthumb1 = vo.getImgthumb1();
    long imgsize1 = 0;
    String videofile1 = vo.getVideofile1();
    long videosize1 = 0;
    boolean sw = false;
    
    String upDir_i =  System.getProperty("user.dir") + "/src/main/resources/static/movie/img_storage/"; // 절대 경로
    String upDir_v =  System.getProperty("user.dir") + "/src/main/resources/static/movie/video_storage/"; // 절대 경로
    
    sw = Tool.deleteFile(upDir_i, imgfile1);  // Folder에서 1건의 파일 삭제
    sw = Tool.deleteFile(upDir_i, imgthumb1);     // Folder에서 1건의 파일 삭제
    sw = Tool.deleteFile(upDir_v, videofile1);  // Folder에서 1건의 파일 삭제
    
    // System.out.println("sw: " + sw);
    // -------------------------------------------------------------------
    // 파일 삭제 종료 시작
    // -------------------------------------------------------------------
    
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String file1 = "";          // 원본 파일명 image
    String file2 = "";          // 원본 파일명 video

    // String upDir_i =  System.getProperty("user.dir") + "/src/main/resources/static/movie/img_storage/"; // 절대 경로
    // String upDir_v =  System.getProperty("user.dir") + "/src/main/resources/static/movie/video_storage/"; // 절대 경로
    MultipartFile mf1 = movieVO.getFile1MF();
    MultipartFile mf2 = movieVO.getFile2MF();
    
    file1 = mf1.getOriginalFilename(); // 원본 파일명
    imgsize1 = mf1.getSize();  // 파일 크기
    
    if (imgsize1 > 0) { // 파일 크기 체크
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      imgfile1 = Upload.saveFileSpring(mf1, upDir_i); 
      
      if (Tool.isImage(imgfile1)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 250, height: 200
        imgthumb1 = Tool.preview(upDir_i, imgfile1, 250, 200); 
      }
      
    }    
    
    file2 = mf2.getOriginalFilename(); // 원본 파일명
    videosize1 = mf2.getSize();  // 파일 크기
    
    if (videosize1 > 0) { // 파일 크기 체크
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      videofile1 = Upload.saveFileSpring(mf2, upDir_v);       
    }    

    
    movieVO.setImgfile1(file1);
    movieVO.setImgthumb1(imgthumb1);
    movieVO.setImgsize1(imgsize1);
    movieVO.setVideofile1(file2);
    movieVO.setVideosize1(videosize1);
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
    
    // Call By Reference: 메모리 공유, Hashcode 전달
    int cnt = this.movieProc.update_file(movieVO);
    
    mav.addObject("movieno", movieVO.getMovieno());
    mav.addObject("now_page",now_page);
    mav.setViewName("redirect:/movie/read.do"); 

    return mav; // forward
  }   
  
  /**
   * 삭제 폼
   * @param movieno
   * @return
   */
  @RequestMapping(value="/movie/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int movieno) { 
    ModelAndView mav = new  ModelAndView();
    
    // 삭제할 정보를 조회하여 확인
    MovieVO movieVO = this.movieProc.read(movieno);
    mav.addObject("movieVO", movieVO);  
    
    MgenreVO mgenreVO = this.mgenreProc.read(movieVO.getMgenreno());
    mav.addObject("mgenreVO", mgenreVO);
    
    mav.setViewName("/movie/delete");  // movie/delete.jsp
    
    return mav; 
  }
  
  /**
   * 삭제 처리 http://localhost:9091/movie/delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/movie/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(HttpServletRequest request, int movieno,int now_page,
                                         int mgenreno,
                                         String word) {
    ModelAndView mav = new ModelAndView();

    // -------------------------------------------------------------------
    // 파일 삭제 코드 시작
    // -------------------------------------------------------------------
    // 삭제할 파일 정보를 읽어옴.
    MovieVO vo = movieProc.read(movieno);
//    System.out.println("movieno: " + vo.getMovieno());
//    System.out.println("file1: " + vo.getFile1());
    
    String imgfile1 = vo.getImgfile1();
    String imgthumb1 = vo.getImgthumb1();
    String videofile1 = vo.getVideofile1();
    boolean sw = false;
    
    String upDir_i =  System.getProperty("user.dir") + "/src/main/resources/static/movie/img_storage/"; // 절대 경로
    String upDir_v =  System.getProperty("user.dir") + "/src/main/resources/static/movie/video_storage/"; // 절대 경로
    
    sw = Tool.deleteFile(upDir_i, imgfile1);  // Folder에서 1건의 파일 삭제
    sw = Tool.deleteFile(upDir_i, imgthumb1);     // Folder에서 1건의 파일 삭제
    sw = Tool.deleteFile(upDir_v, videofile1);  // Folder에서 1건의 파일 삭제
    // System.out.println("sw: " + sw);
    // -------------------------------------------------------------------
    // 파일 삭제 종료 시작
    // -------------------------------------------------------------------
    int cnt_down = this.mgenreProc.update_cnt_down(mgenreno);

    int cnt = this.movieProc.delete(movieno); // DBMS 삭제

    if (cnt == 1) {
      // -------------------------------------------------------------------------------------
      // 마지막 페이지의 레코드 삭제시의 페이지 번호 -1 처리
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("mgenreno", mgenreno);
      map.put("word", word);
      // 10번째 레코드를 삭제후
      // 하나의 페이지가 3개의 레코드로 구성되는 경우 현재 9개의 레코드가 남아 있으면
      // 페이지수를 4 -> 3으로 감소 시켜야함.
      if (movieProc.search_count(map) % Movie.RECORD_PER_PAGE == 0) {
        now_page = now_page - 1;
        if (now_page < 1) {
          now_page = 1; // 시작 페이지
        }
      }
      // -------------------------------------------------------------------------------------
    }
    
    mav.addObject("now_page", now_page);
    
    mav.setViewName("redirect:/movie/list_search_paging.do?now_page="+now_page+"&mgenreno="+mgenreno);

    return mav; // forward
  }   
  
  /**
   * 좋아요 Ajax 수정 처리
   * http://localhost:9091/movie/update_goodscore_ajax.do?movieno=30
   * 
   * @return
   */
  @RequestMapping(value = "/movie/update_goodscore_ajax.do", method = RequestMethod.GET)
  @ResponseBody
  public String update_goodscore_ajax(HttpSession session, int movieno) {
    try {
      Thread.sleep(1000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
      
    int memberno = (Integer)session.getAttribute("memberno");
       
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("memberno", memberno); // #{memberno}
    map.put("movieno", movieno); // #{memberno}
    MovieVO movieVO = this.movieProc.read(movieno);
        
    int score_check = this.movieProc.mscore_read(map);
    movieVO.setScore_check(score_check);
    
    int goodscore = this.movieProc.read(movieno).getGoodscore(); 
        
    JSONObject json = new JSONObject();
    
    if(score_check == 0) {
      this.movieProc.gscore_check(map);
      score_check = score_check + 1;
      goodscore++;
      this.movieProc.update_goodscore_up(movieno); 
    } else {
      this.movieProc.score_check_cancel(map);
      score_check = score_check - 1;
      goodscore--;
      this.movieProc.update_goodscore_down(movieno); 
    }    

    json.put("goodscore", goodscore);
    json.put("score_check", score_check);
    
    return json.toString();
  }
  /**
   * 싫어요 Ajax 수정 처리
   * http://localhost:9091/movie/update_hatescore_ajax.do?movieno=30
   * 
   * @return
   */
  @RequestMapping(value = "/movie/update_hatescore_ajax.do", method = RequestMethod.GET)
  @ResponseBody
  public String update_hatescore_ajax(HttpSession session, int movieno) {
    try {
      Thread.sleep(1000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
      
    int memberno = (Integer)session.getAttribute("memberno");
       
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("memberno", memberno); // #{memberno}
    map.put("movieno", movieno); // #{memberno}
    MovieVO movieVO = this.movieProc.read(movieno);
        
    int score_check = this.movieProc.mscore_read(map);
    movieVO.setScore_check(score_check);
    
    int hatescore = this.movieProc.read(movieno).getHatescore(); 
        
    JSONObject json = new JSONObject();
    
    if(score_check == 0) {
      this.movieProc.hscore_check(map);
      score_check = score_check + 2;
      hatescore++;
      this.movieProc.update_hatescore_up(movieno); 
    } else {
      this.movieProc.score_check_cancel(map);
      score_check = score_check - 2;
      hatescore--;
      this.movieProc.update_hatescore_down(movieno); 
    }    

    json.put("hatescore", hatescore);
    json.put("score_check", score_check);
    
    return json.toString();
  }
  
  /**
   * 시청기록 생성 및 수정
   * http://localhost:9091/movie/update_hatescore_ajax.do?movieno=30
   * 
   * @return
   */
  @RequestMapping(value = "/movie/mhistory.do", method = RequestMethod.GET)
  @ResponseBody
  public String mhistory(HttpSession session, int movieno) {
    
    int memberno = (Integer)session.getAttribute("memberno");
    
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("memberno", memberno); // #{memberno}
    map.put("movieno", movieno); // #{memberno}
    
    int mhistory_check = this.mhistoryProc.mhistory_check(map);
    int cnt = 0;
    if(mhistory_check == 0) {
      cnt = mhistoryProc.create_mhistory(map);
      
    }else {
      cnt = mhistoryProc.update_mhistory(map);
    }
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    return json.toString();
  }
}
