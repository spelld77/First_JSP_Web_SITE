<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<% //로그인 안되있으면 로그인.jsp  이동
if (session.getAttribute("userID") == null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인이 필요합니다')");
	script.println("location.href='login.jsp'");
	script.println("</script>");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width" , initial-scale="1">
<!-- 부트스트랩.css를 불러오는링크 태그 -->
<link rel="stylesheet" href="css/bootstrap.css">


<meta charset="UTF-8">
<title>진박송이박 차대절 사전조사</title>
</head>
<body>
	<header>
		<%@include file="header.jsp"%>
	</header>

<div class="container">
	<form action="writeG_Action.jsp" id="form" name="form">
		<input type="hidden" name="latitude" id="latitude"
			value="null">
		<!-- 경도 값 -->
		<input type="hidden" name="longitude" id="longitude"
			value="null">
		<!-- 위도 값 -->
		<div class="form-group">
			<label for="title">제목</label> <input name="title" type="text"
				class="form-control" id="title" placeholder="제목을 입력해 주세요">
		</div>
		<div class="form-group">
			<label for="location">차대절 버스 위치</label> <input id="location"
				name="location" type="text" class="form-control"
				placeholder="위치를 입력하시고, 지도에서 클릭하세요">
		</div>
		<div class="form-group">
			<div id="googleMap" style="width: 600px; height: 400px;"></div>
		</div>
		<div class="form-group">
			<label for="startDate">버스 출발 일시</label> <input type="datetime-local" name="startDate"
				id="startDate" max="2030-12-31T00:00" min="2018-01-01T00:00"
				value="2018-12-21T15:00" class="form-control">
		</div>
		<div class="form-group">
			<label for="personnel">모집인원</label> 
			<input id="personnel" name="personnel" type="number"  min="1" max="100" > 명
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
			class="btn btn-primary float-right">게시글 등록</button>

	</form>
	</div>

	<script src="js/GMap.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=googlemapapi_key"
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