<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>NENFLIX</title>
 
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
 
<script type="text/javascript">
  $(function(){
 
  });
</script>
</head> 
 
<body style="background-color:#000000; color:white;">
<jsp:include page="../menu/top.jsp" flush='false' />
 

    <div class='menu_line'></div>
    
   
    <table class="table table-striped" style='width: 100%; '>
    <colgroup>
      <col style='width: 5%;'/>
      <col style='width: 10%;'/>
      <col style='width: 15%;'/>
      <col style='width: 15%;'/>
      <col style='width: 24%;'/>
      <col style='width: 7%;'/>
      <col style='width: 7%;'/>
      <col style='width: 15%;'/>
    </colgroup>
    <TR style="background-color:#000000; color:white;">
      <TH class='th_bs'>번호</TH>
      <TH class='th_bs'>ID</TH>
      <TH class='th_bs'>성명</TH>
      <TH class='th_bs'>전화번호</TH>
      <TH class='th_bs'>주소</TH>
      <TH class='th_bs'>장르1</TH>
      <TH class='th_bs'>장르2</TH>
      <TH class='th_bs'>등록일</TH>
      
    </TR>
   
    <c:forEach var="memberVO" items="${list }">
      <c:set var="memberno" value ="${memberVO.memberno}" />
      <c:set var="id" value ="${memberVO.id}" />
      <c:set var="mname" value ="${memberVO.mname}" />
      <c:set var="tel" value ="${memberVO.tel}" />
      <c:set var="address1" value ="${memberVO.address1}" />
      <c:set var="mdate" value ="${memberVO.mdate}" />
      <c:set var="genre1" value ="${memberVO.genre1}" />
      <c:set var="genre2" value ="${memberVO.genre2}" />
       
    <TR style="background-color:#000000; color:white;">
      <TD class=td_basic>${memberno}</TD>
      <TD class='td_left'>${id}</TD>
      <TD class='td_left'>${mname}</TD>
      <TD class='td_basic'>${tel}</TD>
      <TD class='td_left'>
        <c:choose>
          <c:when test="${address1.length() > 15 }"> <!-- 긴 주소 처리 -->
            ${address1.substring(0, 15) }...
          </c:when>
          <c:otherwise>
            ${address1}
          </c:otherwise>
        </c:choose>
      </TD>
      <TD class='td_basic'>${genre1} </TD>
      <TD class='td_basic'>${genre2} </TD>
      <TD class='td_basic'>${mdate.substring(0, 10)}</TD> <!-- 년월일 -->
      
    </TR>
    </c:forEach>
    
  </TABLE>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>


