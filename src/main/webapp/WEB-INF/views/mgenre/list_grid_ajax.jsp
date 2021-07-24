<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
  $(function() {
    $('#btn_update_cancel').on('click', cancel);
    $('#btn_delete_cancel').on('click', cancel);
  });

  function cancel() {
    $('#panel_create').css("display","");  
    $('#panel_update').css("display","none"); 
    $('#panel_delete').css("display","none");
  }


  
  // 수정폼
 function read_update_ajax(mgenreno) {
    $('#panel_create').css("display","none"); // hide, 태그를 숨김 
    $('#panel_delete').css("display","none"); // hide, 태그를 숨김
    $('#panel_update').css("display",""); // show, 숨겨진 태그 출력 

    //console.log('-> rdata: '+ rdata.mgenreVO);
    console.log('-> mgenreno:' + mgenreno);
    console.log('-> mgenrename:' + mgenrename);
    var params = "";
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params = 'mgenreno=' + mgenreno; // 공백이 값으로 있으면 안됨.

    $.ajax(
      {
        url: '/mgenre/read_ajax.do',
        type: 'get',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우, Spring에서 하나의 객체를 전달한 경우 통문자열
          // {"mgenreno":1,"mgenrename":"액션"}
          
          
          var mgenreno = rdata.mgenreno;
          var mgenrename = rdata.mgenrename;

          var frm_update = $('#frm_update');
          $('#mgenreno', frm_update).val(mgenreno);
          $('#mgenrename', frm_update).val(mgenrename);
          
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

    // $('#span_animation').css('text-align', 'center');
    // $('#span_animation').html("<img src='/contents/images/ani04.gif' style='width: 8%;'>");
    // $('#span_animation').show(); // 숨겨진 태그의 출력
  } 

  // 삭제 폼(자식 레코드가 없는 경우의 삭제)
  function read_delete_ajax(mgenreno) {
    $('#panel_create').css("display","none"); // hide, 태그를 숨김
    $('#panel_update').css("display","none"); // hide, 태그를 숨김  
    $('#panel_delete').css("display",""); // show, 숨겨진 태그 출력 
    // return;
    
    // console.log('-> mgenreno:' + mgenreno);
    var params = "";
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params = 'mgenreno=' + mgenreno; // 공백이 값으로 있으면 안됨.
    
    $.ajax(
      {
        url: '/mgenre/read_ajax.do',
        type: 'get',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우, Spring에서 하나의 객체를 전달한 경우 통문자열
       // {"mgenreno":1,"mgenrename":"액션"}
          var mgenreno = rdata.mgenreno;
          var mgenrename = rdata.mgenrename;
          var count_by_mgenreno = parseInt(rdata.count_by_mgenreno);
          console.log('count_by_mgenreno: ' + count_by_mgenreno);

          var frm_delete = $('#frm_delete');
          $('#mgenreno', frm_delete).val(mgenreno);
          
          $('#frm_delete_mgenrename').html(mgenrename);
          
          if (count_by_mgenreno > 0) { // 자식 레코드가 있다면
            $('#frm_delete_count_by_mgenreno_panel').html('관련자료 ' + count_by_mgenreno + ' 건');
            $('#frm_delete_count_by_mgenreno').show();

            // alert($('#a_list_by_mgenreno').attr('href')); // ../mgenre/list_by_mgenreno.do?mgenreno=
            $('#a_list_by_mgenreno').attr('href', '../movie/list_search_paging.do?mgenreno=' + mgenreno);
            
          } else {
            $('#frm_delete_count_by_mgenreno').hide();
          }
          // console.log('-> btn_recom: ' + $('#btn_recom').val());  // X
          // console.log('-> btn_recom: ' + $('#btn_recom').html());
          // $('#btn_recom').html('♥('+rdata.recom+')');
          // $('#span_animation').hide();
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

    // $('#span_animation').css('text-align', 'center');
    // $('#span_animation').html("<img src='/contents/images/ani04.gif' style='width: 8%;'>");
    // $('#span_animation').show(); // 숨겨진 태그의 출력
  } 
  
</script>
 
</head> 
 
<body style="background-color:#000000; color:white;">
<jsp:include page="../menu/top.jsp" />

<DIV class='content_body'>

   <c:choose>
        <c:when test="${sessionScope.grade =='admin'}">
          <!-- 신규 등록 -->
          <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color:#000000; width: 100%; text-align: center;'>
            <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>    
            
              <label>영화 장르</label>
              <input type='text' name='mgenrename' id='mgenrename' value='' required="required" style='width: 25%;'
                         autofocus="autofocus">
               
              <button type="submit" id='submit'>등록</button>
            </FORM>
          </DIV>
  
        </c:when>
   </c:choose> 

   
  <!-- 수정 -->
  <DIV id='panel_update' 
          style='padding: 10px 0px 10px 0px; background-color:#000000; width: 100%; 
                    text-align: center; display: none;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type='hidden' name='mgenreno' id='mgenreno' value=''>     

      <label>영화 장르</label>
      <input type='text' name='mgenrename' id='mgenrename' value='' required="required" style='width: 25%;'
                 autofocus="autofocus">
       
      <button type="submit" id='submit'>저장</button>
      <button type="button" id='btn_update_cancel'>취소</button>
    </FORM>
  </DIV>
  
  <%-- 삭제 --%>
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color:#000000; 
          width: 100%; text-align: center; display: none;'>
    <div class="msg_warning">해당 영화 장르를 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='mgenreno' id='mgenreno' value=''>
        
      <label>영화 장르 이름 : </label><span id='frm_delete_mgenrename'></span>  

      
      <%-- 자식 레코드 갯수 출력 --%>
      <div id='frm_delete_count_by_mgenreno' 
             style='color: #FF0000; font-weight: bold; display: none; margin: 10px auto;'>
        <span id='frm_delete_count_by_mgenreno_panel'></span>     
        『<A id='a_list_by_mgenreno' href="../movie/list_search_paging.do?mgenreno=${mgenreno }">관련 자료 삭제하기</A>』
      </div>
       
      <button type="submit" id='submit' class='btn btn-primary'>삭제</button>
      <button type="button" id='btn_delete_cancel' class='btn btn-primary'>취소</button>
    </FORM>
  </DIV>
      
  <TABLE class='table table-striped'>
    <c:choose>
      <c:when test="${sessionScope.grade =='admin'}">
        <colgroup>
          <col style='width: 60%;'/>
          <col style='width: 20%;'/>
          <col style='width: 20%;'/>
        </colgroup>     
      </c:when>
      <c:otherwise>
        <colgroup>
          <col style='width: 100%;'/>
        </colgroup>
   
      </c:otherwise>    
    </c:choose>
   
    <thead>  
    <TR>
      
      <TH class="th_bs" style="text-align: center;">영화 장르 이름</TH>      
      <c:choose>
        <c:when test="${sessionScope.grade =='admin'}">
          <TH class="th_bs" style="text-align: center;">관련 영화 수</TH>
          <TH class="th_bs" style="text-align: center;">기타</TH>
        </c:when>
      </c:choose> 
      
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="mgenreVO" items="${list}">
      <c:set var="mgenreno" value="${mgenreVO.mgenreno }" />
      <c:set var="cnt" value="${mgenreVO.cnt }" />
      <TR>
        <TD class="td_bs" style="text-align: center; background-color:#000000;">
          <A href="../movie/list_search_paging.do?mgenreno=${mgenreno }" >${mgenreVO.mgenrename }</A>
        </TD>        
        
        <c:choose>
        <c:when test="${sessionScope.grade =='admin'}">
          <TD class="td_bs" style="text-align: center; background-color:#000000;">${mgenreVO.cnt }</TD>
          <TD class="td_bs" style="text-align: center; background-color:#000000;">
         
          <%-- Ajax 기반 수정폼--%>
          <A href="javascript: read_update_ajax(${mgenreno })" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          
          <%-- Ajax 기반 Delete폼--%>
          <A href="javascript: read_delete_ajax(${mgenreno })" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
                  
          </TD>     
        </c:when>
      </c:choose>
        
        
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>

