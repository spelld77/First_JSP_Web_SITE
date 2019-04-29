<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="user.User" %>
<%@page import="user.UserDAO" %>
<%@page import="bbs2.Bbs2" %>
<%@page import="bbs2.Bbs2DAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%
		
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
					
				User me = new UserDAO().getUser(userID);
				
				pageContext.setAttribute("u_id", me.getUserID());
				pageContext.setAttribute("u_pwd", me.getUserPassword());
				pageContext.setAttribute("u_name", me.getUserName());
				pageContext.setAttribute("u_email", me.getUserEmail());
				pageContext.setAttribute("u_tel", me.getUserTel());
				
				///유저 구분 출력하기 위해서 
				String u_admin ="";
				if(me.getUserAdmin() == 0){
					u_admin ="일반 사용자";
				} else if(me.getUserAdmin()==1){
					u_admin ="총대";
				}
				pageContext.setAttribute("u_admin", u_admin);
			
		}
		
	%>

	<a href="main.jsp">
		<div class="" style="margin-bottom: 0">
			<h2 style="margin: 30px; text-align: center;">진박송이박 차 대절 사전조사</h2>
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
				</ul>
				<%
					if (userID == null) {
				%>
				<ul class="navbar-nav w-100">
					<li class="nav-item dropdown ml-auto"><a
						class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown">접속하기 </a> <!-- aria-haspopup="true" aria-expanded="false"이거 무슨 듯인지 모르겠다.. -->
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item active" href="login.jsp">로그인</a> <a
								class="dropdown-item" href="join.jsp">회원가입</a>
						</div></li>
				</ul>
				<%
					} else {
				%>
				<ul class="navbar-nav w-100">
					<li class="nav-item dropdown ml-auto"><a
						class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown">회원관리 </a> <!-- aria-haspopup="true" aria-expanded="false"이거 무슨 듯인지 모르겠다.. -->
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item" href="myInfo.jsp" data-toggle="modal"
								data-target="#viewMyInfo">내 정보</a> <a class="dropdown-item"
								href="logoutAction.jsp">로그아웃</a>
						</div></li>
				</ul>
				<%
					}
				%>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</nav>

	<!-- 내정보 모달  -->
	<div class="modal" id="viewMyInfo">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h6 class="modal-title">내 정보</h6>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
				
					아이디 : <c:out value="${u_id }"/><br>
					이름 : <c:out value="${u_name }"/><br>
					이메일 : <c:out value="${u_email }"/><br>
					전화번호 : <c:out value="${u_tel }"/><br>
					구분 : <c:out value="${u_admin }"/><br>
					
				
					
					
				</div>
				<!-- Modal footer -->
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>


</body>
</html>