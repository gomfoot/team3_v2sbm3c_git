<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>NENFLIX</title>
 
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
 
<script type="text/javascript">
  $(function(){
	  $('input:radio[name=genre1]:input[value="${memberVO.genre1}"]').attr("checked", true);
	  $('input:radio[name=genre2]:input[value="${memberVO.genre2}"]').attr("checked", true);
	  $('#btn_update').on('click', update); 
	  $('#btn_delete').on('click', member_delete); 
	  $('#btn_agree').on('click', agree); 
  });

  function update() { // 회원 update 처리
	    var frm = $('#frm');  // id가 frm인 태그 검색
      var passwd=$('#passwd',frm).val();
      var mname=$('#mname',frm).val();
      var tel=$('#tel',frm).val();
      var zipcode=$('#zipcode',frm).val();
      var address1=$('#address1',frm).val();
      var address2=$('#address2',frm).val();
	    var genre1 = $('input:radio[name="genre1"]:checked').val();
	    var genre2 = $('input:radio[name="genre2"]:checked').val();
      if($.trim(passwd).length == 0||$.trim(mname).length == 0||$.trim(tel).length == 0||$.trim(zipcode).length == 0||$.trim(address1).length == 0||$.trim(address2).length == 0){
    	    msg = '입력 안하신 정보가 존재합니다.<br>';
          msg+='전부 입력해주세요<br>';
          $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
          $('#modal_title').html('정보 부재'); // 제목 
          $('#modal_content').html(msg);  // 내용
          $('#modal_panel').modal();         // 다이얼로그 출력
          return false;
          }
      
      else if(genre1==genre2){
	        msg = '입력된 장르가 같습니다.<br>';
	        msg+='다르게 선택해 주세요<br>';
	        msg+=$('#genre1').val();
	        msg+= $('#genre2').val();
	        $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
	        $('#modal_title').html('장르 일치 확인'); // 제목 
	        $('#modal_content').html(msg);  // 내용
	        $('#modal_panel').modal();         // 다이얼로그 출력
	        return false;
	        
	    }else{
	    $('#frm').submit();
      }
	  }
  function member_delete() { // 회원 update 처리
	  
	    msg = '회원 정보를 삭제합니다.<br>';
      msg+='정말 삭제 하시겠습니까?<br>';
      $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
      $('#modal_title').html('정보 부재'); // 제목 
      $('#modal_content').html(msg);  // 내용
      $('#modal_panel').modal();         // 다이얼로그 출력
      return false;
      

    }
  function agree() { // 회원 update 처리
	    $("#frm").attr("action", "/member/delete.do");
      $('#frm').submit();
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
          <button type="button" id="btn_agree" data-focus="" class="btn btn-default" 
                      data-dismiss="modal">확인</button>
          <button type="button" id="btn_close" data-focus="" class="btn btn-default" 
                      data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
  <!-- ******************** Modal 알림창 종료 ******************** -->
    
  <FORM name='frm' id='frm' method='POST' action='./update.do' class="form-horizontal">
    <input type='hidden' name='memberno' id='memberno' value='${memberVO.memberno }'>          
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'></label>    
      <div class="col-md-10"> 
      </div>
    </div>  
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>아이디</label>    
      <div class="col-md-10">
        ${memberVO.id } (변경 불가능 합니다.)       
      </div>
    </div>           
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>비밀번호*</label>    
      <div class="col-md-10">
        <input type='password' class="form-control" name='passwd' id='passwd' 
                   value=''required="required" autofocus="autofocus" style='width: 30%;' placeholder="비밀번호">
      </div>
    </div>     
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>성명*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='mname' id='mname' 
                   value='${memberVO.mname }' required="required" style='width: 30%;' placeholder="성명">
      </div>
    </div>   
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>전화번호*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='tel' id='tel' 
                   value='${memberVO.tel }' required="required" style='width: 30%;' placeholder="전화번호"> 예) 010-0000-0000
      </div>
    </div>   
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>우편번호*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='zipcode' id='zipcode' 
                   value='${memberVO.zipcode }' required="required" style='width: 30%;' placeholder="우편번호">
        <input type="button" onclick="DaumPostcode()" value="우편번호 찾기" class="btn btn-info btn-md">
      </div>
    </div>  
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>주소*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='address1' id='address1' 
                   value='${memberVO.address1 }' required="required" style='width: 80%;' placeholder="주소">
      </div>
    </div>   
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>상세 주소*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='address2' id='address2' 
                   value='${memberVO.address2 }' required="required" style='width: 80%;' placeholder="상세 주소">
      </div>
    </div>   
    
    <label for="genre1" class="col-md-2 control-label" style='font-size: 0.9em;'>관심 장르 1*</label>    
      <div class="col-md-10">
        <label style="cursor: pointer;"><input type="radio" name="genre1" id="genre1" value="액션" > 액션</label>&nbsp;&nbsp;
        <label style="cursor: pointer;"><input type="radio" name="genre1" id="genre1" value="코미디"> 코미디</label>&nbsp;&nbsp;
        <label style="cursor: pointer;"><input type="radio" name="genre1" id="genre1" value="로맨스"> 로맨스</label>&nbsp;&nbsp;
        <label style="cursor: pointer;"><input type="radio" name="genre1" id="genre1" value="호러"> 호러</label>&nbsp;&nbsp;
        <label style="cursor: pointer;"><input type="radio" name="genre1" id="genre1" value="sf판타지"> sf판타지</label>&nbsp;&nbsp;
      </div>

      <label for="genre2" class="col-md-2 control-label" style='font-size: 0.9em;'>관심 장르 2*</label>    
      <div class="col-md-10">
        <label style="cursor: pointer;"><input type="radio" name="genre2" id="genre2" value="액션" > 액션</label>&nbsp;&nbsp;
        <label style="cursor: pointer;"><input type="radio" name="genre2" id="genre2" value="코미디"> 코미디</label>&nbsp;&nbsp;
        <label style="cursor: pointer;"><input type="radio" name="genre2" id="genre2" value="로맨스"> 로맨스</label>&nbsp;&nbsp;
        <label style="cursor: pointer;"><input type="radio" name="genre2" id="genre2" value="호러"> 호러</label>&nbsp;&nbsp;
        <label style="cursor: pointer;"><input type="radio" name="genre2" id="genre2" value="sf판타지"> sf판타지</label>&nbsp;&nbsp;
      </div>
 
    <div class="form-group">
      <div class="col-md-12">
 
<!-- ----- DAUM 우편번호 API 시작 ----- -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>
 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');
 
    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }
 
    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
 
                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;
 
                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';
 
                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#address2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);
 
        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
<!-- ----- DAUM 우편번호 API 종료----- -->
 
      </div>
    </div>
    
    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="button" id='btn_update'  class="btn btn-primary btn-md">저장</button>
        <button type="button" onclick="history.go(-1);" class="btn btn-primary btn-md">취소</button>
        <button type="button" id='btn_delete'  class="btn btn-primary btn-md">탈퇴</button>
 
      </div>
    </div>   
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

