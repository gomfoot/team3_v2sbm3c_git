<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<DIV class='container_main'> 
  <%-- 화면 상단 메뉴 --%>
  <DIV style="background-color:#000000; color:white;">
    <NAV class='top_menu'>
      <span style='padding-left: 0.5%;'></span>
      <A class='menu_link'  href='/' >넨플릭스</A><span class='top_menu_sep'> </span> 
      <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
      <c:choose>
        <c:when test="${sessionScope.id == null}"> <%-- 로그인 안 한 경 우 --%>
          <A class='menu_link'  href='/member/login.do'  style=" text-decoration: none; ">Login </A>
        </c:when>
        <c:otherwise>
          <c:choose>
              <c:when test="${sessionScope.grade =='admin'}"> <%-- 로그인 안 한 경 우 --%>
                    ${sessionScope.id }
              </c:when>
              <c:otherwise>
                    <A  href='/member/read.do?memberno=${sessionScope.memberno }' style="font-size:1.6em; color:yellow; text-decoration: none; ">${sessionScope.id }</A> 
              </c:otherwise>      
            </c:choose>    
          <A class='menu_link'  href='/member/logout.do' >Logout </A><span class='top_menu_sep'> </span>
          <span>&nbsp;</span>   
          <A class='menu_link'  href='/mgenre/list.do' style=" text-decoration: none; "> 장르 </A><span class='top_menu_sep'> </span> 
          <span>&nbsp;</span> 
          <c:choose> 
          <c:when test="${sessionScope.grade =='member'}">
          <A class='menu_link'  href='/favorites/list_favorites.do'  style=" text-decoration: none; ">찜 컨텐츠 </A><span class='top_menu_sep'> </span>                 
          <span>&nbsp;</span> 
          </c:when>
          </c:choose>
          <A class='menu_link'  href='/mboard/list_all.do' style=" text-decoration: none; ">커뮤니티 </A>
          <span>&nbsp;</span>  
          <A class='menu_link'  href='/qna/list_all.do' style=" text-decoration: none; ">QnA </A>
          <span>&nbsp;</span> 
          <A class='menu_link'  href='/notice/list_notice_paging.do' style=" text-decoration: none; ">공지사항 </A>      
          <span>&nbsp;</span>
          <A class='menu_link'  href='/mhistory/list_mhistory.do' style=" text-decoration: none; ">시청기록임시 </A>
        </c:otherwise>
      </c:choose>  
       <c:choose>
        <c:when test="${sessionScope.grade =='admin'}">
          <A  href='/member/list.do'  style=" text-decoration: none; ">회원 목록 </A>
        </c:when>
      </c:choose> 
      
    </NAV>
  </DIV>
  
  <%-- 내용 --%> 
  <DIV class='content'>
  
  