package dev.mvc.favorites;
 
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;
import dev.mvc.mgenre.MgenreVO;
import dev.mvc.movie.MovieProcInter;
import dev.mvc.movie.MovieVO;
 
@Controller
public class FavoritesCont {
  @Autowired
  @Qualifier("dev.mvc.movie.MovieProc")
  private MovieProcInter movieProc;
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  @Autowired
  @Qualifier("dev.mvc.favorites.FavoritesProc")
  private FavoritesProcInter favoritesProc;
  
  public FavoritesCont(){
    System.out.println("-> FavoritesCont created.");
  }
    
  /**
   * 새로고침 방지
   * @return
   */
  @RequestMapping(value="/favorites/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url);
    
    return mav;
  }
  
  //http://localhost:9091/cart/create.do
 /**
  * Ajax 등록 처리
  * INSERT INTO favorites(favoritesno, movieno, memberno)
  * VALUES(favorites_seq.nextval, #{movieno}, #{memberno})
  * @param FavoritesVO
  * @return
  */
 @RequestMapping(value="/favorites/create.do", method=RequestMethod.POST )
 @ResponseBody
 public String create(HttpSession session, int movieno) {
   FavoritesVO favoritesVO = new FavoritesVO();
   favoritesVO.setMovieno(movieno);
   
   int memberno = (Integer)session.getAttribute("memberno");
   favoritesVO.setMemberno(memberno);
   
   int cnt = this.favoritesProc.create(favoritesVO); // 등록 처리
   
   JSONObject json = new JSONObject();
   json.put("cnt", cnt);
   
   System.out.println("-> FavoritesCont create: " + json.toString());

   return json.toString();
 }
 
 /**
  * 회원별 찜 목록
  * http://localhost:9091/favorites/list_favorites.do?memberno=1&now_page=1
  * 
  * @param memberno
  * @param now_page
  * @return
  */
 @RequestMapping(value = "/favorites/list_favorites.do", method = RequestMethod.GET)
 public ModelAndView list_favorites(HttpSession session,
     @RequestParam(value = "memberno", defaultValue = "1") int memberno,
     @RequestParam(value = "now_page", defaultValue = "1") int now_page) {
   System.out.println("--> now_page: " + now_page);

   ModelAndView mav = new ModelAndView();
   int memberno_get = (int)session.getAttribute("memberno");
   
   memberno = memberno_get;
   
   if((Integer.toString(now_page)).equals("")) {
     now_page = 1;     
   }    
   //System.out.println("--> now_page: " + now_page);
   
   // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
   HashMap<String, Object> map = new HashMap<String, Object>();
   map.put("memberno", memberno); // #{memberno}
   map.put("now_page", now_page); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용
   
   // 검색 목록
   List<FavoritesVO> list = favoritesProc.list_favorites(map);
   mav.addObject("list", list);
 
   // 검색된 레코드 갯수
   int search_count = favoritesProc.search_count(map);
   mav.addObject("search_count", search_count);

   MemberVO memberVO = memberProc.read(memberno);
   mav.addObject("memberVO", memberVO);

   /*
    * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
    * 18 19 20 [다음]
    * @param list_file 목록 파일명
    * @param memberno 회원번호
    * @param search_count 검색(전체) 레코드수
    * @param now_page 현재 페이지
    * @return 페이징 생성 문자열
    */
   String paging = favoritesProc.pagingBox("list_favorites.do", memberno, search_count, now_page);
   mav.addObject("paging", paging);

   mav.addObject("now_page", now_page);

   // /movie/list_table_img1_search_paging.jsp
   mav.setViewName("/favorites/list_favorites");

   return mav;
 }
 
 /**
  * 영화 삭제
  * http://localhost:9091/favorites/delete.do
  * @return
  */
 @RequestMapping(value="/favorites/delete.do", method=RequestMethod.POST )
 public ModelAndView delete(HttpSession session,
     @RequestParam(value="favoritesno", defaultValue="0") int favoritesno ) {
   ModelAndView mav = new ModelAndView();
   
   this.favoritesProc.delete(favoritesno);      
   mav.setViewName("redirect:/favorites/list_favorites.do");
   
   return mav;
 }
 
}


