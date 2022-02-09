<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 조회</title>
<style>
th {
	height: 35px;
	background: lightgrey;
	border-bottom: 2px soild black;
}
td {
	height: 28px;
	text-align:center;
}
p{
	margin-left:5px;
}
.cnt{
	display:table;
	width:700px;
	margin:0 auto;
	font-size:0.9em;
}
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
			<%
			int cnt = 0;
			
			try{
				String sql = "select count(*) from teacher1220";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					cnt = rs.getInt(1);
				}						
				
			}catch(SQLException e){
				System.out.println("cnt 조회 실패");
				e.printStackTrace();
			}
		%>
		<br>
		<h3>강사 목록</h3>
		<div class="cnt">
			<p>총 <b><%=cnt %>명</b>의 강사가 있습니다.</p>
		</div>
		<table>
			<tr>
				<th width=80>강사코드</th>
				<th width=100>강사명</th>
				<th width=200>전공</th>
				<th width=200>세부전공</th>
				<th width=120>관리</th>
			</tr>
		<%
		
			try{
				String sql = "select * from teacher1220 order by idx";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					String idx = rs.getString(1);
					String name = rs.getString(2);
					String major = rs.getString(3);
					String field = rs.getString(4);
					System.out.println("데이터 조회 성공");
		%>
			<tr>
				<td><%=idx %></td>
				<td><%=name %></td>
				<td><%=major %></td>
				<td><%=field %></td>
				<td><a href="/HRD_1220/teacher1220/updateTeacher.jsp?idx=<%=idx %>">수정</a>
				<span>|</span>
				<a href="/HRD_1220/teacher1220/deleteTeacher.jsp?idx=<%=idx %>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))	{return false;}">삭제</a></td>
			</tr>			
		<%
				}
				
			}catch(SQLException e){
				System.out.println("데이터 조회 실패");
				e.printStackTrace();
			}
		%>
		</table>
		<div class="btn_group" align=center>
		<input id="btn2" type="button" value="작성" onclick="location.href='/HRD_1220/sub1220/addSub.jsp'">
		</div>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>