package dev.mvc.mgenre;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.mgenre.MgenreProc")
public class MgenreProc implements MgenreProcInter {
  @Autowired  // DI: Spring 자동으로 구현한 DAO class 객체를 할당
  private MgenreDAOInter mgenreDAO;
  // private MgenreDAOInter mgenreDAO = new MgenreDAO();

  @Override
  public int create(MgenreVO mgenreVO) {
    int cnt = mgenreDAO.create(mgenreVO);
    
    return cnt;
  }
  
  @Override
  public List<MgenreVO> list_mgenreno_asc() {
    List<MgenreVO> list = null;
    list = this.mgenreDAO.list_mgenreno_asc();
    return list;
  }
  
  @Override
  public MgenreVO read(int mgenreno) {
    MgenreVO mgenreVO = null;
    mgenreVO = this.mgenreDAO.read(mgenreno);
    
    return mgenreVO;
  }

  @Override
  public int update(MgenreVO mgenreVO) {
    int cnt = 0;
    cnt = this.mgenreDAO.update(mgenreVO);
    
    return cnt;
  }

  @Override
  public int delete(int mgenreno) {
    int cnt = 0;
    cnt = this.mgenreDAO.delete(mgenreno);
    
    return cnt;
  }

  @Override
  public int read_genre1(String id) {
    int mgenreno = 0;
    mgenreno = this.mgenreDAO.read_genre1(id);
    return mgenreno;
  }
  @Override
  public int read_genre2(String id) {
    int mgenreno = 0;
    mgenreno = this.mgenreDAO.read_genre2(id);
    return mgenreno;
  }
  
  @Override
  public int update_cnt_up(int mgenreno) {
    int cnt = this.mgenreDAO.update_cnt_up(mgenreno);
    return cnt;
  }
  
  @Override
  public int update_cnt_down(int mgenreno) {
    int cnt = this.mgenreDAO.update_cnt_down(mgenreno);
    return cnt;
  }
  
  @Override
  public String read_name(int mgenreno) {
    String name =  this.mgenreDAO.read_name(mgenreno);
    
    return name;
  }
}
