<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="movieno" value="${movieVO.movieno }" />
<c:set var="mtitle" value="${movieVO.mtitle }" />
 
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
  $(function(){
 
  });
</script>
 
</head> 
 
<body style="background-color:#000000; color:white;">
<jsp:include page="../menu/top.jsp" flush='false' />
 
<DIV class='title_line'>
  <A href="../mgenre/list.do" class='title_link'>영화 장르</A> >
  <A href="../movie/list_search_paging.do?mgenreno=${mgenreVO.mgenreno }" class='title_link'>${mgenreVO.mgenrename }</A> >  
  <A href="./read.do?movieno=${movieVO.movieno }" class='title_link'>${movieVO.mtitle }</A> > 삭제
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do?mgenreno=${mgenreVO.mgenreno }">영화 등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>  
    <A href="./list_search_paging.do?mgenreno=${mgenreVO.mgenreno }&now_page=${param.now_page}&word=${param.word}">목록</A>    
    <span class='menu_divide' >│</span>
    <A href="./update_text.do?movieno=${movieno}&now_page=${param.now_page}">영화 정보 수정</A>
    <span class='menu_divide' >│</span>
    <A href="./update_file.do?movieno=${movieno}&now_page=${param.now_page}">영화 파일 수정</A>  
    <span class='menu_divide' >│</span>
  </ASIDE> 
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style='text-align: center; width: 50%; float: left;'>
          <c:set var="imgfile1" value="${movieVO.imgfile1.toLowerCase() }" />
          <c:set var="imgthumb1" value="${movieVO.imgthumb1 }" />
          <c:set var="videofile1" value="${movieVO.videofile1.toLowerCase() }" />
          <c:choose>
            <c:when test="${imgthumb1.endsWith('jpg') || imgthumb1.endsWith('png') || imgthumb1.endsWith('gif')}">
              <IMG src="/movie/img_storage/${imgfile1 }" style='width: 70%;'> 
            </c:when>
            
            <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
              첨부 이미지 파일: ${imgfile1}
            </c:otherwise>
          </c:choose>
          <br>첨부 영상 파일: ${videofile1}
          
        </DIV>

        <DIV style='text-align: left; width: 47%; float: left;'>
          <span style='font-size: 1.5em;'>${mtitle}</span>
          <br>
           <FORM name='frm' method='POST' action='./delete.do'>
      <input type='hidden' name='movieno' value='${param.movieno}'>
      <input type='hidden' name='now_page' value='${param.now_page}'>
      <input type='hidden' name='mgenreno' value='${mgenreVO.mgenreno}'>
      
      <DIV id='panel1' style="width: 40%; text-align: center; margin: 10px auto;"></DIV>
            
      <div class="form-group">   
        <div class="col-md-12" style='text-align: center; margin: 10px auto;'>
          삭제 되는 영화: ${movieVO.mtitle }<br><br>
          삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.<br><br>
          

          
          <button type = "submit" class="btn btn-info">삭제 진행</button>
          <button type = "button" onclick = "history.back()" class="btn btn-info">취소</button>
        </div>
      </div>   
  </FORM>
        </DIV>
      </li>
      <li class="li_none">

      </li>   
    </ul>
  </fieldset>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

