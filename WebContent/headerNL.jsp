<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
a, a:hover{color:#000000;text-decoration:none;}
</style>
<title>Insert title here</title>


</head>
<body>
	<a href="main.jsp">
		<div class="" style="margin-bottom: 0">
			<h2 style="margin: 30px; text-align:center"  >
				진박송이박 차 대절 사전조사
				</h2>
		</div>
	</a>
	<nav class="navbar navbar-expand-lg bg-dark navbar-dark">
		<!-- (navbar-brand)navbar 타이틀이름 -->
		<div class="col-sm-2"></div>
		<div class="col-sm-8">

			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#collapsibleNavbar-1">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="collapsibleNavbar-1">
				<ul class="navbar-nav w-100">
					<li class="nav-item"><a class="nav-link" href="main.jsp">메인</a></li>
					<li class="nav-item"><a class="nav-link" href="bbs.jsp">자유게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="bbs2.jsp">사전조사</a></li>
					<!-- Dropdown -->

					<li class="nav-item dropdown ml-auto"><a
						class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown">접속하기 </a> <!-- aria-haspopup="true" aria-expanded="false"이거 무슨 듯인지 모르겠다.. -->
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item active" href="login.jsp">로그인</a> <a
								class="dropdown-item" href="join.jsp">회원가입</a>
						</div></li>
				</ul>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</nav>
</body>
</html>