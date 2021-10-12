<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<jsp:include page="/header.jsp" />
	<input type="hidden" name="configChk" value="adminConfig" />	
	<div class="pages">
		<table>
			<tr>
				<td><a class="volume" href="signup.jsp">계정 등록</a></td>
				<td><a class="volume" href="emplist.do">계정 관리</a></td>
			</tr>
			<tr>
				<td><a class="volume" href="#">환경 설정</a></td>
				<td><a class="volume" href="config.do">정보 수정</a></td>
			</tr>
		</table>	
	</div>
</body>
</html>