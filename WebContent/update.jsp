<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
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
@media (min-width: 768px) {  .container {    width: 600px;}}
@media (min-width: 992px) {  .container {    width: 600px;}}
/*사실 이 블럭은 없어도 된다*/
@media (min-width: 1200px) {  .container {    width: 600px;  }}
</style>

<title>진박송이박 차대절 사전조사</title>
</head>
<body>

<header>
	<%@include file="header.jsp"%>
</header>

<%
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해 주십시오.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	int bbsID = 0;
	if(request.getParameter("bbsID") != null) {
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	if(!userID.equals(bbs.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}
%>
	<div class="comtainer" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
					<table class="table" style="text-align:center;border: 1px solid #dddddd">
						<thead class="thead-light">
							<tr>
								<th colspan="2" style="text-align: center; ">게시판 글 수정 양식</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td>
							</tr>
							<tr>
								<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px"; ><%= bbs.getBbsContent() %></textarea></td>
							</tr>
						</tbody>
					</table>
					<button type="submit" class="btn btn-primary float-right">글수정</button>
				</form>
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