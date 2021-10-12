<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/nicdcp.css">
<title>NICDCP</title>
</head>
<body>
	<div class="container">		
		<div class="loginBox">			
			<form action="<%=request.getContextPath() %>/getCode.do" method="post">		
				<table id="lostPwdTb">
					<tr>
						<td>
						<p class="title">비밀번호 변경하기</p>
						<hr class="step-bar liblue2"/><hr class="step-bar liblue"/><hr class="step-bar liblue"/>
						</td>
					</tr>
					<tr>
						<td>사번을 입력해주세요.<br/><input class="loginInput" name="emp_id" type="text" /></td>
					</tr>			
					<tr>
						<td>이메일주소를 입력해주세요.<br/><input class="loginInput" name="emp_email" type="text" /></td>
					</tr>			
					<tr>					
						<td><input class="btn blue btn-long" type="submit" value="인증코드 받기" /></td>
					</tr>
				</table>		
			</form>
			</div>
		</div>	
</body>
</html>