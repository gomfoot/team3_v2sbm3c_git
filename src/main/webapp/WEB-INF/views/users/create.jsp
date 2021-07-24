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

<script type="text/javascript">
$(function() { // 자동 실행
  // id가 'btn_checkID'인 태그를 찾아 'click' 이벤트 처리자(핸들러)로 checkID 함수를 등록
  // document.getElementById('btn_checkID').addEventListener('click', checkID); 동일
  $('#btn_check').on('click', checkmemberno);
  
});
function checkmemberno(){
  var frm = $('#frm'); // id가 frm인 태그 검색
  var memberno = $('#memberno', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
  var params = '';

  params = 'memberno='+memberno;

  $.ajax({
    url: './checkmemberno.do', // spring execute
    type: 'get', 
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,      // 데이터
    success: function(rdata){
      var msg="";
      
      if(rdata.cnt>0){
        msg="이미 결재 하셨습니다.";
        $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
        $('#modal_title').html('중복 결재'); // 제목 
        $('#modal_content').html(msg);  // 내용
        $('#modal_panel').modal(); 
        } else{
          $('#frm').submit();
          }
      },
      error: function(request, status, error) { // callback 함수
        console.log(error);
      }
    });
}
</script> 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body style="background-color:#000000; color:white;">
 <jsp:include page="../menu/top.jsp" flush='false' />
 
  <!-- ******************** Modal 알림창 시작 ******************** -->
   <div id="modal_panel" class="modal fade"  role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>

        <div class="modal-footer">
          <button type="button" id="btn_agree" data-focus="" class="btn btn-default" 
                      data-dismiss="modal">확인</button>
        </div>
      </div>
    </div>
  </div>
  <!-- ******************** Modal 알림창 종료 ******************** -->
 
 
 <DIV class='menu_line'></DIV>
  
  <FORM name='frm' id='frm' method='POST' action='./create.do' class="form-horizontal"
              enctype="multipart/form-data"style="margin-left:500px">
  <input type="hidden" id ="memberno"name="memberno" value="${sessionScope.memberno }"> 
       <label class="control-label col-md-2"style="margin-left:200px">금액 선택</label>
      <div class="form-group">
       <div class="col-md-10">
         <input type='radio' name='addday' id='addday' value=30 required="required"><label for="basic"><img src='/images/basic.png' style='width: 50%;'> 1개월</label>
         <input type='radio' name='addday' id='addday' value=185 required="required"><label for="nomal"><img src='/images/nomal.png' style='width: 50%;'> 6개월</label>
         <input type='radio' name='addday' id='addday' value=365 required="required"><label for="premium"><img src='/images/premium.png' style='width: 50%;'> 1년</label>
       </div>
    </div>
              
<br><br><br><br><br><br><br><br><br>
 
 <div class='menu_line'></div>
  <div style=" text-align: left;">
    <label style="cursor: pointer;"><input type="radio" name="paytype" id="paytype" value="신용 카드" checked="checked"> 신용 카드</label>&nbsp;&nbsp;
    <label style="cursor: pointer;"><input type="radio" name="paytype" id="paytype" value="모바일"> 모바일</label>&nbsp;&nbsp;
    <label style="cursor: pointer;"><input type="radio" name="paytype" id="paytype" value="포인트"> 포인트</label>&nbsp;&nbsp;
    <label style="cursor: pointer;"><input type="radio" name="paytype" id="paytype" value="계좌 이체"> 계좌 이체</label>&nbsp;&nbsp;
    <label style="cursor: pointer;"><input type="radio" name="paytype" id="paytype" value="직접 입금"> 직접 입금</label>&nbsp;&nbsp;
  </div>
  
  <button type='button' id='btn_check' style='font-size: 1.5em;'class="btn btn-info">결재하기</button>
     </FORM>
<jsp:include page="../menu/bottom.jsp" flush='false' />
              
</body>
</html>