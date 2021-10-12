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
<script src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	
	$.ajax({
		type: "GET",
		url: "/",
		data: data,
		success: success,
		dataType: text
	});
</script>
</head>
<body>
	<jsp:include page="/header.jsp" />
	<c:set var="dto" value="${dto }" />
	<div class="pages">
		<input type="button" class="grey-btn" onclick="history.back()" value="목록으로" />
		<input type="button" class="blue-btn" value="인쇄" />
		<table style="min-width: 800px;">			
			<tr>
				<td><br /><h4>학습 정보</h4></td>
			</tr>
			<tr>
				<th>데이터셋 파일명</th>
				<td colspan="3">${dto.getDataset_file() }</td>
			</tr>
			<tr>
				<th>학습 일시</th>
				<td>${dto.getLearning_date() }</td>
				<th>학습 담당자</th>
				<td>${dto.getLearning_emp() }</td>
			</tr>
			<tr>
				<th>Batch Size</th>
				<td>${dto.getBatchsize() }</td>
				<th>Epoch</th>
				<td>${dto.getEpoch() }</td>
			</tr>
			<tr>
				<td><br /><h4>데이터 전처리 내역</h4></td>				
			</tr>
			<tr>
				<td></td>				
				<th>전처리 전</th>
				<th>전처리 후</th>
			</tr>
			<tr>				
				<th>데이터 수</th>
				<td>${dto.getData_num() }</td>
				<td>${dto.getData_num_after() }</td>
			</tr>
			<tr>
				<th>컬럼 수</th>
				<td>${dto.getCol_num() }</td>
				<td>${dto.getCol_num_after() }</td>
				<td><input type="button" value="자세히" /></td>
			</tr>
			<tr>
				<td colspan="2"><br /><h4>특성 분류 및 이상거래탐지 모델 학습 결과</h4></td>
				<td colspan="2"><br /><h4>의심탐지모델 임계치 설정</h4></td>
			</tr>
			<tr>
				<td colspan="2">그래프</td>				
				<td colspan="2"><br />
					<table style="width: 100%; text-align: center;">
						<tr>
							<td>의심탐지 수</td>
							<td style="text-align: left;">${dto.getDnum_1() }</td>
							<td>${dto.getDnum_10() }</td>
							<td style="text-align: right;">${dto.getDnum_19() }</td>
						</tr>
						<tr>		
							<td></td>					
							<td colspan="3" style="padding: 10px;">
								<input type="range" id="rangeThold" min="1" max="19" step="1"/>
							</td>
						</tr>
						<tr>
							<td>임계치</td>
							<td style="text-align: left;">${dto.getThreshold_1() }</td>
							<td>${dto.getThreshold_10() }</td>
							<td style="text-align: right;">${dto.getThreshold_19() }</td>
						</tr>
						<tr>
							<td colspan="4">
								<br />
								임계치: <input type="text" size="5" id="selThold" value="" readonly/>&nbsp;&nbsp;&nbsp;
								의심탐지 수: <input type="text" size="5" id="selDnum" value="" readonly/>&nbsp;
								<input type="button" value="적용" />
								<br />
								<span>※ 권장 임계치: ${dto.getThreshold_10() } </span>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>