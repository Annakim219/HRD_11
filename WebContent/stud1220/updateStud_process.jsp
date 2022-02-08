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
		String name = request.getParameter("name");
		String dept = request.getParameter("dept");
		String position = request.getParameter("position");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String hobby[] = request.getParameterValues("hobby");
		String chk = "";
		for (int i = 0; i < hobby.length; i++) {
			if ((i + 1) == hobby.length) {
				chk = chk + hobby[i];
			} else {
				chk = chk + hobby[i] + ",";
			}
		}
		System.out.println("체크:" + chk); //체크박스 정상 가동 확인

		try{
			String sql = "update stud1220 set name=?, dept=?, position=?, address=?, phone=?, hobby=? where studno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, dept);
			pstmt.setString(3, position);
			pstmt.setString(4, address);
			pstmt.setString(5, phone);
			pstmt.setString(6, chk);
			pstmt.setString(7, studno);
			pstmt.executeUpdate();
			System.out.println("수정 성공");
			%>
			 <script>
			 	alert('수정이 완료되었습니다!');
			 	location.href="/HRD_1220/stud1220/selectStud.jsp"
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