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
		<form method="post" action="<%=request.getContextPath() %>/signUp.do">
			<table>
				<tr>
					<td colspan="2" align="right">
					<input type="button" class="liblue-btn" value="검색하기" />
					</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="new_id"/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>초기값은 'nic1234!'입니다.</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="new_name"/></td>
				</tr>
				<tr>
					<td>직위</td>
					<td><input type="text" name="new_posi"/></td>
				</tr>
				<tr>
					<td>이메일주소</td>
					<td><input type="text" name="new_email"/></td>
				</tr>
				<tr>
					<td>내선번호</td>
					<td><input type="text" name="new_phone"/></td>
				</tr>
				<tr>
					<td>ip주소</td>
					<td><input type="text" name="new_ip"/></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" class="blue-btn" value="등록"/><input type="button" class="grey-btn" value="취소"/></td>					
				</tr>
			</table>
						
		</form>
	</div>
</body>
</html>