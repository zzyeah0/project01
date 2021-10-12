<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/nicdcp.css">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-targe="#bs-example-navbar-collapse-1"	aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<%=request.getContextPath() %>/dashboard.do"><img class="logo" src="./image/NIC-DCP.png"/></a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="password.jsp"><img src="./image/config.png" id="config-img" alt="" /> ${emp_name}님</a></li>				
				<li><a>${emp_ip}</a></li>
				<li><a>접속시간</a></li>
				<li><a><img src="./image/safe.png" class="invasion-monitoring-img" alt="" />안전</a></li>
				<li><button id="logout-btn" onclick="location.href='logout.do'">로그아웃</button></li>
			</ul>
		</div>
	</nav>
	<div class="vertical-nav">
		<ul class="nav navbar-left">
			<li><a href="<%=request.getContextPath() %>/dashboard.do">대시보드</a></li>
			<li><a href="<%=request.getContextPath() %>/transaction.do">거래내역조회</a></li>
			<li><a href="<%=request.getContextPath() %>/learningList.do">학습</a></li>
			<li><a href="<%=request.getContextPath() %>/report.do">리포트</a></li>
		</ul>
	</div>
</body>
</html>