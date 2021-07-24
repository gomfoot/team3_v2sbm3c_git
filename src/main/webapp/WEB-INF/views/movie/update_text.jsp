<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="mtitle" value="${movieVO.mtitle }" />
<c:set var="mcontent" value="${movieVO.mcontent }" />
<c:set var="mtime" value="${movieVO.mtime }" />
<c:set var="director" value="${movieVO.director }" />
<c:set var="caster" value="${movieVO.caster }" />
<c:set var="viewclass" value="${movieVO.viewclass }" />
<c:set var="mdate" value="${movieVO.mdate }" />
<c:set var="movieno" value="${movieVO.movieno }" />
         
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
  <A href="./read.do?movieno=${movieVO.movieno }" class='title_link'>${movieVO.mtitle }</A>
  >영화 정보 수정
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do?mgenreno=${mgenreVO.mgenreno }">영화 등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>  
    <A href="./list_search_paging.do?mgenreno=${mgenreVO.mgenreno }&now_page=${param.now_page}&word=${param.word}">목록</A>    
    <span class='menu_divide' >│</span>
    <A href="./update_file.do?movieno=${movieno}&now_page=${param.now_page}">영화 파일 수정</A>  
    <span class='menu_divide' >│</span>
    <A href="./delete.do?movieno=${movieno}&now_page=${param.now_page}">삭제</A>  
  </ASIDE>
  
  <DIV class='menu_line'></DIV>
  
  <FORM name='frm' method='POST' action='./update_text.do' class="form-horizontal">
    <input type='hidden' name='movieno' value='${movieno }'>
    <input type="hidden" name="mgenreno" value="${mgenreVO.mgenreno }">
    <input type= "hidden"name = "now_page"value="${param.now_page }">
    
    <div class="form-group">
       <label class="control-label col-md-2">영화 제목</label>
       <div class="col-md-10">
         <input type='text' name='mtitle' value='${mtitle }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">영화 내용</label>
       <div class="col-md-10">
         <textarea name='mcontent' required="required" class="form-control" rows="20" style='width: 100%;'>${mcontent }</textarea>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">영화 시간</label>
       <div class="col-md-10">
         <input type='number' name='mtime' value='${mtime }' required="required" 
                    min="0" max="10000000" step="1" 
                    class="form-control" style='width: 50%;'>
       </div>
    </div>   
    <div class="form-group">
       <label class="control-label col-md-2">감독</label>
       <div class="col-md-10">
         <input type='text' name='director' value='${director }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>  
    <div class="form-group">
       <label class="control-label col-md-2">출연진</label>
       <div class="col-md-10">
         <input type='text' name='caster' value='${caster }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>  
    <div class="form-group">
       <label class="control-label col-md-2">관람등급</label>
       <div class="col-md-10">
          <select name='viewclass' class="form-control" style='width: 50%;'>
            <%-- <option value='n' ${ns == 'n' ? "selected='selected'":""}>n</option> --%>
            <option value='전체관람가' ${viewclass == '전체관람가' ? "selected='selected'":""}>전체관람가</option>
            <option value='12세관람가' ${viewclass == '12세관람가' ? "selected='selected'":""}>12세관람가</option>
            <option value='15세관람가' ${viewclass == '15세관람가' ? "selected='selected'":""}>15세관람가</option>
            <option value='19세관람가' ${viewclass == '19세관람가' ? "selected='selected'":""}>19세관람가</option>
          </select>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">출시년도</label>
       <div class="col-md-10">
         <input type='text' name='mdate' value='${mdate }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>  
    
    
    <div class="content_body_bottom" style="background-color:#000000; color:white;">
      <button type="submit" class="btn btn-primary">저장</button>
      <button type="button" onclick="history.back();" class="btn btn-primary">취소</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

