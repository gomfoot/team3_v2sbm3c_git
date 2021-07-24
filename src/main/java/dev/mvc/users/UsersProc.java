package dev.mvc.users;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.member.MemberDAOInter;


@Component("dev.mvc.users.UsersProc")
public class UsersProc implements UsersProcInter{
  @Autowired
  private UsersDAOInter usersDAO;
  
  public UsersProc(){
    System.out.println("-> UsersProc created.");
  }

  @Override
  public int create(UsersVO usersVO) {
    int cnt = this.usersDAO.create(usersVO);
    return cnt;
  }

  @Override
  public int checkmemberno(int memberno) {
   int cnt= this.usersDAO.checkmemberno(memberno);
   return cnt;
  }
  
}






