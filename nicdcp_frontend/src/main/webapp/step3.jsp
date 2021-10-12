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
		<table>
			<tr>
				<td>STEP1. 데이터 전처리</td>
				<td></td>
				<td>STEP2. 학습 설정</td>
				<td></td>
				<td>STEP3. 학습</td>
				<td></td>
				<td>STEP4. 학습 결과</td>
			</tr>
		</table>
		<input type="button" onclick="location.href='step4.jsp'" value="다음" />		
	</div>
</body>
</html>