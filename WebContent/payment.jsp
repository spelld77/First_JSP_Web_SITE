<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs2.Bbs2DAO"%>
<%@ page import="bbs2.Bbs2"%>
<%@ page import="java.util.ArrayList"%>
<!-- 총대와 일반을 구분하기 위해 -->
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 메타태그 뷰포트  - 화면상에 표시 영역을 설정한다.
	width=device-width 가로를 장치의 넓이로 설정한다.
	initial-scale 초기화면 배율 설정  - 1일시 100% -->
<meta name="viewport" content="width=device-width" , initial-scale="1">

<!-- 부트스트랩.css를 불러오는링크 태그 -->
<link rel="stylesheet" href="css/bootstrap.css">

<style>
a, a:hover {
	color: #000000;
	text-decoration: none;
}

section.pricing {
	height: 700px;  
	background: url('payment_background.jpg') center center no-repeat scroll;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	background-size: cover;
	-o-background-size: cover;
}

.pricing .card {
	border: none;
	border-radius: 1rem;
	transition: all 0.2s;
	box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
}

.pricing hr {
	margin: 1.5rem 0;
}

.pricing .card-title {
	margin: 0.5rem 0;
	font-size: 0.9rem;
	letter-spacing: .1rem;
	font-weight: bold;
}

.pricing .card-price {
	font-size: 3rem;
	margin: 0;
}

.pricing .card-price .period {
	font-size: 0.8rem;
}

.pricing ul li {
	margin-bottom: 1rem;
}

.pricing .text-muted {
	opacity: 0.7;
}

.pricing .btn {
	font-size: 80%;
	border-radius: 5rem;
	letter-spacing: .1rem;
	font-weight: bold;
	padding: 1rem;
	opacity: 0.7;
	transition: all 0.2s;
}

/* Hover Effects on Card */
@media ( min-width : 992px) {
	.pricing .card:hover {
		margin-top: -.25rem;
		margin-bottom: .25rem;
		box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.3);
	}
	.pricing .card:hover .btn {
		opacity: 1;
	}
}
</style>

<title>진박송이박 차대절 사전조사</title>
</head>
<body>
<%
	int boardNum = 0;
	if(request.getParameter("boardNum") != null) {
		boardNum = Integer.parseInt(request.getParameter("boardNum"));
}
	if(boardNum == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'bbs2.jsp'");
		script.println("</script>");
	}
	Bbs2 bbs2 = new Bbs2DAO().getBbs(boardNum);
%>
	<header>
		<%@include file="header.jsp"%>
	</header>

<!-- This snippet uses Font Awesome 5 Free as a dependency. You can download it at fontawesome.io! -->

<section class="pricing py-5">
  <div class="container">
    <div class="row">
      <div class="col-lg-4"></div>
      <!-- Plus Tier -->
      <div class="col-lg-5"> 
        <div class="card mb-5 mb-lg-0">
          <div class="card-body">
            <h5 class="card-title text-muted text-uppercase text-center">결 제</h5>
            <h6 class="card-price text-center">￦19,900<span class="period">/왕복</span></h6>
            <hr>
            <ul class="fa-ul">
              <li><span class="fa-li"><i class="fas fa-check"></i></span><strong>결제 페이지 입니다.<br> 아래의 사항이 맞는지 확인해 주십시오.</strong></li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>이용자 : <%=session.getAttribute("userID")%></li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>결제할 사전조사 : <%= bbs2.getTitle()%></li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>출발시간 : <%= bbs2.getStartDateForm()%></li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>장소 : <%= bbs2.getLocation() %></li>
            </ul>   
            <a href="paymentAction.jsp?boardNum=<%=boardNum %>" class="btn btn-block btn-primary text-uppercase">결제확인</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
	<!-- 제이쿼리를 사용하기 위한 문구 
		 제이쿼리는 개발자를 위해 cdn서버로 다음과 같이 사용할수 있도록 만들어 놓았다. -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 부트스트랩 자바스크립트를 불러온다 -->
	<script src="js/bootstrap.js"></script>
</body>
</html>