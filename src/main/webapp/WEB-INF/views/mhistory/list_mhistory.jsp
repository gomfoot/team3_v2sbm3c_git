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

<style type="text/css">

</style>
</head> 
 
<body style="background-color:#000000; color:white;">
<jsp:include page="../menu/top.jsp" />

<DIV class='title_line'>
  시청 기록
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 

  <DIV class='menu_line'></DIV>
  
  <div style='width: 100%;'> <%-- 갤러리 Layout 시작 --%>
    <c:forEach var="mhistoryVO" items="${list }" varStatus="status">
            <c:set var="mhistoryno" value="${mhistoryVO.mhistoryno }" />
            <c:set var="movieno" value="${mhistoryVO.movieno }" />
            <c:set var="mtitle" value="${mhistoryVO.mtitle }" />
            <c:set var="imgthumb1" value="${mhistoryVO.imgthumb1 }" />
            <c:set var="imgsize1" value="${mhistoryVO.imgsize1 }" />
            <c:set var="memberno" value="${mhistoryVO.memberno }" />
            
      <%-- 하나의 행에 이미지를 4개씩 출력후 행 변경 --%>
      <c:if test="${status.index % 4 == 0 && status.index != 0 }"> 
        <HR class='menu_line'>
      </c:if>
      
      <!-- 하나의 이미지, 24 * 4 = 96% -->
      <DIV style='width: 24%; 
              float: left; 
              margin: 0.5%; padding: 0.5%; background-color:#000000; text-align: center;'>
        <c:choose>
          <c:when test="${imgsize1 > 0}"> <!-- 파일이 존재하면 -->
            <c:choose> 
              <c:when test="${imgthumb1.endsWith('jpg') || imgthumb1.endsWith('png') || imgthumb1.endsWith('gif')}"> <!-- 이미지 인경우 -->
                <a href="/movie/read.do?movieno=${movieno}&now_page=1">               
                  <IMG src="/movie/img_storage/${imgthumb1 }" style='width: 100%; height: 150px;'>
                </a><br>
                ${mtitle}
              </c:when>
              <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                <DIV style='width: 100%; height: 150px; display: table; border: solid 1px #CCCCCC;'>
                  <DIV style='display: table-cell; vertical-align: middle; text-align: center;'> <!-- 수직 가운데 정렬 -->
                    <a href="/movie/read.do?movieno=${movieno}&now_page=1">${imgfile1}</a><br>
                  </DIV>
                </DIV>
                ${mtitle}            
              </c:otherwise>
            </c:choose>
          </c:when>
          <c:otherwise> <%-- 파일이 없는 경우 기본 이미지 출력 --%>
            <a href="/movie/read.do?movieno=${movieno}&now_page=1">
              <img src='/movie/images/none1.png' style='width: 100%; height: 150px;'>
            </a><br>
            이미지를 등록해주세요.
          </c:otherwise>
        </c:choose>         
      </DIV>  
    </c:forEach>
    <!-- 갤러리 Layout 종료 -->
    <br><br>
  </div>
  <DIV class='bottom_menu'>${paging }</DIV>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>

