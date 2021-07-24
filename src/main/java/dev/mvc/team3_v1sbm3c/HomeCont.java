package dev.mvc.team3_v1sbm3c;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;
import dev.mvc.mgenre.MgenreProcInter;
import dev.mvc.mgenre.MgenreVO;
import dev.mvc.mhistory.MhistoryProcInter;
import dev.mvc.mhistory.MhistoryVO;
import dev.mvc.movie.MovieProcInter;
import dev.mvc.movie.MovieVO;

@Controller
public class HomeCont {
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  @Autowired
  @Qualifier("dev.mvc.mgenre.MgenreProc")
  private MgenreProcInter mgenreProc;
  
  @Autowired
  @Qualifier("dev.mvc.movie.MovieProc")
  private MovieProcInter movieProc;
  
  @Autowired
  @Qualifier("dev.mvc.mhistory.MhistoryProc")
  private MhistoryProcInter mhistoryProc;
  
  public HomeCont() {
    System.out.println("-> HomeCont created.");
  }

  // http://localhost:9091
  @RequestMapping(value = {"/", "/index.do"}, method = RequestMethod.GET)
  public ModelAndView home(HttpSession session) {
    ModelAndView mav = new ModelAndView();
     
    int mg1 = 0;
    int mg2 = 0;
    String mg1_name="";
    String mg2_name="";
    if(session.getAttribute("memberno") != null) {
      int memberno = (int)session.getAttribute("memberno"); 
      MemberVO memberVO = memberProc.read(memberno);
      
      List<MhistoryVO> list = mhistoryProc.list_sort(memberVO.getMemberno());
      if(list.size() == 0) {
        mav.addObject("check1", 0);
        mav.addObject("check2", 0);
      }else if (list.size() == 1) {
        MhistoryVO mhistory = list.get(0);
        mg1 = movieProc.genre_read(mhistory.getMovieno());
        mg1_name= mgenreProc.read_name(mg1);
        
        List<MovieVO> list_g1 = movieProc.list_genre(mg1);
        
        mav.addObject("list_g1", list_g1);
        
        mav.addObject("check1", 1);
        mav.addObject("check2", 0);
        mav.addObject("mg1", mg1);
        mav.addObject("mg1_name", mg1_name);
        
      } else {
        
        MhistoryVO mhistory = list.get(0);
        mg1 = movieProc.genre_read(mhistory.getMovieno());
        mg1_name= mgenreProc.read_name(mg1);
        mhistory = list.get(1);
        mg2 = movieProc.genre_read(mhistory.getMovieno());
        mg2_name= mgenreProc.read_name(mg2);
        
    
        if(mg1 == mg2) {
          List<MovieVO> list_g1 = movieProc.list_genre(mg1);
          mav.addObject("list_g1", list_g1);
          
          mav.addObject("check1", 1);
          mav.addObject("check2", 0);
          mav.addObject("mg1", mg1);
          mav.addObject("mg1_name", mg1_name);
        }else {
          List<MovieVO> list_g1 = movieProc.list_genre(mg1);
          mav.addObject("list_g1", list_g1);
          
          List<MovieVO> list_g2 = movieProc.list_genre(mg2);
          mav.addObject("list_g2", list_g2);
          
          mav.addObject("check1", 1);
          mav.addObject("check2", 1);
          mav.addObject("mg1", mg1);
          mav.addObject("mg2", mg2);
          mav.addObject("mg1_name", mg1_name);
          mav.addObject("mg2_name", mg2_name);
        }
  
      }
      System.out.println("mg1 > " + mg1);
      System.out.println("mg2 > " + mg2);
      
      mav.addObject("memberVO", memberVO); 
    }
    List<MovieVO> list_p = movieProc.list_popular();
    mav.addObject("list_p", list_p);
    
    List<MovieVO> list_l = movieProc.list_latest();
    mav.addObject("list_l", list_l);

    mav.setViewName("/index");  
    
    return mav;
  }

}


