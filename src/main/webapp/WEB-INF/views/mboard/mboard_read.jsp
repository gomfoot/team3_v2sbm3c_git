<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>NENFLIX</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">



</script>
 
</head> 
 
<jsp:include page="../menu/top.jsp" flush='false' />
      <c:forEach var="mboardVO" items="${list }">
        <c:set var="mboardno" value="${mboardVO.mboardno }" />
        <c:set var="memberno" value="${mboardVO.memberno }" />
        <c:set var="title" value="${mboardVO.title }" />
        <c:set var="content" value="${mboardVO.content }" />
        <c:set var="rdate" value="${mboardVO.rdate}" />
        <c:set var="cnt" value="${mboardVO.cnt }" />
        <br><br>
        </c:forEach>
 <DIV>
  <fieldset class="fieldset_basic">
    <ul>
        <div style="font-size:2.5em "> ${mboardVO.title }</div>
        <p style="text-align:left;" >등록일&nbsp; &nbsp;${mboardVO.rdate }</p>
        
        <hr align="center" style="border: solid 1.5px white;">
          <DIV style="width: 47%; height: 260px; float: left; margin-right: 10px;">
            <span style="font-size: 1.2em; font-weight: bold;">${mboardVO.content }</span><br>
          </DIV> 
    </ul>
  </fieldset>
</DIV>
<div style="margin:auto0; ">
            <c:choose>
               <c:when test="${sessionScope.memberno == mboardVO.memberno}">
                <ASIDE class="aside_right">
                  <button type='button' onclick="location='/mboard/delete.do?mboardno=${mboardVO.mboardno }'" class="btn btn-info">삭제</button>
                  <button type='button' onclick="location='/mboard/update.do?mboardno=${mboardVO.mboardno}'" class="btn btn-info">수정</button>
                </ASIDE> 
                </c:when>
            </c:choose>
  </div>
--------------------댓글---------------------------------------
  <div>
    <c:forEach var="mboard_replyVO" items="${reply_list }">
        <c:set var="replyno" value="${mboard_replyVO.replyno }" />
        <c:set var="mboardno" value="${mboard_replyVO.mboardno }" />
        <c:set var="memberno" value="${mboard_replyVO.memberno }" />
        <c:set var="content" value="${mboard_replyVO.content }" />
        <c:set var="rdate" value="${mboard_replyVO.rdate }" />
      <li>
        <p>
        회원ID : ${memberVO.id}<br />
        작성 날짜 : ${mboard_replyVO.rdate}<br />
        </p>
        <p>${mboard_replyVO.content}</p>
      </li>
      <c:choose>
               <c:when test="${sessionScope.memberno == memberno}">
                <ASIDE class="aside_right">
                  <button type='button' onclick="location='/mboard_reply/delete.do?replyno=${mboard_replyVO.replyno }&mboardno=${mboardVO.mboardno}'" class="btn btn-info">삭제</button>
                </ASIDE> 
                </c:when>
            </c:choose>
    </c:forEach>   
    
</div>


<DIV class='content_body'>
  <!-- 신규 등록 -->
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: left;'>
    <FORM name='reply_create' id='reply_create' method='POST' action='/mboard_reply/create.do'>
      <input type='hidden' name='mboardno' id='mboardno' value='${mboardVO.mboardno}'>
      <input type='hidden' name='memberno' id='memberno' value='${sessionScope.memberno}'>
      <label>댓글</label>
      <input type='text' name='content' id='content' value='${mboard_replyVO.content }' required="required" style='width: 25%;'
                 autofocus="autofocus"><br>
      <button type="submit" id='submit'>등록</button>
      
    </FORM>
    
  </DIV>
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

