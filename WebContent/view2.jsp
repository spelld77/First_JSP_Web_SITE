<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs2.Bbs2" %>
<%@ page import="bbs2.Bbs2DAO" %>
<!-- user정보 빼오기 위해 -->
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ page import="linkedList.Linkedlist"%>
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


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진박송이박 차대절 사전조사</title>
</head>
<body>
	<header>
		<%@include file="header.jsp"%>
	</header>
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
	
	//작성자 정보 얻기위해서
	User writer = new UserDAO().getUser(bbs2.getUserID());
	
	//시간으로 바꾸기

%>
<script>
var Lat1 = "<%=bbs2.getLatitude()%>"; //위치를 를 다른스크립트(GMap2)에서 사용하기 위해
var Lot1 = "<%=bbs2.getLongitude()%>";
Lat1 *=1; //숫자로 바꾸기
Lot1 *=1;
</script>


<!-- dele -->
<div class="comtainer" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
					<table class="table" style="text-align:center;border: 1px solid #dddddd">
						<thead class="thead-light">
							<tr>
								<th colspan="3" style="text-align: center; ">게시판 글 보기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>작성자</td>
								<td colspan="2"><%= bbs2.getUserID() %></td>
							</tr>
							<tr>
								<td>작성일자</td>
								<td colspan="2"><%= bbs2.getDate().substring(0,11) + bbs2.getDate().substring(11,13)+"시 "+bbs2.getDate().substring(14,16) + "분" %></td>
							</tr>
						</tbody>
					</table>
					<!-- 테이블 밖  시작-->
					<div class="row"> <!-- 내용 들어가는곳 지도 포함 -->
						<div class="col-md-6"> <!-- 내용 -->
							
							<!-- 여기부터 수정중 -->
							<span><strong>제목</strong></span>
							<div class="card-body" style="background-color:#f5f5f5; margin-bottom:20px; text-align:center;">
								<%= bbs2.getTitle()%>
							</div>
							
							
							
							<span><strong>버스 유형</strong></span>
							<div class="card-body" style="background-color:#f5f5f5; margin-bottom:20px; text-align:center;">
								<c:set var= "way" value="<%=bbs2.getBusType() %>"/>
								<c:choose>
									<c:when test="${way ==0 }">왕복</c:when>
									<c:when test="${way == 1 }">편도</c:when>
								</c:choose>
							</div>
							
							<span><strong>버스 출발 시간</strong></span>
							<div class="card-body" style="background-color:#f5f5f5; margin-bottom:20px; text-align:center;">
								<%= bbs2.getStartDateForm()%>
							</div>
							
							<span><strong>총대 연락처</strong></span>
							<div class="card-body" style="background-color:#f5f5f5; margin-bottom:20px; text-align:center;">
								<span> 전화번호 :&nbsp;&nbsp;<%=writer.getUserTel()%></span><br>
								<span> 이메일 :&nbsp;&nbsp;<%=writer.getUserEmail()%></span><br>
								
							</div>
							<span><strong>모집 인원</strong></span>
							<div class="card-body" style="background-color:#f5f5f5; margin-bottom:20px; text-align:center;">
								<span> 모집인원:&nbsp;&nbsp;<%=bbs2.getPersonnel()%>명</span><br>
								
							</div>
							
							<span><strong>내용</strong></span>
							<div class="card-body" style="background-color:#f5f5f5; margin-bottom:20px;">
								<%= bbs2.getContent()%>
							</div>
							
						<!-- end -->
						</div>
						<div class="col-md-6"> <!-- 지도 -->
							<div id="googleMap" style="width: 100%; height: 60%; margin-top:5%;"></div>
						</div>
					</div>
					<!-- 테이블 밖 끝 -->
					<a href="bbs2.jsp" class="btn btn-primary">목록</a>
					<button class="btn btn-primary" data-toggle="modal"
					data-target="#viewUser">참여자 현황</button>
					<a href="user2bbsInsertAction.jsp?boardNum=<%=request.getParameter("boardNum")%>" class="btn btn-primary">참여하기</a>
					<% 
						if(userID != null && userID.equals(bbs2.getUserID())){
							%>
							<a href="update2.jsp?boardNum=<%= boardNum %>" class="btn btn-primary">수정</a>
							<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction2.jsp?boardNum=<%= boardNum %>" class="btn btn-primary">삭제</a>
							<%
						}
					%>
					<a href="payment.jsp?boardNum=<%=request.getParameter("boardNum")%>" class="btn btn-primary float-right">결제하기</a>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
	<!--  dele -->
	
<!-- 참여자 모달  -->
	<div class="modal" id="viewUser">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h6 class="modal-title">참여자 현황</h6>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<table class="table"
						style="text-align: center; border: 1px solid #dddddd">
						<thead class="thead-light">
						<tr>
							<th style="text-align: center; ">참여자</th>
							<th style="text-align: center; ">결제유무</th>
						</tr>
					</thead>
					<tbody>
						<%
							Bbs2DAO bbsDAO = new Bbs2DAO();
							Linkedlist list = bbsDAO.getUserList(boardNum);
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><%=list.get(i)%></td>
							<td><%=list.getPayCheck(i)%></td> <!-- 변경해야함 -->
						</tr>
						<%
							}
						%>
						
						</tbody>
					</table>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>














<script src="js/GMap2.js"></script>
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

	<!-- 부트스트랩 자바스크립트를 불러온다 -->
	<script src="js/bootstrap.js"></script>
</body>
</html>