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
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	  $(function() { // 자동 실행
		    $('#admin_send').on('click', admin_send); 
		    $('#member_send').on('click', member_send);
		  });




    function member_send() {
          var frm = $('#frm');  // id가 frm인 태그 검색
          var id = $('#id',frm).val(); // frm 폼에서 id가 'id'인 태그 검색
          var passwd=$('#passwd',frm).val();
          var params = '';
          var msg = '';

          if ($.trim(id).length == 0) { // id를 입력받지 않은 경우
            msg = '· ID를 입력하세요.';
            
            $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
            $('#modal_title').html('ID 확인'); // 제목 
            $('#modal_content').html(msg);        // 내용
            $('#btn_close').attr("data-focus", "id");  // 닫기 버튼 클릭시 id 입력으로 focus 이동
            $('#modal_panel').modal();               // 다이얼로그 출력
            return false;
          } else {  // when ID is entered
            params = 'id=' + id;
            params+='&passwd='+passwd;
            // var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
            // alert('params: ' + params);

            $.ajax({
              url: './membercheck.do', // spring execute
              type: 'get',  // post
              cache: false, // 응답 결과 임시 저장 취소
              async: true,  // true: 비동기 통신
              dataType: 'json', // 응답 형식: json, html, xml...
              data: params,      // 데이터
              success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
                // alert(rdata);
                var msg = "";
                
                if (rdata.cnt>0) {
                  $('#frm').submit();
                } else {
                  $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
                  msg = "정보를 잘못 입력하셨습니다.";
                  $('#btn_close').attr("data-focus", "id");  // passwd 입력으로 focus 이동
                  // $.cookie('checkId', 'TRUE'); // Cookie 기록
                }
                
                $('#modal_title').html('정보  확인'); // 제목 
                $('#modal_content').html(msg);        // 내용
                $('#modal_panel').modal();              // 다이얼로그 출력
              },
              // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
              error: function(request, status, error) { // callback 함수
                console.log(error);
              }
            });
        }
      }





		    
	  function admin_send() {
        var frm = $('#frm');  // id가 frm인 태그 검색
        var id = $('#id',frm).val(); // frm 폼에서 id가 'id'인 태그 검색
        var passwd=$('#passwd',frm).val();
        var params = '';
        var msg = '';

        if ($.trim(id).length == 0) { // id를 입력받지 않은 경우
          msg = '· ID를 입력하세요.';
          
          $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
          $('#modal_title').html('ID 확인'); // 제목 
          $('#modal_content').html(msg);        // 내용
          $('#btn_close').attr("data-focus", "id");  // 닫기 버튼 클릭시 id 입력으로 focus 이동
          $('#modal_panel').modal();               // 다이얼로그 출력
          return false;
        } else {  // when ID is entered
          params = 'id=' + id;
          params+='&passwd='+passwd;
          // var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
          // alert('params: ' + params);

          $.ajax({
            url: './admincheck.do', // spring execute
            type: 'get',  // post
            cache: false, // 응답 결과 임시 저장 취소
            async: true,  // true: 비동기 통신
            dataType: 'json', // 응답 형식: json, html, xml...
            data: params,      // 데이터
            success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
              // alert(rdata);
              var msg = "";
              
              if (rdata.cnt>0) {
            	  $("#frm").attr("action", "/member/admin_login.do");
                $('#frm').submit();
            	  //frm.action='/member/admin_login.do';
                //frm.submit();
              } else {
                $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
                msg = "관리자가 아닙니다.";
                msg+=id+"  "+passwd;
                $('#btn_close').attr("data-focus", "id");  // passwd 입력으로 focus 이동
                // $.cookie('checkId', 'TRUE'); // Cookie 기록
              }
              
              $('#modal_title').html('ID  확인'); // 제목 
              $('#modal_content').html(msg);        // 내용
              $('#modal_panel').modal();              // 다이얼로그 출력
            },
            // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
            error: function(request, status, error) { // callback 함수
              console.log(error);
            }
          });
		  }
	  }
</script> 

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
          <button type="button" id="btn_close" data-focus="" class="btn btn-default" 
                      data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
  <!-- ******************** Modal 알림창 종료 ******************** -->
<DIV class='content_body'>  
  <DIV style='width: 80%; margin: 0px auto;'>
    <FORM name='frm' id='frm' method='POST' action='/member/login.do' class="form-horizontal">
      <%-- 로그인 후 자동으로 이동할 페이지 전달 ★ --%>
      <input type="hidden" name="return_url" value="${return_url}">
    
      <div class="form-group">
        <label for="id" class="col-md-4 control-label" style='font-size: 0.8em;'>아이디</label>    
        <div class="col-md-8">
          <input type='text' class="form-control" name='id' id='id'  value='${ck_id }' required="required" style='width: 30%;' placeholder="아이디" autofocus="autofocus">
          <Label>   
            <input type='checkbox' name='id_save' value='Y' 
                      ${ck_id_save == 'Y' ? "checked='checked'" : "" }> 저장
          </Label>                   
        </div>
   
      </div>   
   
      <div class="form-group">
        <label for="passwd" class="col-md-4 control-label" style='font-size: 0.8em;'>패스워드</label>    
        <div class="col-md-8">
          <input type='password' class="form-control" name='passwd' id='passwd' value='${ck_passwd }' required="required" style='width: 30%;' placeholder="패스워드">
          <Label>
            <input type='checkbox' name='passwd_save' value='Y' 
                      ${ck_passwd_save == 'Y' ? "checked='checked'" : "" }> 저장
          </Label>
        </div>
      </div>   
   
      <div class="form-group">
        <div class="col-md-offset-4 col-md-8">
          <button type="button" id='member_send' class="btn btn-primary btn-md">로그인</button>
          <button type='button' onclick="location.href='./create.do'" class="btn btn-primary btn-md">회원가입</button>
          <button type='button' id='admin_send' class="btn btn-primary btn-md">관리자 로그인</button>
        </div>
      </div>   
      
    </FORM>
  </DIV>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>


