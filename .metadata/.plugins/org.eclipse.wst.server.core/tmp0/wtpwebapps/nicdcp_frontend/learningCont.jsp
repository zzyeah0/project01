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
	<c:set var="dto" value="${list }" />
	<div class="pages">
		<input type="button" class="grey-btn" onclick="history.back()" value="목록으로" />
		<input type="button" class="blue-btn" value="인쇄" />
		<table>			
			<tr>
				<th>학습 정보</th>
			</tr>
			<tr>
				<td>데이터셋 파일명</td>
				<td colspan="3">${dto.getDataset_file() }</td>
			</tr>
			<tr>
				<td>학습 일시</td>
				<td>${dto.getLearning_date() }</td>
				<td>학습 담당자</td>
				<td>${dto.getLearning_emp() }</td>
			</tr>
			<tr>
				<td>Batch Size</td>
				<td>${dto.getBatchsize() }</td>
				<td>Epoch</td>
				<td>${dto.getEpoch() }</td>
			</tr>
			<tr>
				<th>데이터 전처리 내역</th>				
			</tr>
			<tr>
				<td></td>				
				<td>전처리 전</td>
				<td>전처리 후</td>
			</tr>
			<tr>				
				<td>데이터 수</td>
				<td>${dto.getData_num() }</td>
				<td>${dto.getData_num_after() }</td>
			</tr>
			<tr>
				<td>컬럼 수</td>
				<td>${dto.getCol_num() }</td>
				<td>${dto.getCol_num_after() }</td>
				<td><input type="button" value="자세히" /></td>
			</tr>
			<tr>
				<th colspan="2">특성 분류 및 이상거래탐지 모델 학습 결과</th>
				<th colspan="2">의심탐지모델 임계치 설정</th>
			</tr>
			<tr>
				<td colspan="2">그래프</td>				
				<td colspan="2">
					<input type="range" list="threshold" value="${dto.getThreshold_10() }"/>
					<datalist id="threshold">
						<option value="${dto.getThreshold_2() }"></option>
						<option value="${dto.getThreshold_3() }"></option>
						<option value="${dto.getThreshold_4() }"></option>
						<option value="${dto.getThreshold_5() }"></option>
						<option value="${dto.getThreshold_6() }"></option>
						<option value="${dto.getThreshold_7() }"></option>
						<option value="${dto.getThreshold_8() }"></option>
						<option value="${dto.getThreshold_9() }"></option>
						<option value="${dto.getThreshold_10() }"></option>
						<option value="${dto.getThreshold_11() }"></option>
						<option value="${dto.getThreshold_12() }"></option>
						<option value="${dto.getThreshold_13() }"></option>
						<option value="${dto.getThreshold_14() }"></option>
						<option value="${dto.getThreshold_15() }"></option>
						<option value="${dto.getThreshold_16() }"></option>
						<option value="${dto.getThreshold_17() }"></option>
						<option value="${dto.getThreshold_18() }"></option>
						<option value="${dto.getThreshold_19() }"></option>
					</datalist>
					<input type="text" id="selectedThreshold" readonly/>
					<input type="text" readonly/>
					<input type="button" value="적용" />
				</td>
			</tr>
		</table>
	</div>
</body>
</html>