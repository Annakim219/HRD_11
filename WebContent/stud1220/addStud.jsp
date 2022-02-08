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
	<section>
		<br>
		<h2>학사 정보 등록 화면</h2>
		<form name="form" method="post" action="addStud_process.jsp">
			<table>
				<tr>
					<th>학 번</th>
					<td><input id="in1" type="text" name="studno"></td>
				</tr>
				<tr>
					<th>성 명</th>
					<td><input id="in1" type="text" name="name"></td>
				</tr>
				<tr>
					<th>학 과</th>
					<td><select id="sel1" name="dept">
							<option value="1" selected>컴퓨터공학과</option>
							<option value="2">기계공학과</option>
							<option value="3">전자과</option>
							<option value="4">영문학과</option>
							<option value="5">일어과</option>
							<option value="6">경영학과</option>
							<option value="7">무역학과</option>
							<option value="8">교육학과</option>
					</select></td>
				</tr>
				<tr>
					<th>학 년</th>
					<td>
					<input id="rad1" type="radio" name="position" value="1" checked>1학년
					<input type="radio" name="position" value="2">2학년
					<input type="radio" name="position" value="3">3학년 
					<input type="radio" name="position" value="4">4학년</td>
				</tr>
				<tr>
					<th>취 미</th>
					<td>
					<input id="chk1" type="checkbox" name="hobby" value="프로그램">프로그램
					<input type="checkbox" name="hobby" value="독서">독서				
					<input type="checkbox" name="hobby" value="등산">등산	
					<input type="checkbox" name="hobby" value="여행">여행	
					<input type="checkbox" name="hobby" value="낚시">낚시	
					<input type="checkbox" name="hobby" value="영화보기">영화보기	
					<input type="checkbox" name="hobby" value="잠자기">잠자기	
					<input type="checkbox" name="hobby" value="멍때리기">멍때리기
					</td>
				<tr>
					<th>주 소</th>
					<td><input id="in2" type="text" name="address"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input id="in1" type="text" name="phone"></td>
				</tr>
				<tr id="tr_btn">
					<td colspan=2 align=center>
					<input id="btn1" type="button" value="등록" onclick="check()">
					<input id="btn1" type="button" value="취소" onclick="location.href='/HRD_1220/index.jsp'"></td>
				</tr>									
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>