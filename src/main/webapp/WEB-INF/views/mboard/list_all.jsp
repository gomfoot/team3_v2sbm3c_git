<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>NENFLIX</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
</script>

</head>
<body style="background-color:#000000; color:white;">
 <jsp:include page="../menu/top.jsp" />


  <DIV class='menu_line'></DIV>
  
  <table class="table table-dark" style='width: 100%;'>
    <colgroup>
      <col style="width: 10%;"></col>
      <col style="width: 50%;"></col>
      <col style="width: 15%;"></col>
      <col style="width: 15%;"></col>
      <col style="width: 10%;"></col>
    </colgroup>
    
    <thread>
    <TR>
      <TH>게시판종류 </TH>
      <TH>제목 </TH>
      <TH>작성자 </TH>
      <TH>작성일 </TH>
      <TH>조회수 </TH>
    </TR>
    </thread>
    
    
    <tbody>
      <c:forEach var="mboardVO" items="${list }">
        <c:set var="mboardno" value="${mboardVO.mboardno }" />
        <c:set var="title" value="${mboardVO.title }" />
        <c:set var="rdate" value="${mboardVO.rdate }" />
        <c:set var="cnt" value="${mboardVO.cnt }" />
        <c:set var="mname" value="${mboardVO.mname }" />
        <c:set var="mtype" value="${mboardVO.mtype }" />
        <tr> 
          <td class="td_bs">${mtype }</td>
          <td class="td_bs"><A href="./mboard_read.do?mboardno=${mboardno }&now_page=${now_page }">${title }</A></td>
          <td class="td_bs">${mname }</td>
          <td class="td_bs">${rdate }</td>
          <td class="td_bs">${cnt }</td>
          </tr>
      </c:forEach>
      
    </tbody>
  </table>
<div style="margin:auto; width:3%;">
                <ASIDE>
                  <button type='button' onclick="location='/mboard/create.do?memberno=${memberno}'" class="btn btn-info">등록</button>
                </ASIDE> 
  </div>
  

  <DIV class='bottom_menu'>${paging }</DIV>
 
<jsp:include page="../menu/bottom.jsp" />
</body>
</html>