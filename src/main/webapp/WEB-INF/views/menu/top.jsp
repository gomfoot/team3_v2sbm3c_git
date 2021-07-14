<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <%-- 화면 상단 메뉴 --%>
  <DIV style="font-size:2.2em; background-color:#000000; color:white;">
      <span style='padding-left: 0.5%;'></span>
      <A style="line-height:50px; float:left;" href='/' >넨플릭스</A>
      <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
      <c:choose>
        <c:when test="${sessionScope.id == null}"> <%-- 로그인 안 한 경 우 --%>
          <A  href='/member/login.do'  style=" text-decoration: none; ">Login </A>
        </c:when>
        <c:otherwise>
          <A  href='/member/read.do?memberno=${sessionScope.memberno }' style=" text-decoration: none; ">${sessionScope.id }</A> 
          <A  href='/member/logout.do'  style=" text-decoration: none; ">Logout </A>
          <span>&nbsp;</span>   
          <A  href='/categrp/list.do' style=" text-decoration: none; "> 장르 </A> 
          <span>&nbsp;</span> 
          <A  href='/cate/list_all.do' style=" text-decoration: none; ">최신/인기 컨텐츠 </A>
          <span>&nbsp;</span> 
          <A  href='/cate/list_all_join.do' style=" text-decoration: none; ">찜 컨텐츠 </A>                 
          <span>&nbsp;</span> 
          <A  href='/cart/list_by_memberno.do' style=" text-decoration: none; ">커뮤니티 </A>
          <span>&nbsp;</span> 
          <A  href='/cart/list_by_memberno.do' style=" text-decoration: none; ">QnA </A>
          <span>&nbsp;</span> 
          <A  href='/notice/list_notice_paging.do' style=" text-decoration: none; ">공지사항 </A>      
          <span>&nbsp;</span>
        </c:otherwise>
      </c:choose> 
      <c:choose>
        <c:when test="${sessionScope.grade =='admin'}">
          <A  href='/member/list.do'  style=" text-decoration: none; ">회원 목록 </A>
        </c:when>
      </c:choose> 
  </DIV>

  
  