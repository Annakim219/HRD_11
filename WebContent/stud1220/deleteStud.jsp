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
		String studno = request.getParameter("studno");

		try{
			String sql = "delete from stud1220 where studno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studno);
			pstmt.executeUpdate();
			System.out.println("삭제 성공");
			%>
			 <script>
			 	alert('삭제가 완료되었습니다!');
			 	location.href="/HRD_1220/stud1220/selectStud.jsp"
			 </script>
			<%			
		}catch(SQLException e){
			System.out.println("삭제 실패");
			 %>
			 <script>
			 	alert('삭제 실패');
			 	history.back(-1);
			 </script>
			 <%
			 e.printStackTrace();
		}		
	%>
</body>
</html>