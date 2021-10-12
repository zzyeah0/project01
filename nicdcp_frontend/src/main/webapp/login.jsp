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
			<img src="./image/NIC-DCP.png" alt="logo" class="loginLogo" />	
			<form method="post" action="<%=request.getContextPath() %>/login.do"> 			
				<table>
						<tr>
							<td><img class="loginImg" src="./image/userID.png" /></td>
							<td><input type="text" class="loginInput" name="emp_id" maxlength="20" /></td>
						</tr>
						<tr>
							<td><img class="loginImg" src="./image/userPWD.png" /></td>
							<td><input type="password" class="loginInput" name="emp_pwd" maxlength="20" /></td>
						</tr>
						<tr>								
							<td colspan="2">										
								<input type="submit" class="btn blue btn-long" value="로그인" />
								<br /><a href="lostpwd.jsp" style="color:#BFBFBF;">비밀번호를 잊었을 때</a>
							</td>
						</tr>
				</table>								
			</form>
		</div>			
	</div>	

</body>
</html>