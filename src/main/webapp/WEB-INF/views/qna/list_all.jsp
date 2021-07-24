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
      <col style="width: 20%;"></col>
      <col style="width: 50%;"></col>
      <col style="width: 20%;"></col>
      <col style="width: 10%;"></col>
    </colgroup>
    
    <thread>
    <TR>
     <TH>질문유형 </TH>
     <TH>제목 </TH>
     <th> 작성자 </th>
     <TH>작성일 </TH>
     
    </TR>
    </thread>
    
    
    <tbody>
      <c:forEach var="qnaVO" items="${list }">
        <c:set var="qnano" value="${qnaVO.qnano }" />
        <c:set var="title" value="${qnaVO.title }" />
        <c:set var="content" value="${qnaVO.content }" />
        <c:set var="rdate" value="${qnaVO.rdate }" />
        <c:set var="qtype" value="${qnaVO.qtype }" />
        <c:set var="memberno" value="${qnaVO.memberno }" />
        <c:set var="mname" value="${qnaVO.mname }"/>
        <tr> 
          <td class="td_bs">${qtype }</td>
          <td class="td_bs"><A href="./qna_read.do?qnano=${qnano }&now_page=${now_page }">${title }</A></td>
          <td class="td_bs">${mname }</td>
          <td class="td_bs">${rdate }</td>
          </tr>
      </c:forEach>
      
    </tbody>
  </table>
  
    <div style="margin:auto; width:3%;">
     <c:choose>
               <c:when test="${sessionScope.memberno != null}">
                <ASIDE>
                  <button type='button' onclick="location='/qna/create.do?memberno=${memberno}'" class="btn btn-info">등록</button>
                </ASIDE> 
                </c:when>
            </c:choose>

  </div>
  

  <DIV class='bottom_menu'>${paging }</DIV>
 
<jsp:include page="../menu/bottom.jsp" />
</body>
</html>