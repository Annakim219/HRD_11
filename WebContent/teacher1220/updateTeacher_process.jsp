<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/DBconn.jsp"%>
	<%
		String idx = request.getParameter("idx");
		String name = request.getParameter("name");
		String major = request.getParameter("major");
		String field= request.getParameter("field");

		
		try{
			String sql = "update teacher1220 set name=?, major=?, field=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, major);
			pstmt.setString(3, field);
			pstmt.setString(4, idx);
			pstmt.executeUpdate();
			System.out.println("수정 성공");
			%>
			 <script>
			 	alert('수정이 완료되었습니다!');
			 	location.href="/HRD_1220/teacher1220/selectTeacher.jsp"
			 </script>
			<%			
		}catch(SQLException e){
			System.out.println("수정 실패");
			 %>
			 <script>
			 	alert('수정 실패');
			 	history.back(-1);
			 </script>
			 <%
			 e.printStackTrace();
		}		
	%>
</body>
</html>