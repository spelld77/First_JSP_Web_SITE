<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs2.Bbs2DAO"%>
<%@ page import="bbs2.Bbs2"%>
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
		} else {
			if (request.getParameter("title") == null || request.getParameter("content") == null|| request.getParameter("title").equals("") || request.getParameter("title").equals("")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력되지 않은 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				Bbs2DAO bbs2DAO = new Bbs2DAO();
				int result = bbs2DAO.update(boardNum, request.getParameter("title"),  request.getParameter("content"), request.getParameter("location"), Double.parseDouble(request.getParameter("latitude")), Double.parseDouble(request.getParameter("longitude")), request.getParameter("startDate"), Integer.parseInt(request.getParameter("personnel")), Integer.parseInt(request.getParameter("busType")));
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패 했습니다.')");
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