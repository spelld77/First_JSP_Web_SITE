<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs2.Bbs2DAO"%>
<%@ page import="java.io.PrintWriter"%>
<%request.setCharacterEncoding("UTF-8");%>
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
		} 
		
		int boardNum = 0;
		if(request.getParameter("boardNum") != null) {
			boardNum = Integer.parseInt(request.getParameter("boardNum"));
		}
		if(boardNum == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		} else{
			Bbs2DAO bbs2dao = new Bbs2DAO();
			int result = bbs2dao.setUser2bbs(userID, boardNum);
			if(result >= 1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('참여에 성공했습니다.')");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
			else if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('참여에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		}
	%>
</body>
</html>