<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class="pages">
		<form action="<%=request.getContextPath() %>/config.do" method="post">		
			<table>
				<tr>
					<th colspan="3">보안을 위해 비밀번호를 입력해주세요.<hr /></th>
				</tr>
				<tr>
					<td><img class="loginImg" src="./image/userPWD.png" /></td>
					<td><input type="password" class="loginInput" name="emp_pwd" maxlength="20" /></td>
					<td><input type="submit" class="blue-btn" value="확인"/></td>
				</tr>
			</table>
			<input type="hidden" value="${emp_id}" name="emp_id"/>
		</form>
	</div>
</body>
</html>