<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 추가</title>
<style>
tr{
	height:30px;
}
th{
	width:80px;
	background:lightgrey;
}
td{
	width:350px;
}
span{
	font-size:0.8em;
}
#in1{
	margin-left:2px;
	height:22px;
	width:52%;
}

</style>
<script>
	function check(){
		if(document.form.name.value==""){
			alert("강사명이 입력되지 않았습니다.");
			document.form.name.focus();
		}else if(document.form.major.value==""){
			alert("전공이 입력되지 않았습니다.");
			document.form.major.focus();
		}else if(document.form.field.value==""){
			alert("세부전공이 입력되지 않았습니다.");
			document.form.field.focus();		
		}else{
			document.form.submit();
		}
	}
</script>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
	<% 
		String send_idx = request.getParameter("idx");
		
		try{
			String sql = "select * from teacher1220 where idx=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String idx = rs.getString(1);
				String name= rs.getString(2);
				String major = rs.getString(3);
				String field = rs.getString(4);
				System.out.println("데이터 조회 성공");
				%>
		<br>
		<h2>강사 추가</h2>
		<form name="form" method="post" action="updateTeacher_process.jsp">
			<table>
				<tr>
					<th>강사 ID</th>
					<td><input id="in1" type="text" name="idx" value="<%=idx %>">
					<span>자동증가(Sequence 발생)</span></td>
				</tr>
				<tr>
					<th>강 사 명</th>
					<td><input id="in1" type="text" name="name" value="<%=name %>"></td>
				</tr>
				<tr>
					<th>전 공</th>
					<td><input id="in1" type="text" name="major" value="<%=major %>"></td>
				</tr>
				<tr>
					<th>세부 전공</th>
					<td><input id="in1" type="text" name="field" value="<%=field %>"></td>
				</tr>
				<tr id="tr_btn">
					<td colspan=2 align=center>
					<input id="btn1" type="button" value="목록" onclick="location.href='/HRD_1220/teacher1220/selectTeacher.jsp'">
					<input id="btn1" type="button" value="수정" onclick="check()"></td>
				</tr>									
			</table>
		</form>
						<%
			}			
		}catch(SQLException e){
			System.out.println("데이터 조회 실패");
			e.printStackTrace();
		}
	%>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>