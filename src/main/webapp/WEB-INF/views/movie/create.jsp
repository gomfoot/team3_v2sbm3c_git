<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
  영화 등록
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do?mgenreno=${mgenreVO.mgenreno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
  </ASIDE> 
  
    <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_cateno_search.do'>
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
                     onclick="location.href='./list_search_grid.do?mgenreno=${mgenreVO.mgenreno}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  
  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal"
              enctype="multipart/form-data"> 
    <input type="hidden" name="mgenreno" value="${param.mgenreno }">
    
    <div class="form-group">
       <label class="control-label col-md-2">영화 제목</label>
       <div class="col-md-10">
         <input type='text' name='mtitle' value='' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">영화 내용</label>
       <div class="col-md-10">
         <textarea name='mcontent' required="required" class="form-control" rows="12" style='width: 100%;'>?</textarea>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">영화 시간</label>
       <div class="col-md-10">
         <input type='number' name='mtime' value='' required="required" 
                    min="0" max="99999" step="1" class="form-control" style='width: 100%;'>
       </div>
    </div>
      
    <div class="form-group">
       <label class="control-label col-md-2">감독</label>
       <div class="col-md-10">
         <input type='text' name='director' value='' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>  
     <div class="form-group">
       <label class="control-label col-md-2">출연진</label>
       <div class="col-md-10">
         <input type='text' name='caster' value='' required="required" 
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
         <input type='text' name='mdate' value='' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>  
    <div class="form-group">
       <label class="control-label col-md-2">이미지</label>
       <div class="col-md-10">
         <input type='file' class="form-control" name='file1MF' id='file1MF' 
                    value='' placeholder="파일 선택">
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">영상</label>
       <div class="col-md-10">
         <input type='file' class="form-control" name='file2MF' id='file2MF' 
                    value='' placeholder="파일 선택">
       </div>
    </div>   
    
    <div class="content_body_bottom" style="background-color:#000000; color:white;" >
      <button type="submit" class="btn btn-primary">등록</button>
      <button type='button' onclick="history.back();" class="btn btn-primary">취소</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>