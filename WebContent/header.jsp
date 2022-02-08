<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
*{
	margin:0;
	padding:0;
}
html, body{
	width:100%;
	height:100%;
}
header{
	width:100%;
	height:15%;
	background:steelblue;
	color:white;
	text-align:center;
	font-size:1.8em;
	font-weight:bold;
	line-height:120px;
}
nav{
	width:100%;
	height:5%;
	background:grey;
	color:white;
	text-align:center;
	font-size:1.1em;
	font-weight:bold;
	line-height:50px;
}
nav ul{
	display:inline-block;
	list-style-type:none;
}
nav li{
	float:left;
	margin: 0 20px;
}
nav a{
	display:block;
	text-decoration:none;
	color:white;
}
section{
	width:100%;
	height:75%;
}
section h2{
	text-align:center;
	margin:15px auto;
}
section h3{
	text-align:center;
	margin:15px auto;
	font-size:1.3em;
}
table{
	margin:0 auto;
	border: 2px solid black;
	border-collapse:collapse;
}
tr,th,td {
	border: 1px solid grey;
}
footer{
	width:100%;
	height:5%;
	background:grey;
	color:white;
	text-align:center;
	font-size:0.8em;
	line-height:50px;
}
#tr_btn{
	height:45px;
}
#btn1{
	width:120px;
	height:25px;
	background:lightgrey;
}
#btn2{
	width:120px;
	height:25px;
	background:black;
	color:white;
}
.btn_group{
	margin:10px auto;
}
</style>
</head>
<body>
	<header>수강신청 도우미 사이트</header>
</body>
</html>