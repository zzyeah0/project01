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
<script>
	function checkFile() {
		var fm = document.fileForm;
		var fnm = fm.uploadFile;
		var ext = fnm.value;
		
		if(!(ext.substr(ext.length-3) == 'cvs')) {
			alert("CVS 파일만 업로드 가능합니다.");
			return false;
		}
		fm.submit();
	}
</script>
	<jsp:include page="/header.jsp" />
	<div class="pages">
		<table>
			<tr>
				<td><h4 class="text-blue">STEP1. 데이터 전처리</h4></td>	
				<td><img src="./image/next.png" class="next-img" alt="" /></td>			
				<td><h4 class="text-grey">STEP2. 학습 설정</h4></td>
				<td><img src="./image/next.png" class="next-img" alt="" /></td>
				<td><h4 class="text-grey">STEP3. 학습</h4></td>
				<td><img src="./image/next.png" class="next-img" alt="" /></td>
				<td><h4 class="text-grey">STEP4. 학습 결과</h4></td>				
			</tr>
			<tr>
				<td><br /></td>
			</tr>
		</table>
		<form action="<%= application.getContextPath() %>/dataUpload.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th><h4>학습데이터 선택</h4></th>
				<td colspan="7">					
					<input type="file" name="file"/>
				</td>
				<td>
					<input type="submit" value="업로드" class="btn blue"/>			
				</td>
			</tr>
		</table>
		</form>
		<table>
			<tr>
				<td><h4>데이터 탐색</h4></td>
				<td colspan="6"></td>
				<td>전체 데이터 수: <br/>전체 컬럼 수: </td>
			</tr>
			<tr>
				<th>변수명</th>
				<th>변수 유형</th>
				<th>결측 건수</th>
				<th>유일값</th>
				<th>최소값</th>
				<th>최대값</th>
				<th>평균</th>
				<th>표준편차</th>
			</tr>			
		</table>		
		<input type="button" disabled value="전처리 시작하기"/>		
	</div>
</body>
</html>