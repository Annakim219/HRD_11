<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교과목 조회</title>
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
	width:720px;
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
				String sql = "select count(*) from sub1220";
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
		<h3>교과목 목록</h3>
		<div class="cnt">
			<p>총 <b><%=cnt %>개</b>의 교과목이 있습니다.</p>
		</div>
		<table>
			<tr>
				<th width=80>과목코드</th>
				<th width=200>과목명</th>
				<th width=50>학점</th>
				<th width=80>담당강사</th>
				<th width=50>요일</th>
				<th width=80>시작시간</th>
				<th width=80>종료시간</th>
				<th width=100>관리</th>
			</tr>
		<%
			DecimalFormat df = new DecimalFormat("0000");
		
			try{
				String sql = "select * from sub1220 order by id";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					String id = rs.getString(1);
					String subject_name = rs.getString(2);
					String credit = rs.getString(3);
					String lecturer = rs.getString(4);
					String week = rs.getString(5);
					String start_hour = rs.getString(6);
					String end_hour = rs.getString(7);
					System.out.println("데이터 조회 성공");
		%>
			<tr>
				<td><%=id %></td>
				<td><%=subject_name %></td>
				<td><%=credit %></td>
				<td><%=lecturer %></td>
				<td><%=week %></td>
				<td><%=df.format(Integer.parseInt(start_hour)) %></td>
				<td><%=df.format(Integer.parseInt(end_hour)) %></td>
				<td><a href="/HRD_1220/sub1220/updateSub.jsp?id=<%=id %>">수정</a>
				<span>|</span>
				<a href="/HRD_1220/sub1220/deleteSub.jsp?id=<%=id %>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))	{return false;}">삭제</a></td>
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