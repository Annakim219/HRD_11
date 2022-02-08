<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사 정보 추가</title>
<style>
tr{
	height:30px;
}
th{
	width:150px;
	background:lightgrey;
}
td{
	width:530px;
}
#in1{
	margin-left:1px;
	height:22px;
	width:40%;
}
#in2{
	margin-left:1px;
	height:22px;
	width:99%;
}
#sel1{
	margin-left:1px;
	height:25px;
	width:35%;
}
#chk1{
	margin-left:5px;
}
#rad1{
	margin-left:5px;
}
</style>
<script>
	function check(){
		if(document.form.studno.value==""){
			alert("학번이 입력되지 않았습니다.");
			document.form.studno.focus();
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
	<%
		String send_studno = request.getParameter("studno");
	
		try{
			String sql = "select * from stud1220 where studno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_studno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String studno = rs.getString(1);
				String name = rs.getString(2);
				String dept = rs.getString(3);
				String position = rs.getString(4);
				String address = rs.getString(5);
				String phone = rs.getString(6);
				String hobby = rs.getString(7);
				String arr[] = hobby.split(",");
				System.out.println("데이터 조회 성공");
		%>

	<section>
		<br>
		<h2>학사 정보 등록 화면</h2>
		<form name="form" method="post" action="updateStud_process.jsp">
			<table>
				<tr>
					<th>학 번</th>
					<td><input id="in1" type="text" name="studno" value="<%=studno %>" readonly></td>
				</tr>
				<tr>
					<th>성 명</th>
					<td><input id="in1" type="text" name="name" value="<%=name %>" readonly></td>
				</tr>
				<tr>
					<th>학 과</th>
					<td><select id="sel1" name="dept">
							<option value="1" <%if(dept.equals("1")){%>selected<%}%>>컴퓨터공학과</option>
							<option value="2" <%if(dept.equals("2")){%>selected<%}%>>기계공학과</option>
							<option value="3" <%if(dept.equals("3")){%>selected<%}%>>전자과</option>
							<option value="4" <%if(dept.equals("4")){%>selected<%}%>>영문학과</option>
							<option value="5" <%if(dept.equals("5")){%>selected<%}%>>일어과</option>
							<option value="6" <%if(dept.equals("6")){%>selected<%}%>>경영학과</option>
							<option value="7" <%if(dept.equals("7")){%>selected<%}%>>무역학과</option>
							<option value="8" <%if(dept.equals("8")){%>selected<%}%>>교육학과</option>
					</select></td>
				</tr>
				<tr>
					<th>학 년</th>
					<td>
					<input id="rad1" type="radio" name="position" value="1" <%if(position.equals("1")){%>checked<%}%>>1학년
					<input type="radio" name="position" value="2" <%if(position.equals("2")){%>checked<%}%>>2학년
					<input type="radio" name="position" value="3" <%if(position.equals("3")){%>checked<%}%>>3학년 
					<input type="radio" name="position" value="4" <%if(position.equals("3")){%>checked<%}%>>4학년</td>
				</tr>
				<tr>
					<th>취 미</th>
					<td>
					<input id="chk1" type="checkbox" name="hobby" value="프로그램" <%for(int i=0;i<arr.length;i++)if("프로그램".equals(arr[i])) out.print("checked");%>>프로그램
					<input type="checkbox" name="hobby" value="독서" <%for(int i=0;i<arr.length;i++)if("독서".equals(arr[i])) out.print("checked");%>>독서				
					<input type="checkbox" name="hobby" value="등산" <%for(int i=0;i<arr.length;i++)if("등산".equals(arr[i])) out.print("checked");%>>등산	
					<input type="checkbox" name="hobby" value="여행" <%for(int i=0;i<arr.length;i++)if("여행".equals(arr[i])) out.print("checked");%>>여행	
					<input type="checkbox" name="hobby" value="낚시" <%for(int i=0;i<arr.length;i++)if("낚시".equals(arr[i])) out.print("checked");%>>낚시	
					<input type="checkbox" name="hobby" value="영화보기" <%for(int i=0;i<arr.length;i++)if("영화보기".equals(arr[i])) out.print("checked");%>>영화보기	
					<input type="checkbox" name="hobby" value="잠자기" <%for(int i=0;i<arr.length;i++)if("잠자기".equals(arr[i])) out.print("checked");%>>잠자기	
					<input type="checkbox" name="hobby" value="멍때리기" <%for(int i=0;i<arr.length;i++)if("멍때리기".equals(arr[i])) out.print("checked");%>>멍때리기
					</td>
				<tr>
					<th>주 소</th>
					<td><input id="in2" type="text" name="address" value="<%=address %>"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input id="in1" type="text" name="phone" value="<%=phone %>"></td>
				</tr>
				<tr id="tr_btn">
					<td colspan=2 align=center>
					<input id="btn2" type="button" value="목록" onclick="location.href='/HRD_1220/stud1220/selectStud.jsp'">
					<input id="btn2" type="button" value="수정" onclick="check()"></td>
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