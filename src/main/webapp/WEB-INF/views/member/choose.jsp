<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>NENFLIX</title>

 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body style="background-color:#000000;">
 <jsp:include page="../menu/top.jsp" flush='false' />
 
 <DIV class='menu_line'></DIV>
 
  <label style= "color:white; font-size:1.5em; text-align: center; width:100%; margin-top:100px;" class="control-label col-md-2">원하는 작업을 선택하시오.</label><br>
  <FORM name='frm' id='frm' method='POST' action='./choose.do' class="form-horizontal"
              enctype="multipart/form-data" style="display:inline-block; margin-top:150px; margin-left:400px ">
  <input type="hidden" id ="memberno"name="memberno" value="${sessionScope.memberno }"> 
     <span >
    <div style="margin-left:100px"> 
        <img src="/images/member_list.png"></button>&nbsp;&nbsp;&nbsp;&nbsp;
         <img src="/images/pay_2.png"></button>&nbsp;&nbsp;&nbsp;&nbsp;
         <img src="/images/history.png"></button>&nbsp;&nbsp;&nbsp;&nbsp;
    </div><br>
    <div style="margin-left:170px">
  <button type="button" onclick="location='/member/read.do?memberno=${sessionScope.memberno }'"style="WIDTH: 90pt; HEIGHT: 60pt; font-size:15px"  class="btn btn-primary" >회원 정보<br>수정/탈퇴</button>
   <button type="button" onclick="location='/users/create.do'" style="margin-left:160px; WIDTH: 80pt; HEIGHT: 60pt; font-size:15px" class="btn btn-primary">결제</button>
    <button type="button" onclick="location='/mhistory/list_mhistory.do'"  style="margin-left:180px; WIDTH: 80pt; HEIGHT: 60pt; font-size:15px" class="btn btn-primary">시청기록</button>
      </div>
       </span>
</FORM>

</body style="background-color:#000000;">
</html>