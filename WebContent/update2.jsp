<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs2.Bbs2" %>
<%@ page import="bbs2.Bbs2DAO" %>
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
	if(!userID.equals(bbs2.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'bbs2.jsp'");
		script.println("</script>");
	}
%>
<div class="container">
	<form action="updateAction2.jsp" id="form" name="form">
		<input type="hidden" name="latitude" id="latitude"
			value="null">
		<!-- 경도 값 -->
		<input type="hidden" name="longitude" id="longitude"
			value="null">
		<!-- 위도 값 -->
		<div class="form-group">
			<label for="title">제목</label> <input name="title" type="text" value="<%=bbs2.getTitle() %>"
				class="form-control" id="title" placeholder="제목을 입력해 주세요">
		</div>
		<div class="form-group">
			<label for="location">차대절 버스 위치</label> <input id="location" value="<%=bbs2.getLocation() %>"
				name="location" type="text" class="form-control"
				placeholder="위치를 입력하시고, 지도에서 클릭하세요">
		</div>
		<div class="form-group">
			<div id="googleMap" style="width: 600px; height: 400px;"></div>
		</div>
		<div class="form-group">
			<label for="startDate">버스 출발 일시</label> <input type="datetime-local" name="startDate" value=""
				id="startDate" max="2030-12-31T00:00" min="2018-01-01T00:00"
				value="<%=bbs2.getStartDate() %>" class="form-control">
		</div>
		<div class="form-group">
			<label for="personnel">모집인원</label> 
			<input id="personnel" name="personnel" type="number"  min="1" max="100" value="<%=bbs2.getPersonnel() %>"> 명
		</div>
		<div class="form-group">
			<label for="busType">버스 유형&nbsp;&nbsp;</label> 
			
			<label><input id="busType" name="busType" type="radio" value="0" checked >왕복</label>&nbsp;
			<label><input id="busType" name="busType" type="radio" value="1" >편도</label>
		</div>
			 			
		
		<div class="form-group">
			<textarea id="content" name="content" rows="5"
				class="form-control" placeholder="코멘트 입력"></textarea>
		</div>
		<button type="reset" class="btn btn-basic float-right">다시 작성</button>
		<button type="button" onclick="checkForm()"
			class="btn btn-primary float-right">게시글 수정</button>

	</form>
	</div>
	
	
	<!-- 제이쿼리를 사용하기 위한 문구 
		 제이쿼리는 개발자를 위해 cdn서버로 다음과 같이 사용할수 있도록 만들어 놓았다. -->
	<!-- 부트스트랩 자바스크립트를 불러온다 -->
	<script src="js/bootstrap.js"></script>
	
	<script src="js/GMap.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCKWthhcbUaluWntTS17mt6JUtNbd97D-U&libraries=places&callback=myMap"
		async defer></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>

</body>
</html>