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
<script>
	function initChk(){
		if(confirm('비밀번호를 초기화 하시겠습니까?')){	
			location.href='initPwd.do?no=${dto.getEmp_no() }';
		}else{
			history.back();
		}
	}
</script>
<body>
	<jsp:include page="/header.jsp" />
	<c:set var="dto" value="${dto }" />
	<div class="pages">
		<form action="" method="post">
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
				<th>이메일 주소</th>
				<td><input class="loginInput" type="text" value="${dto.getEmp_email() }" /></td>
			</tr>
			<tr>
				<th>내선번호</th>
				<td><input class="loginInput" type="text" value="${dto.getEmp_phone() }" /></td>
			</tr>
			<tr>
				<th>등록일자</th>
				<td>${dto.getCreateAt() }</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" onclick="initChk()" class="liblue-btn" value="비밀번호 초기화" />
					<p>마지막 수정 일자: ${dto.getUpdateAt()}</p>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" class="blue-btn" value="변경 저장" />
					<input type="button" class="grey-btn" value="취소" />
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>