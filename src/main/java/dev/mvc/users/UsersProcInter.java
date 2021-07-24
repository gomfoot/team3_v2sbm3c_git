package dev.mvc.users;

import java.util.HashMap;
import java.util.List;


// MyBATIS의 <mapper namespace="dev.mvc.categrp.CategrpDAOInter">에 선언
// 스프링이 자동으로 구현
public interface UsersProcInter {

  public int create(UsersVO usersVO);
  
  public int checkmemberno(int memberno);

}






