<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
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
a, a:hover{color:#000000;text-decoration:none;}
@media (min-width: 768px) {  .container {    width: 600px;}}
@media (min-width: 992px) {  .container {    width: 600px;}}
/*사실 이 블럭은 없어도 된다*/
@media (min-width: 1200px) {  .container {    width: 600px;  }}
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
			<div class="col-sm-8">
				<table class="table" style="text-align:center;border: 1px solid #dddddd">
					<thead class="thead-light">
						<tr>
							<th style="text-align: center; ">번호</th>
							<th style="text-align: center; ">제목</th>
							<th style="text-align: center; ">작성자</th>
							<th style="text-align: center; ">작성일</th>
						</tr>
					</thead>
					<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i = 0; i < list.size();i++){
					%>
						<tr>
							<td><%= list.get(i).getBbsID() %></td>
							<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle()%></a></td>
							<td><%= list.get(i).getUserID() %></td>
							<td><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13)+"시 "+list.get(i).getBbsDate().substring(14,16) + "분" %></td>
						</tr>
					<%	
						}
					%>
					</tbody>
				</table>
				<%
					if(pageNumber != 1) {
				%>
					<a class="btn btn-success" href="bbs.jsp?pageNumber=<%=pageNumber - 1%>">이전</a>
				<%
					} if(bbsDAO.nextPage(pageNumber + 1)) {
				%>
					<a class="btn btn-success" href="bbs.jsp?pageNumber=<%=pageNumber + 1%>">다음</a>
				<%	
					}
				%>
				<a href="write.jsp" class="btn btn-primary float-right">글쓰기</a>
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