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

<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
</script>
 
</head> 
 
<body style="background-color:#000000; color:white;">
<jsp:include page="../menu/top.jsp" flush='false' />
        <c:set var="noticeno" value="${noticeVO.noticeno }" />
        <c:set var="title" value="${noticeVO.title }" />
        <c:set var="ncontent" value="${noticeVO.ncontent }" />
        <c:set var="name" value="${noticeVO.name }" />
        <c:set var="rdate" value="${noticeVO.rdate}" />
        <c:set var="file1saved" value="${noticeVO.file1saved.toLowerCase() }" />
        <br><br>
 <DIV>
  <fieldset class="fieldset_basic">
    <ul>
        <div style="font-size:2.5em ">${noticeno }. ${title }</div>
        <p style="text-align:left;" >${name}&nbsp; &nbsp;${rdate }</p>
        
        <hr align="center" style="border: solid 1.5px white;">
          <DIV style="width: 47%; height: 260px; float: left; margin-right: 10px;">
            <span style="font-size: 1.2em; font-weight: bold;">${ncontent }</span><br>
          </DIV> 
    </ul>
  </fieldset>
</DIV>

<div style="margin:auto; width:1%;">
            <c:choose>
              <c:when test="${sessionScope.grade =='admin'}">
                <ASIDE class="aside_right">
                  <button type='button' onclick="location='/notice/delete.do?noticeno=${noticeno}'" class="btn btn-info">삭제</button>
                </ASIDE> 
              </c:when>
           </c:choose> 
  </div>
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

