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
	<c:set var="list" value="${list }" />
	<div class="pages">
		<form action="empDelete.do" method="post">
		<table>
			<tr>
				<td colspan="5"></td>
				<td><input type="submit" value="삭제" /></td>
			</tr>
			<tr align="center">
				<th></th><th>No.</th><th>사번</th><th>이름</th><th>직위</th><th>내선번호</th>
			</tr>
			<c:if test="${!empty list }">
			<c:forEach items="${list }" var="dto">
				<tr align="center">
					<td><input type="checkbox" name="no" value="${dto.getEmp_no() }" /></td>
					<td>${dto.getEmp_no() }</td>
					<td><a href="empDetail.do?no=${dto.getEmp_no() }">${dto.getEmp_id() }</a></td>
					<td>${dto.getEmp_name() }</td>
					<td>${dto.getEmp_posi() }</td>
					<td>${dto.getEmp_phone() }</td>
				</tr>				
			</c:forEach>				
			</c:if>
			<c:if test="${empty list }">
				<tr>
					<td colspan="5">등록된 계정이 없거나 일시적 오류로 불러올 수 없습니다.</td>
				</tr>
			</c:if>					
		</table>
		</form>
	</div>
</body>
</html>