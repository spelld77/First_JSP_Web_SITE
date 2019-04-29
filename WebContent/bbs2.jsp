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

@media ( min-width : 768px) {
	.container {
		width: 600px;
	}
}

@media ( min-width : 992px) {
	.container {
		width: 600px;
	}
}
/*사실 이 블럭은 없어도 된다*/
@media ( min-width : 1200px) {
	.container {
		width: 600px;
	}
}
.card{margin-bottom:20px;}
</style>

<title>진박송이박 차대절 사전조사</title>
</head>
<body>
	<%
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>

	<header>
		<%@include file="header.jsp"%>
	</header>

	<div class="comtainer" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-2"></div>
			<%
				Bbs2DAO bbs2DAO = new Bbs2DAO();
				ArrayList<Bbs2> list = bbs2DAO.getList(pageNumber);
			%>
			<div class="col">
				<%
					for (int i = 0; i < list.size(); i += 3) {
				%>

				<a href="view2.jsp?boardNum=<%=list.get(i).getBoardNum()%>"><div
						class="card">
						<div class="card-header"><%=list.get(i).getBoardNum()%>&nbsp;<%=list.get(i).getTitle()%></div>
						<div class="card-body"><%=list.get(i).getLocation()%></div>
						<div class="card-footer"><%=list.get(i).getUserID()%></div>
					</div></a>
				<%
					}
				%>
			</div>
			<div class="col">
				<%
					for (int i = 1; i < list.size(); i += 3) {
				%>
				<a href="view2.jsp?boardNum=<%=list.get(i).getBoardNum()%>"><div
						class="card">
						<div class="card-header"><%=list.get(i).getBoardNum()%>.&nbsp;<%=list.get(i).getTitle()%></div>
						<div class="card-body"><%=list.get(i).getLocation()%></div>
						<div class="card-footer"><%=list.get(i).getUserID()%></div>
					</div></a>
				<%
					}
				%>
			</div>
			<div class="col">
				<%
					for (int i = 2; i < list.size(); i += 3) {
				%>
				<a href="view2.jsp?boardNum=<%=list.get(i).getBoardNum()%>"><div
						class="card">
						<div class="card-header"><%=list.get(i).getBoardNum()%>.&nbsp;<%=list.get(i).getTitle()%></div>
						<div class="card-body"><%=list.get(i).getLocation()%></div>
						<div class="card-footer"><%=list.get(i).getUserID()%></div>
					</div></a>
				<%
					}
				%>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
	<div class="comtainer" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<%
					if (pageNumber != 1) {
				%>
				<a class="btn btn-success"
					href="bbs2.jsp?pageNumber=<%=pageNumber - 1%>">이전</a>
				<%
					}
					if (bbs2DAO.nextPage(pageNumber + 1)) {
				%>
				<a class="btn btn-success"
					href="bbs2.jsp?pageNumber=<%=pageNumber + 1%>">다음</a>
				<%
					}
				%>
				<%
				//여기서 글쓰기 버튼 보여주기 여부 결정 (총대가 아니면 글쓰기 불가)
				try{ //user.getUserAdmin오류나는 경우 글쓰기 버튼 안보이게 (세션이 없을때,로그인 안했을시)
					String userid = null;
					userid =(String)session.getAttribute("userID");
					
					User usera = new UserDAO().getUser(userid); //글쓰기 버튼 보이기 감추기에만 사용
					
					if(usera.getUserAdmin() != 0 ){
					%>
						<a href="writeG.jsp" class="btn btn-primary float-right">글쓰기</a>	
					<% 
					}
				}catch(Exception e){}
				%>
				
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>

	<!-- 제이쿼리를 사용하기 위한 문구 
		 제이쿼리는 개발자를 위해 cdn서버로 다음과 같이 사용할수 있도록 만들어 놓았다. -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 부트스트랩 자바스크립트를 불러온다 -->
	<script src="js/bootstrap.js"></script>

</body>
</html>