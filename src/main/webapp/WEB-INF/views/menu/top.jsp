<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <%-- 화면 상단 메뉴 --%>
  <DIV style="font-size:2.2em; background-color:#000000; color:white;">
    <NAV class='top_menu'>
      <span style='padding-left: 0.5%;'></span>
      <A class='menu_link'  href='/' >넨플릭스</A><span class='top_menu_sep'> </span> 
      <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
      <c:choose>
        <c:when test="${sessionScope.id == null}"> <%-- 로그인 안 한 경 우 --%>
          <A class='menu_link'  href='/member/login.do'  style=" text-decoration: none; ">Login </A>
        </c:when>
        <c:otherwise>
          ${sessionScope.id } <A class='menu_link'  href='/member/logout.do' >Logout </A>
          <span>&nbsp;</span>   
          <A class='menu_link'  href='/categrp/list.do' style=" text-decoration: none; "> 장르 </A> 
          <span>&nbsp;</span> 
          <A class='menu_link'  href='/cate/list_all.do' style=" text-decoration: none; ">최신/인기 컨텐츠 </A>
          <span>&nbsp;</span> 
          <A class='menu_link'  href='/cate/list_all_join.do' style=" text-decoration: none; ">찜 컨텐츠 </A>                 
          <span>&nbsp;</span> 
          <A class='menu_link'  href='/cart/list_by_memberno.do' style=" text-decoration: none; ">커뮤니티 </A>
          <span>&nbsp;</span> 
          <A class='menu_link'  href='/cart/list_by_memberno.do' style=" text-decoration: none; ">qna </A>
          <span>&nbsp;</span> 
          <A class='menu_link'  href='/notice/list_notice_paging.do' style=" text-decoration: none; ">공지사항 </A>      
          <span>&nbsp;</span>
        </c:otherwise>
      </c:choose> 
      <c:choose>
        <c:when test="${sessionScope.grade =='admin'}">
          <A class='menu_link'  href='/member/login.do'  style=" text-decoration: none; ">회원 목록 </A>
        </c:when>
      </c:choose> 
      

    </NAV>
  </DIV>

  
  