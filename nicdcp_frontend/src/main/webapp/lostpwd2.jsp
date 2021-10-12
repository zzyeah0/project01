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
	<form action="<%=request.getContextPath() %>/getCode.do" method="post">
	<div class="loginBox">		
		<table>
			<tr>
				<td>
				<p class="title">비밀번호 변경하기</p>
				<hr class="now-step-bar"/><hr class="now-step-bar"/><hr class="step-bar"/>
				</td>
			</tr>
			<tr>
				<td>이메일로 받은 인증코드를 입력해주세요.<br/><input class="loginInput" name="code" type="text" /></td>
			</tr>			
			<tr>
				<td style="padding: 5px 50px;"><input class="btn btn-primary form-control" type="submit" value="인증" /></td>
			</tr>
		</table>		
	</div>
	</form>
</body>
</html>