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
$(function() { // 자동 실행
 /* $('#btn_add').on('click', addanswer); */
  
});

/* function addanswer(qnano){
  var frm = $('#frm'); // id가 frm인 태그 검색
  var qnano = $('#qnano', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
  var adminno = $('#adminno', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
  var params = '';

  params = 'qnano='+qnano;
  params+='&adminno='+adminno;
  params+="&content="+content;
  
  
  $.ajax({
    url: '/admin/create.do', // spring execute
    type: 'post', 
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,      // 데이터
    success: function(rdata){
      
      if(rdata.cnt>0){
        console.log(error);
        }else{
          $("#frm").submit();
          }
    },
    error:function(request,status,error){
        console.log(error);
   }
    
});
     */
}

</script>
 
</head> 
 <body style="background-color:#000000; color:white;">
<jsp:include page="../menu/top.jsp" flush='false' />
      <c:forEach var="qnaVO" items="${list }">
        <c:set var="qnano" value="${qnaVO.qnano }" />
        <c:set var="title" value="${qnaVO.title }" />
        <c:set var="content" value="${qnaVO.content }" />
        <c:set var="rdate" value="${qnaVO.rdate }" />
        <c:set var="qtype" value="${qnaVO.qtype }" />
        <c:set var="memberno" value="${qnaVO.memberno }" />
        <br><br>
        </c:forEach>
 <DIV>
  <fieldset>
    <ul>
        <div style="font-size:2.5em "> ${qnaVO.title }</div>
        <p style="text-align:left;" >등록일&nbsp; &nbsp;${qnaVO.rdate }</p>
        <div style="font-size:1.2em ">질문종류 ->&nbsp; &nbsp;${qnaVO.qtype }</div>
        <hr align="center" style="border: solid 1.5px white;">
          <DIV style="width: 47%; height: 260px; float: left; margin-right: 10px;">
            <span style="font-size: 1.2em; font-weight: bold;">${qnaVO.content }</span><br>
          </DIV> 
    </ul>
  </fieldset>
</DIV>
<div style="margin:auto0; ">
            <c:choose>
               <c:when test="${sessionScope.memberno == qnaVO.memberno}">
                <ASIDE>
                  <button type='button' onclick="location='/qna/delete.do?qnano=${qnaVO.qnano }'" class="btn btn-info">삭제</button>
                </ASIDE> 
                </c:when>
            </c:choose>
  </div>
  -----------------------------------------------------------------
  
  <div>
  <c:forEach var="answerVO" items="${answer_list }">
        <c:set var="qnano" value="${answerVO.qnano }" />
        <c:set var="content" value="${answerVO.content }" />
        <c:set var="rdate" value="${answerVO.rdate }" />
        <c:set var="adminno" value="${answerVO.adminno }" />
        <li>
        <p>
        운영자<br />
        작성 날짜 : ${answerVO.rdate}<br />
        </p>
         <p>${answerVO.content}</p>
        </li>
         <c:choose>
               <c:when test="${sessionScope.grade =='admin'}">
                <ASIDE>
         <button type='button' onclick="location='/answer/delete.do?answerno=${answerVO.answerno }&qnano=${answerVO.qnano}'" class="btn btn-info">삭제</button>
           </ASIDE> 
                </c:when>
            </c:choose>
          </c:forEach>
          
            <c:choose>
               <c:when test="${sessionScope.grade =='admin'}">
                <ASIDE>
                        <FORM name='frm' id='frm' method='POST' action='/answer/create.do'>
                            <input type='hidden' name='qnano' id='qnano' value='${qnaVO.qnano }'>
                            <input type='hidden' name='adminno' id='adminno' value='${adminno }'>           
                            <label>답변</label>
                           <input type='text' name='content' id='content' value='${answerVO.content }' required="required" style='width: 25%;'
                              autofocus="autofocus"><br>
                            <button type="submit()" >등록</button>
                           
                            </div>  
                         </FORM>
                </ASIDE> 
                </c:when>
            </c:choose>

 </div>
    
  
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

