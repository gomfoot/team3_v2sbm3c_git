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
 
<DIV class='title_line'>
  <A href="../mgenre/list.do" class='title_link'>영화 장르</A> > 
  <A href="./list_search_paging.do?mgenreno=${mgenreVO.mgenreno }" class='title_link'>${mgenreVO.mgenrename }</A>
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <c:choose>
        <c:when test="${sessionScope.grade =='admin'}">
            <A href="./create.do?mgenreno=${mgenreVO.mgenreno }">영화 등록</A>      
        </c:when>
    </c:choose> 
    
    <span class='menu_divide' >│</span>
      <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    
  </ASIDE> 

<DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_search_paging.do'>
      <input type='hidden' name='mgenreno' value='${mgenreVO.mgenreno }'>
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_search_paging.do?mgenreno=${mgenreVO.mgenreno}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>

  <DIV class='menu_line'></DIV>
  
  <div style='width: 100%;'> <%-- 갤러리 Layout 시작 --%>
    <c:forEach var="movieVO" items="${list }" varStatus="status">
      <c:set var="movieno" value="${movieVO.movieno }" />
      <c:set var="mtitle" value="${movieVO.mtitle }" />
      <c:set var="mcontent" value="${movieVO.mcontent }" />
      <c:set var="imgfile1" value="${movieVO.imgfile1 }" />
      <c:set var="imgsize1" value="${movieVO.imgsize1 }" />
      <c:set var="imgthumb1" value="${movieVO.imgthumb1 }" />

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
                <a href="./read.do?movieno=${movieno}&now_page=${now_page}">               
                  <IMG src="./img_storage/${imgthumb1 }" style='width: 100%; height: 150px;'>
                </a><br>
                ${mtitle}
              </c:when>
              <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                <DIV style='width: 100%; height: 150px; display: table; border: solid 1px #CCCCCC;'>
                  <DIV style='display: table-cell; vertical-align: middle; text-align: center;'> <!-- 수직 가운데 정렬 -->
                    <a href="./read.do?movieno=${movieno}&now_page=${now_page}">${imgfile1}</a><br>
                  </DIV>
                </DIV>
                ${mtitle}              
              </c:otherwise>
            </c:choose>
          </c:when>
          <c:otherwise> <%-- 파일이 없는 경우 기본 이미지 출력 --%>
            <a href="./read.do?movieno=${movieno}&now_page=${now_page}">
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

