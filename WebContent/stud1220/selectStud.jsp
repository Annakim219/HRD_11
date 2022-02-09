<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사 정보 목록</title>
<style>
th {
	height: 40px;
	background: lightgrey;
	border-bottom: 2px soild black;
}
td {
	height: 30px;
}
p{
	margin-left:5px;
}
.cnt{
	display:table;
	width:1100px;
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
				String sql = "select count(*) from stud1220";
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
		<h3>학사 정보 목록</h3>
		<div class="cnt">
			<p>총 <b><%=cnt %>명</b>의 학사정보가 있습니다.</p>
		</div>
		<table>
			<tr>
				<th width=100>학번</th>
				<th width=100>성명</th>
				<th width=50>학과</th>
				<th width=50>학년</th>
				<th width=230>주소</th>
				<th width=150>연락처</th>
				<th width=320>취미</th>
				<th width=100>관리</th>
			</tr>
		<%
			try{
				String sql = "select * from stud1220 order by studno";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					String studno = rs.getString(1);
					String name = rs.getString(2);
					String dept = rs.getString(3);
					String position = rs.getString(4);
					String address = rs.getString(5);
					String phone = rs.getString(6);
					String hobby = rs.getString(7);
					System.out.println("데이터 조회 성공");
		%>
			<tr>
				<td align=center><%=studno %></td>
				<td align=center><%=name %></td>
				<td align=center><%=dept %></td>
				<td align=center><%=position %></td>
				<td><p><%=address %></p></td>
				<td align=center><%=phone %></td>
				<td><p><%=hobby %></p></td>
				<td align=center><a href="/HRD_1220/stud1220/updateStud.jsp?studno=<%=studno %>">수정</a>
				<span>|</span>
				<a href="/HRD_1220/stud1220/deleteStud.jsp?studno=<%=studno %>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))	{return false;}">삭제</a></td>
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
		<input id="btn2" type="button" value="학사정보 추가" onclick="location.href='/HRD_1220/stud1220/addStud.jsp'">
		</div>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>