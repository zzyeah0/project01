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
		<form action="<%=request.getContextPath() %>/step2.do" method="post">
			<table>
				<tr>
					<td><h4 class="text-blue">STEP1. 데이터 전처리</h4></td>	
					<td><img src="./image/next.png" class="next-img" alt="" /></td>			
					<td><h4 class="text-blue">STEP2. 학습 설정</h4></td>
					<td><img src="./image/next.png" class="next-img" alt="" /></td>
					<td><h4 class="text-grey">STEP3. 학습</h4></td>
					<td><img src="./image/next.png" class="next-img" alt="" /></td>
					<td><h4 class="text-grey">STEP4. 학습 결과</h4></td>	
				</tr>
				<tr>
				<td><br /></td>
				</tr>
			</table>
			<table>
				<tr>
					<td colspan="4"><h4>학습 파라미터 설정</h4></td>
				</tr>
				<tr>
					<td>BATCH SIZE</td>
					<td><input type="text" name="batchsize"/></td>
					<td>EPOCH</td>
					<td><input type="text" name="epoch" /></td>
				</tr>
			</table>
			<input type="submit" value="학습 시작" class="btn blue"/>
		</form>
	</div>
</body>
</html>