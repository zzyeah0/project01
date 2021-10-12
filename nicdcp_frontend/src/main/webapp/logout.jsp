<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	session.invalidate(); 	// 모든 세션 속성을 만료시키는 메서드
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/nicdcp.css">
<title>NICDCP</title>
</head>
<body>
	
	<script type="text/javascript">
		alert("로그아웃 되었습니다.");
		location.href="index.jsp";
	</script>
	
</body>
</html>