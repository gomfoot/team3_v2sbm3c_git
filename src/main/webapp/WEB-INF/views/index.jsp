<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>NENFLIX</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script type="text/javascript">
  
</script>

</head>

<body style="background-color: #000000; color: white;">
  <jsp:include page="./menu/top.jsp" flush='false' />

  <c:choose>
    <c:when test="${sessionScope.id == null}">
      <%-- 로그인 안 한 경 우 --%>
          로그인 해주시길 바랍니다
    </c:when>
    <c:otherwise>
      <c:choose>
        <c:when test="${sessionScope.grade =='admin'}">
            ADMIN 계정입니다.
        </c:when>
        <c:otherwise>

        <c:choose>
          <c:when test="${check1==1}" >
            <DIV class='title_line'>
              당신의 관심 장르 : <A
                href="../movie/list_search_paging.do?mgenreno=${mg1 }"
                class='title_link' style="color: royalblue;"> ${mg1_name } </A>
            </DIV>
  
            <div style='width: 100%;'>
              <%-- 갤러리 Layout 시작 --%>
              <c:forEach var="movieVO" items="${list_g1 }"
                varStatus="status">
                <c:set var="movieno" value="${movieVO.movieno }" />
                <c:set var="mtitle" value="${movieVO.mtitle }" />
                <c:set var="imgfile1" value="${movieVO.imgfile1 }" />
                <c:set var="imgsize1" value="${movieVO.imgsize1 }" />
                <c:set var="imgthumb1" value="${movieVO.imgthumb1 }" />
  
                <%-- 하나의 행에 이미지를 4개씩 출력후 행 변경 --%>
                <c:if
                  test="${status.index % 4 == 0 && status.index != 0 }">
                  <HR class='menu_line'>
                </c:if>
  
                <!-- 하나의 이미지, 24 * 4 = 96% -->
                <DIV
                  style='width: 24%; float: left; margin: 0.5%; padding: 0.5%; background-color:#000000; text-align: center;'>
                  <c:choose>
                    <c:when test="${imgsize1 > 0}">
                      <!-- 파일이 존재하면 -->
                      <c:choose>
                        <c:when
                          test="${imgthumb1.endsWith('jpg') || imgthumb1.endsWith('png') || imgthumb1.endsWith('gif')}">
                          <!-- 이미지 인경우 -->
                          <a
                            href="./movie/read.do?movieno=${movieno}&now_page=1">
                            <IMG src="./movie/img_storage/${imgthumb1 }"
                            style='width: 100%; height: 150px;'>
                          </a>
                          <br>
                          ${mtitle}
                        </c:when>
                        <c:otherwise>
                          <!-- 이미지가 아닌 일반 파일 -->
                          <DIV
                            style='width: 100%; height: 150px; display: table; border: solid 1px #CCCCCC;'>
                            <DIV
                              style='display: table-cell; vertical-align: middle; text-align: center;'>
                              <!-- 수직 가운데 정렬 -->
                              <a href="./movie/read.do?movieno=${movieno}">${imgfile1}</a><br>
                            </DIV>
                          </DIV>
                          ${mtitle}              
                        </c:otherwise>
                      </c:choose>
                    </c:when>
                    <c:otherwise>
                      <%-- 파일이 없는 경우 기본 이미지 출력 --%>
                      <a href="./movie/read.do?movieno=${movieno}"> <img
                        src='/movie/images/none1.png'
                        style='width: 100%; height: 150px;'>
                      </a>
                      <br>
                      이미지를 등록해주세요.
                    </c:otherwise>
                  </c:choose>
                </DIV>
              </c:forEach>
              <!-- 갤러리 Layout 종료 -->
              <br><br>
            </div>
  
            <br><br><br><br><br><br><br><br>
          </c:when>
        </c:choose>
        
        <c:choose>
            <c:when test="${check2==1}">
            <DIV class='title_line'>
            당신의 관심 장르 : <A
              href="../movie/list_search_paging.do?mgenreno=${mg2 }"
              class='title_link' style="color: royalblue;"> ${mg2_name} </A>
          </DIV>

          <div style='width: 100%;'>
            <%-- 갤러리 Layout 시작 --%>
            <c:forEach var="movieVO" items="${list_g2 }"
              varStatus="status">
              <c:set var="movieno" value="${movieVO.movieno }" />
              <c:set var="mtitle" value="${movieVO.mtitle }" />
              <c:set var="imgfile1" value="${movieVO.imgfile1 }" />
              <c:set var="imgsize1" value="${movieVO.imgsize1 }" />
              <c:set var="imgthumb1" value="${movieVO.imgthumb1 }" />

              <%-- 하나의 행에 이미지를 4개씩 출력후 행 변경 --%>
              <c:if
                test="${status.index % 4 == 0 && status.index != 0 }">
                <HR class='menu_line'>
              </c:if>

              <!-- 하나의 이미지, 24 * 4 = 96% -->
              <DIV
                style='width: 24%; float: left; margin: 0.5%; padding: 0.5%; background-color:#000000; text-align: center;'>
                <c:choose>
                  <c:when test="${imgsize1 > 0}">
                    <!-- 파일이 존재하면 -->
                    <c:choose>
                      <c:when
                        test="${imgthumb1.endsWith('jpg') || imgthumb1.endsWith('png') || imgthumb1.endsWith('gif')}">
                        <!-- 이미지 인경우 -->
                        <a
                          href="./movie/read.do?movieno=${movieno}&now_page=1">
                          <IMG src="./movie/img_storage/${imgthumb1 }"
                          style='width: 100%; height: 150px;'>
                        </a>
                        <br>
                        ${mtitle}
                      </c:when>
                      <c:otherwise>
                        <!-- 이미지가 아닌 일반 파일 -->
                        <DIV
                          style='width: 100%; height: 150px; display: table; border: solid 1px #CCCCCC;'>
                          <DIV
                            style='display: table-cell; vertical-align: middle; text-align: center;'>
                            <!-- 수직 가운데 정렬 -->
                            <a href="./movie/read.do?movieno=${movieno}">${imgfile1}</a><br>
                          </DIV>
                        </DIV>
                        ${mtitle}              
                      </c:otherwise>
                    </c:choose>
                  </c:when>
                  <c:otherwise>
                    <%-- 파일이 없는 경우 기본 이미지 출력 --%>
                    <a href="./movie/read.do?movieno=${movieno}"> <img
                      src='/movie/images/none1.png'
                      style='width: 100%; height: 150px;'>
                    </a>
                    <br>
                    이미지를 등록해주세요.
                  </c:otherwise>
                </c:choose>
              </DIV>
            </c:forEach>
            <!-- 갤러리 Layout 종료 -->
            <br><br>            
          </div>

          <br><br><br><br><br><br><br><br>
            </c:when>
          </c:choose>

          <DIV class='title_line'>인기 영화</DIV>

          <div style='width: 100%;'>
            <%-- 갤러리 Layout 시작 --%>
            <c:forEach var="movieVO" items="${list_p }"
              varStatus="status">
              <c:set var="movieno" value="${movieVO.movieno }" />
              <c:set var="mtitle" value="${movieVO.mtitle }" />
              <c:set var="imgfile1" value="${movieVO.imgfile1 }" />
              <c:set var="imgsize1" value="${movieVO.imgsize1 }" />
              <c:set var="imgthumb1" value="${movieVO.imgthumb1 }" />

              <%-- 하나의 행에 이미지를 4개씩 출력후 행 변경 --%>
              <c:if
                test="${status.index % 4 == 0 && status.index != 0 }">
                <HR class='menu_line'>
              </c:if>

              <!-- 하나의 이미지, 24 * 4 = 96% -->
              <DIV
                style='width: 24%; float: left; margin: 0.5%; padding: 0.5%; background-color: #000000; text-align: center;'>
                <c:choose>
                  <c:when test="${imgsize1 > 0}">
                    <!-- 파일이 존재하면 -->
                    <c:choose>
                      <c:when
                        test="${imgthumb1.endsWith('jpg') || imgthumb1.endsWith('png') || imgthumb1.endsWith('gif')}">
                        <!-- 이미지 인경우 -->
                        <a
                          href="./movie/read.do?movieno=${movieno}&now_page=1">
                          <IMG src="./movie/img_storage/${imgthumb1 }"
                          style='width: 100%; height: 150px;'>
                        </a>
                        <br>
                        ${mtitle}
                      </c:when>
                      <c:otherwise>
                        <!-- 이미지가 아닌 일반 파일 -->
                        <DIV
                          style='width: 100%; height: 150px; display: table; border: solid 1px #CCCCCC;'>
                          <DIV
                            style='display: table-cell; vertical-align: middle; text-align: center;'>
                            <!-- 수직 가운데 정렬 -->
                            <a href="./movie/read.do?movieno=${movieno}">${imgfile1}</a><br>
                          </DIV>
                        </DIV>
                        ${mtitle}              
                      </c:otherwise>
                    </c:choose>
                  </c:when>
                  <c:otherwise>
                    <%-- 파일이 없는 경우 기본 이미지 출력 --%>
                    <a href="./movie/read.do?movieno=${movieno}"> <img
                      src='/movie/images/none1.png'
                      style='width: 100%; height: 150px;'>
                    </a>
                    <br>
                    이미지를 등록해주세요.
                  </c:otherwise>
                </c:choose>
              </DIV>
            </c:forEach>
            <!-- 갤러리 Layout 종료 -->
            <br> <br>
          </div>

          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>

          <DIV class='title_line'>최신 영화</DIV>

          <div style='width: 100%;'>
            <%-- 갤러리 Layout 시작 --%>
            <c:forEach var="movieVO" items="${list_l }"
              varStatus="status">
              <c:set var="movieno" value="${movieVO.movieno }" />
              <c:set var="mtitle" value="${movieVO.mtitle }" />
              <c:set var="imgfile1" value="${movieVO.imgfile1 }" />
              <c:set var="imgsize1" value="${movieVO.imgsize1 }" />
              <c:set var="imgthumb1" value="${movieVO.imgthumb1 }" />

              <%-- 하나의 행에 이미지를 4개씩 출력후 행 변경 --%>
              <c:if
                test="${status.index % 4 == 0 && status.index != 0 }">
                <HR class='menu_line'>
              </c:if>

              <!-- 하나의 이미지, 24 * 4 = 96% -->
              <DIV
                style='width: 24%; float: left; margin: 0.5%; padding: 0.5%; background-color: #000000; text-align: center;'>
                <c:choose>
                  <c:when test="${imgsize1 > 0}">
                    <!-- 파일이 존재하면 -->
                    <c:choose>
                      <c:when
                        test="${imgthumb1.endsWith('jpg') || imgthumb1.endsWith('png') || imgthumb1.endsWith('gif')}">
                        <!-- 이미지 인경우 -->
                        <a
                          href="./movie/read.do?movieno=${movieno}&now_page=1">
                          <IMG src="./movie/img_storage/${imgthumb1 }"
                          style='width: 100%; height: 150px;'>
                        </a>
                        <br>
                        ${mtitle}
                      </c:when>
                      <c:otherwise>
                        <!-- 이미지가 아닌 일반 파일 -->
                        <DIV
                          style='width: 100%; height: 150px; display: table; border: solid 1px #CCCCCC;'>
                          <DIV
                            style='display: table-cell; vertical-align: middle; text-align: center;'>
                            <!-- 수직 가운데 정렬 -->
                            <a href="./movie/read.do?movieno=${movieno}">${imgfile1}</a><br>
                          </DIV>
                        </DIV>
                        ${mtitle}              
                      </c:otherwise>
                    </c:choose>
                  </c:when>
                  <c:otherwise>
                    <%-- 파일이 없는 경우 기본 이미지 출력 --%>
                    <a href="./movie/read.do?movieno=${movieno}"> <img
                      src='/movie/images/none1.png'
                      style='width: 100%; height: 150px;'>
                    </a>
                    <br>
                    이미지를 등록해주세요.
                  </c:otherwise>
                </c:choose>
              </DIV>
            </c:forEach>
            <!-- 갤러리 Layout 종료 -->
            <br> <br>
          </div>

        </c:otherwise>
      </c:choose>

    </c:otherwise>
  </c:choose>


  <jsp:include page="./menu/bottom.jsp" flush='false' />
</body>

</html>

