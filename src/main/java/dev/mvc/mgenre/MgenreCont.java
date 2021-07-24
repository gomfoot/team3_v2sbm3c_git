package dev.mvc.mgenre;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.movie.MovieProcInter;

@Controller
public class MgenreCont {
  @Autowired 
  @Qualifier("dev.mvc.mgenre.MgenreProc")
  private MgenreProcInter mgenreProc;
  
  @Autowired 
  @Qualifier("dev.mvc.movie.MovieProc")
  private MovieProcInter movieProc;
  
  public MgenreCont() {
    System.out.println("-> MgenreCont created.");
  }
  
  // http://localhost:9091/mgenre/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/mgenre/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mgenre/create"); // /WEB-INF/views/mgenre/create.jsp
    
    return mav; // forward
  }
  
  // http://localhost:9091/mgenre/create.do
  /**
   * 등록 처리
   * @param mgenreVO
   * @return
   */
  @RequestMapping(value="/mgenre/create.do", method=RequestMethod.POST )
  public ModelAndView create(MgenreVO mgenreVO) { // mgenreVO 자동 생성, Form -> VO
    // MgenreVO mgenreVO <FORM> 태그의 값으로 자동 생성됨.
    // request.setAttribute("mgenreVO", mgenreVO); 자동 실행
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.mgenreProc.create(mgenreVO); // 등록 처리
    
    // cnt = 0; // error test
    if (cnt == 1) {
      mav.setViewName("redirect:/mgenre/list.do");   
    } else {
      mav.addObject("code", "create"); // request에 저장, request.setAttribute("cnt", cnt)
      mav.setViewName("/mgenre/error_msg"); // /WEB-INF/views/mgenre/error_msg.jsp
    }
    
    return mav; // forward
  }
  
  /**
   * Ajax 기반 목록
   * http://localhost:9091/mgenre/list.do
   * @return
   */
  @RequestMapping(value="/mgenre/list.do", method=RequestMethod.GET )
  public ModelAndView list_grid_ajax() {
    ModelAndView mav = new ModelAndView();
    
    List<MgenreVO> list = this.mgenreProc.list_mgenreno_asc();
        
    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/mgenre/list_grid_ajax"); // /WEB-INF/views/mgenre/list_grid_ajax.jsp
    return mav;
  }
  
  // http://localhost:9091/mgenre/read_update.do
  /**
   * 조회 + 수정폼
   * @param mgenreno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/mgenre/read_update.do", 
                              method=RequestMethod.GET )
  public ModelAndView read_update(int mgenreno) {
    
    ModelAndView mav = new ModelAndView();
    
    MgenreVO mgenreVO = this.mgenreProc.read(mgenreno);
    mav.addObject("mgenreVO", mgenreVO);  // request 객체에 저장
    
    List<MgenreVO> list = this.mgenreProc.list_mgenreno_asc();
    mav.addObject("list", list);  // request 객체에 저장

    mav.setViewName("/mgenre/read_update"); // /WEB-INF/views/mgenre/read_update.jsp 
    return mav; // forward
  }
  
  /**
   * 조회 + 수정폼/삭제폼 + Ajax, , VO에서 각각의 필드를 JSON으로 변환하는경우
   * http://localhost:9091/mgenre/read_ajax.do?mgenreno=1
   * {"mgenreno":1,"name":"액션"}
   * @param mgenreno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/mgenre/read_ajax.do", 
                              method=RequestMethod.GET )
  @ResponseBody
  public String read_ajax(int mgenreno) {
    MgenreVO mgenreVO = this.mgenreProc.read(mgenreno);
    
    JSONObject json = new JSONObject();
    json.put("mgenreno", mgenreVO.getMgenreno());
    json.put("mgenrename", mgenreVO.getMgenrename());
    json.put("cnt", mgenreVO.getCnt());
    
    // 자식 레코드의 갯수 추가
    //int count_by_mgenreno = this.movieProc.count_by_mgenreno(mgenreno);
    //json.put("count_by_mgenreno", count_by_mgenreno);
    
    return json.toString();

  }

  
  // http://localhost:9091/mgenre/update.do
  /**
   * 수정 처리
   * @param mgenreVO
   * @return
   */
  @RequestMapping(value="/mgenre/update.do", 
                              method=RequestMethod.POST )
  public ModelAndView update(MgenreVO mgenreVO) {
    // MgenreVO mgenreVO <FORM> 태그의 값으로 자동 생성됨.
    // request.setAttribute("mgenreVO", mgenreVO); 자동 실행
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.mgenreProc.update(mgenreVO);
    mav.addObject("cnt", cnt); // request에 저장
    
    if (cnt == 1) {
      mav.setViewName("redirect:/mgenre/list.do");   
    } else {
      mav.setViewName("/mgenre/update_msg"); // /WEB-INF/views/mgenre/update_msg.jsp
    }
    
    return mav;
  }
  
  // http://localhost:9091/mgenre/read_delete.do
  /**
   * 조회 + 삭제폼
   * @param mgenreno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/mgenre/read_delete.do", 
                              method=RequestMethod.GET )
  public ModelAndView read_delete(int mgenreno) {
    ModelAndView mav = new ModelAndView();
    
    MgenreVO mgenreVO = this.mgenreProc.read(mgenreno); // 삭제할 자료 읽기
    mav.addObject("mgenreVO", mgenreVO);  // request 객체에 저장
    
    List<MgenreVO> list = this.mgenreProc.list_mgenreno_asc();
    mav.addObject("list", list);  // request 객체에 저장

    mav.setViewName("/mgenre/read_delete"); // read_delete.jsp
    return mav;
  }
  
  // http://localhost:9091/mgenre/delete.do
  /**
   * 삭제
   * @param mgenreno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/mgenre/delete.do", 
                              method=RequestMethod.POST )
  public ModelAndView delete(int mgenreno) {
    ModelAndView mav = new ModelAndView();
    
    MgenreVO mgenreVO = this.mgenreProc.read(mgenreno); // 삭제 정보
    mav.addObject("mgenreVO", mgenreVO);  // request 객체에 저장
    
    int cnt = this.mgenreProc.delete(mgenreno); // 삭제 처리
    mav.addObject("cnt", cnt);  // request 객체에 저장
    
    if (cnt == 1) {
      mav.setViewName("redirect:/mgenre/list.do");   
    } else {
      mav.setViewName("/mgenre/delete_msg"); // /WEB-INF/views/mgenre/delete_msg.jsp
    }

    return mav;
  }
 
  
}
