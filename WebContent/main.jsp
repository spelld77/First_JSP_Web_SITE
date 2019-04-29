<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
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
/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
	height: 100%;
}

.business-header {
	height: 400px;
	background: url('main_background.jpg') center center no-repeat scroll;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	background-size: cover;
	-o-background-size: cover;
}

.t1 {
	text-shadow: 0 0 10px #000;
	color: #fff;
}
</style>

<title>진박송이박 차대절 사전조사</title>
</head>
<body>

	<header>
		<%@include file="header.jsp"%>
	</header>
	<!-- Image Background Page Header -->
	<!-- Note: The background image is set within the business-casual.css file. -->
	<header class="business-header"> 
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h2 class="t1" style="margin-top:30px;">여행 및 콘서트 참여를 위한 최고의 선택</h1>
				</div>
			</div>
		</div>
	</header>

	<!-- Page Content -->
	<div class="container">

		<hr>

		<div class="row">
			<div class="col-sm-8">
				<h2>What We Do</h2>
				<p>좋아하는 가수 , 연애인 등의 콘서트 , 이벤트 등에 참여하실 때 교통문제로 불편을 겪으신 적이 있지 않으십니까. 저희는 
				각 지방등에서 버스등을 대절할때 인원을 보다 편하게 모아 찾을 수 있게하여 조금이나마 교통문제로 시간을 쓰는 일이
				없도록 할 수 있게 사전조사 서비스를 제공합니다.</p>
				<p>우리는 웹과 안드로이드 앱으로 서비스를 제공합니다. 너는 쉽고 빠르게 현재 진행중인 콘서트의 사전조사에 참여하고
				버스를 이용할 수 있습니다. 사전조사는 아래 설문조사 게시판에서 진행할수 있습니다. 지금 시작하세요.</p>
				<p>  
					<a class="btn btn-outline-dark btn-lg" href="bbs2.jsp">설문게시판 가기
						&raquo;</a>
				</p>
			</div>
			<div class="col-sm-4">
				<h2>Contact Us</h2>
				<address>
					<strong>YJU GC-A 2조</strong> <br>진도빈 <br>박유진<br>송왕은<br>이정협<br>박인영
					<br>    
				</address>
				<address>
					<abbr title="Phone">P:</abbr>(123) 456-7890 <br> <abbr
						title="Email">E:</abbr> <a href="mailto:#">name@example.com</a>
				</address>
			</div>
		</div>
		<!-- /.row -->

		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>Copyright &copy; YJU 2GC-A 2조</p> 
				</div> 
			</div>
			<!-- /.row --> 
		</footer>
		<!-- 제이쿼리를 사용하기 위한 문구 
		 제이쿼리는 개발자를 위해 cdn서버로 다음과 같이 사용할수 있도록 만들어 놓았다. -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<!-- 부트스트랩 자바스크립트를 불러온다 -->
		<script src="js/bootstrap.js"></script>
</body>
</html>