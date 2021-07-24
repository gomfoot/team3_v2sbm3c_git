<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="movieno" value="${movieVO.movieno }" />
<c:set var="mtitle" value="${movieVO.mtitle }" />
<c:set var="mcontent" value="${movieVO.mcontent }" />
<c:set var="mtime" value="${movieVO.mtime }" />        
<c:set var="director" value="${movieVO.director }" />
<c:set var="caster" value="${movieVO.caster }" />
<c:set var="viewclass" value="${movieVO.viewclass }" />
<c:set var="mdate" value="${movieVO.mdate }" />
<c:set var="goodscore" value="${movieVO.goodscore }" />
<c:set var="hatescore" value="${movieVO.hatescore }" />
<c:set var="mcnt" value="${movieVO.mcnt }" />
<c:set var="favorites_check" value="${movieVO.favorites_check }" />
<c:set var="score_check" value="${movieVO.score_check }" />
<c:set var="mscore_check" value="${movieVO.mscore_check }" />
<c:set var="now_page" value="${param.now_page }" />
       
 
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
    $('#btn_cancel_video').on('click', cancel_video);
  });
  function play_video(movieno) {
    
    var params = "";
    params += 'movieno=' + movieno;
    $.ajax(
        {
          url: '/movie/mhistory.do',
          type: 'get',  // get, post
          cache: false, // 응답 결과 임시 저장 취소
          async: true,  // true: 비동기 통신
          dataType: 'json', // 응답 형식: json, html, xml...
          data: params,      // 데이터
          success: function(rdata) { // 응답이 온경우
            var str = '';
            
            if (rdata.cnt == 1) {
              $('#panel_img').css("display","none");
              $('#panel_video').css("display","");
              $('#btn_play_video').css("display","none");
              $('#btn_cancel_video').css("display","");
              $('#video1').get(0).play();
            }else{
              alert('선택한 영화를 찜 목록에 담지못했습니다.<br>잠시후 다시 시도해주세요.');
              }
          },
          // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
          error: function(request, status, error) { // callback 함수
            console.log(error);
          }
        }
      );  //  $.ajax END
    }
  
  function cancel_video() {
    $('#panel_img').css("display","");
    $('#panel_video').css("display","none");
    $('#btn_play_video').css("display","");
    $('#btn_cancel_video').css("display","none");
    $('#video1').get(0).pause();
    }

  
  
  <%-- 찜목록 영화 등록 --%>
  function favorites_ajax(movieno) {   
    var params = "";
    // params = $('#frm_login').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params += 'movieno=' + movieno;
    
    $.ajax(
      {
        url: '/favorites/create.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          var str = '';
          
          if (rdata.cnt == 1) {
            var sw = confirm('선택한 영화가 찜 목록에 담겼습니다.\n찜 목록으로 이동하시겠습니까?');
            if (sw == true) {
              $('#btn_favorites_add').css("display","none");
              $('#btn_favorites_able').css("display","");
              location.href='/favorites/list_favorites.do';
              
            }           
          } else {
            alert('선택한 영화를 찜 목록에 담지못했습니다.<br>잠시후 다시 시도해주세요.');
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

  }
 
  function update_goodscore_ajax(movieno) {
    var frm_read = $('#frm_read');
    var movieno = $('#movieno', frm_read).val();
    var memberno = $('#memberno', frm_read).val();
    var params =''
    params += 'movieno=' + movieno + '&memberno=' + memberno ;
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    $.ajax(
      {
        url: '/movie/update_goodscore_ajax.do',
        type: 'GET',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          // console.log('-> rdata: '+ rdata);
          var str = '';
          if (rdata.score_check == 0) {
            gscore_img = "/movie/images/good_off.png";
          } else if(rdata.score_check == 1) {
            gscore_img = "/movie/images/good_on.png";
          }
          $('#gscore_img', frm_read).attr('src', gscore_img);
          $('#goodscore').html(rdata.goodscore);
          $('#score_check').html(rdata.score_check);
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

    // $('#span_animation').css('text-align', 'center');
    $('#span_animation').html("<img src='/movie/images/ani04.gif' style='width: 8%;'>");
    $('#span_animation').show(); // 숨겨진 태그의 출력
  }

  function update_hatescore_ajax(movieno) {
    var frm_read = $('#frm_read');
    var movieno = $('#movieno', frm_read).val();
    var memberno = $('#memberno', frm_read).val();
    var params =''
    params += 'movieno=' + movieno + '&memberno=' + memberno ;
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    $.ajax(
      {
        url: '/movie/update_hatescore_ajax.do',
        type: 'GET',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          // console.log('-> rdata: '+ rdata);
          var str = '';
          if (rdata.score_check == 0) {
            hscore_img = "/movie/images/hate_off.png";
          } else if(rdata.score_check == 2) {
            hscore_img = "/movie/images/hate_on.png";
          }
          $('#hscore_img', frm_read).attr('src', hscore_img);
          $('#hatescore').html(rdata.hatescore);
          $('#score_check').html(rdata.score_check);
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

    // $('#span_animation').css('text-align', 'center');
    $('#span_animation').html("<img src='/movie/images/ani04.gif' style='width: 8%;'>");
    $('#span_animation').show(); // 숨겨진 태그의 출력
  }
  
</script>
 
</head> 
 
<body style="background-color:#000000; color:white;">
<jsp:include page="../menu/top.jsp" flush='false' />
 
<DIV class='title_line'>
  <A href="../mgenre/list.do" class='title_link'>영화 장르</A> >
  <A href="../movie/list_search_paging.do?mgenreno=${mgenreVO.mgenreno }" class='title_link'>${mgenreVO.mgenrename }</A> >  
  <A href="./read.do?movieno=${movieVO.movieno }" class='title_link'>${movieVO.mtitle }</A>
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>  
    <A href="./list_search_paging.do?mgenreno=${mgenreVO.mgenreno }&now_page=${param.now_page}&word=${param.word}">목록</A>    
    <span class='menu_divide' >│</span>
    <c:choose>
        <c:when test="${sessionScope.grade =='admin'}">
            <A href="./create.do?mgenreno=${mgenreVO.mgenreno }">영화 등록</A>
            <span class='menu_divide' >│</span>
            <A href="./update_text.do?movieno=${movieno}&now_page=${param.now_page}">영화 정보 수정</A>
            <span class='menu_divide' >│</span>
            <A href="./update_file.do?movieno=${movieno}&now_page=${param.now_page}">영화 파일 수정</A>  
            <span class='menu_divide' >│</span>
            <A href="./delete.do?movieno=${movieno}&now_page=${param.now_page}">삭제</A>        
        </c:when>
    </c:choose> 
      
  </ASIDE> 
    
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <c:set var="imgfile1" value="${movieVO.imgfile1.toLowerCase() }" />
        <c:set var="videofile1" value="${movieVO.videofile1.toLowerCase() }" />
      
        <c:if test="${imgfile1.endsWith('jpg') || imgfile1.endsWith('png') || imgfile1.endsWith('gif')}">
          <DIV id = 'panel_img' style="width: 50%; float: left; margin-right: 10px;">
            <IMG src="/movie/img_storage/${movieVO.imgfile1 }" style="width: 100%;">
          </DIV>
        </c:if> 
        
        <c:if test="${movieVO.videofile1.trim().length() > 0 }">
            <DIV id = 'panel_video' style='width:900px; margin: 0px auto; text-align: center; display: none;'>
              <VIDEO id='video1' controls src='/movie/video_storage/${movieVO.videofile1}'
                          style="width: 50%; float: left; margin-right: 10px;"></VIDEO>
            </DIV>
        </c:if> 
        
        <DIV style="width: 47%; height: 260px; float: left; margin-right: 10px;">
            <strong><span style="font-size: 1.5em; font-weight: bold;">${mtitle }</span></strong><br>
            
            <DIV>${movieVO.mcontent }</DIV>
            
            <strong>영화 시간:<fmt:formatNumber value="${movieVO.mtime}" /></strong><br>
            <span style="font-size: 1.0em;">감독: ${movieVO.director}</span><br>            
            <span style="font-size: 1.0em;">출연: ${movieVO.caster}</span><br>
            <span style="font-size: 1.0em;">관람등급: ${movieVO.viewclass}</span><br>
            <span style="font-size: 1.0em;">출시년도: ${movieVO.mdate}</span><br>
            <span style="font-size: 1.0em;">(조회수: <fmt:formatNumber value="${mcnt}" pattern="#,###" />)</span><br>
            <form name='frm_read' id='frm_read' >
            <input type="hidden" id='movieno' name="movieno" value='${movieVO.movieno }'>
            <input type="hidden" id='memberno' name="memberno" value='${sessionScope.memberno }'>
              <button type='button' id="btn_play_video"  class="btn btn-info" onclick="play_video(${movieno })">재생</button>
              <button type='button' id="btn_cancel_video"  style="display: none;" class="btn btn-info">숨기기</button>
               
              
              <c:choose>
                  <c:when test="${sessionScope.memberno != null}">
                  <c:choose>
                    <c:when test="${favorites_check == 0}">
                      <button type='button' id="btn_favorites_add"  class="btn btn-info" onclick="favorites_ajax(${movieno })">찜♡</button>
                      <button type='button' id="btn_favorites_able"  style="display: none;" class="btn btn-info" >찜♥</button>
                    </c:when>
                    <c:when test="${favorites_check == 1}">
                      <button type='button' id="btn_favorites_add"  style="display: none;" class="btn btn-info" onclick="favorites_ajax(${movieno })">찜♡</button>
                      <button type='button' id="btn_favorites_able"   class="btn btn-info" >찜♥</button>
                    </c:when>
                  </c:choose>
                  <c:choose>
                      <c:when test="${score_check == 0}">
                          <a href='javascript: update_goodscore_ajax();'><img src='/movie/images/good_off.png' id='gscore_img'></a>        
                          <a href='javascript: update_hatescore_ajax();'><img src='/movie/images/hate_off.png' id='hscore_img'></a>
                      </c:when>
                       <c:when test="${score_check == 1}">
                          <a href='javascript: update_goodscore_ajax();'><img src='/movie/images/good_on.png' id='gscore_img'></a>        
                          <a href='javascript: update_hatescore_ajax();'><img src='/movie/images/hate_off.png' id='hscore_img'></a>
                      </c:when>
                       <c:when test="${score_check == 2}">
                          <a href='javascript: update_goodscore_ajax();'><img src='/movie/images/good_off.png' id='gscore_img'></a>        
                          <a href='javascript: update_hatescore_ajax();'><img src='/movie/images/hate_on.png' id='hscore_img'></a>
                      </c:when>
                   </c:choose>                        
                  </c:when>
              </c:choose> 
               
             
              
            </form>
          </DIV> 
       </li> 
    </ul>
  </fieldset>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>