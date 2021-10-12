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
	<c:set var="dto" value="${info }"/>
	<div class="pages">
		<form action="<%=request.getContextPath() %>/configUpdate.do" method="post">
		<table>
			<tr>
				<th>이름</th>
				<td>${dto.getEmp_name()}</td>
			</tr>
			<tr>
				<th>직책</th>
				<td>${dto.getEmp_posi() }</td>
			</tr>
			<tr>
				<th>사번</th>
				<td>${dto.getEmp_id() }</td>
			</tr>
			<tr>
				<th>비밀번호 변경</th>
				<td><input class="loginInput" type="password" name="new_pwd" value="${dto.getEmp_pwd() }" /></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input class="loginInput" type="password" /></td>
			</tr>
			<tr>
				<th>이메일 주소</th>
				<td><input class="loginInput" type="text" value="${dto.getEmp_email() }" name="new_email" /></td>
			</tr>
			<tr>
				<th>내선번호</th>
				<td><input class="loginInput" type="text" value="${dto.getEmp_phone() }" name="new_phone" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" value="${dto.getEmp_no() }" name="no" />
					<input type="submit" class="blue-btn" value="변경 저장" />
					<input type="button" class="grey-btn" value="취소" />
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>