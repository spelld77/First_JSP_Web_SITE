<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs2.Bbs2DAO"%>
<%@ page import="java.io.PrintWriter"%>    
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbs2" class="bbs2.Bbs2" scope="page" />
<jsp:setProperty name="bbs2" property="title" />
<jsp:setProperty name="bbs2" property="content" />
<jsp:setProperty name="bbs2" property="location" />
<jsp:setProperty name="bbs2" property="latitude" />
<jsp:setProperty name="bbs2" property="longitude" />
<jsp:setProperty name="bbs2" property="startDate" />
<jsp:setProperty name="bbs2" property="personnel" />
<jsp:setProperty name="bbs2" property="busType" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진박송이박 차대절 사전조사</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
			if(bbs2.getPersonnel() < 0 ){ //모집인원이 null일때 처리는 아직 못함
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('모집인원이 잘못되었습니다')");
				script.println("history.back()");
				script.println("</script>");
			}
			if (bbs2.getTitle() == null || bbs2.getContent() == null || bbs2.getLocation() ==null || bbs2.getLatitude() >200 || bbs2.getLongitude() > 200 ||bbs2.getStartDate() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력되지 않은 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				Bbs2DAO bbs2DAO = new Bbs2DAO();
				int result = bbs2DAO.write(bbs2.getTitle(), userID, bbs2.getContent(), bbs2.getLocation(), bbs2.getLatitude(), bbs2.getLongitude(), bbs2.getStartDate(),bbs2.getPersonnel(), bbs2.getBusType());
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패 했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'bbs2.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>