<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>NENFLIX</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
</script>
 
</head> 
  
<body style="background-color:#000000; color:white;">
<jsp:include page="../menu/top.jsp" />

  
  <DIV class='menu_line' ></DIV>
  
  <table class="table table-striped" style='width: 100%; background-color:#000000; color:white;' >
     <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 60%;'/>
      <col style='width: 30%;'/>   
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">공지사항 번호</TH>
      <TH class="th_bs">제목</TH>
      <TH class="th_bs">날짜</TH>
    </TR>
    </thead>
    
    <%-- table 내용 --%>
    <tbody style="background-color:#000000; color:white;">
      <c:forEach var="noticeVO" items="${list }" >
        <c:set var="noticeno" value="${noticeVO.noticeno }" />
        <c:set var="title" value="${noticeVO.title }" />
        <c:set var="rdate" value="${noticeVO.rdate }" />
       
        <tr> 
        <TD class="td_bs" style="background-color:#000000; color:white;">${noticeno }</TD>
        <TD class="td_bs" style="background-color:#000000; color:white;"><A href="./notice_read.do?noticeno=${noticeno }&now_page=${now_page }">${title }</A></TD>
        <TD class="td_bs" style="background-color:#000000; color:white;">${rdate }</TD>
        </tr>
      </c:forEach>
      
    </tbody>
  </table>
<div style="margin:auto; width:3%;">
            <c:choose>
              <c:when test="${sessionScope.grade =='admin'}">
                <ASIDE class="aside_right">
                  <button type='button' onclick="location='/notice/create.do'" class="btn btn-info">등록</button>
                </ASIDE> 
              </c:when>
           </c:choose> 
  </div>
  <DIV class='bottom_menu'>${paging }</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>

