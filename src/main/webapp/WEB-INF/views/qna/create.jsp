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

<script type="text/javascript" src="/ckeditor/ckeditor.js"></script> <!-- /static 기준 -->

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
  // window.onload=function(){
  //  CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  // };
  

  $(function(){
 
  });

  
</script>
 
</head> 
 
<body style="background-color:#000000; color:white;">
<jsp:include page="../menu/top.jsp" flush='false' />
  
  
  <DIV class='menu_line'></DIV>
  
  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal"
              enctype="multipart/form-data">
    <input type="hidden" name="memberno" value="${sessionScope.memberno }"> 
        
    <div class="form-group">
       <label class="control-label col-md-2">제목</label>
       <div class="col-md-10">
         <input type='text' name='title' value='' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">내용</label>
       <div class="col-md-10">
         <textarea name='content' id='content' required="required" class="form-control" rows="12" style='width: 100%;'></textarea>
       </div>
    </div>
    
    <div class="form-group">
       <label class="control-label col-md-2">질문유형</label>
       <div class="col-md-10">
         <select name="qtype" id="qtype" required="required" style='width: 100%;'>
            <option value="">유형선택</option>
            <option value="서버관련">서버관련</option>
            <option value="환불관련">환불관련</option>
            <option value="서비스관련">서비스관련</option>
            <option value="기타">기타</option>
         </select>
       </div>
    </div>
  
    <div >
      <button type="submit" class="btn btn-primary">등록</button>
      <button type="button" onclick="location.href='./list_all.do'" class="btn btn-primary">목록</button>
    </div>
  
  </FORM>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

