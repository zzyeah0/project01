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
		<div class="filter">
			<form action="report.do" method="post">
			<table>
				<tr>
					<th>학습 일시</th>
					<td>										
						<select name="learningDate">
							<option value="">선택</option>
							<c:if test="${!empty list }">		
							<c:forEach items="${list }" var="dto">
							<option value="${dto.getLearning_id() }">${dto.getLearning_date() }</option>
							</c:forEach>
							</c:if>
							<c:if test="${empty list }">
							<option value="">저장된 학습 내역이 없습니다.</option>
							</c:if>
						</select>					
					</td>					
					<td>
						<input type="submit" class="btn blue" value="조회" />
					</td>
				</tr>
			</table>
			</form>			
		</div>
		<input type="button" class="btn liblue" value="다운로드"	/>
		<table class="report-tb">
			<tr>
				<td><br /><h4>학습 데이터 내역</h4></td>
			</tr>
			<tr>
				<th>데이터셋 파일명</th>
				<td colspan="5"></td>
			</tr>
			<tr>
				<th>전체 데이터 수</th>
				<td></td>
				<th>전체 컬럼 수</th>
				<td></td>
				<th>학습 담당자</th>
				<td></td>
			</tr>
		</table>		
		<table class="report-tb">
			<tr>
				<td><br /><h4>원본 데이터</h4></td>
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
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><br /><h4>전처리 데이터</h4></td>
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
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<table class="report-tb">
			<tr>
				<td><br /><h4>학습 데이터 전처리 결과</h4></td>
			</tr>
			<tr>
				<td></td>
				<th>전처리 전</th>
				<th>전처리 후</th>
				<th rowspan="3">제거된 데이터</th>
				<th rowspan="3">이상값</th>
				<td rowspan="3">개</td>
				<th rowspan="3">결측값</th>
				<td rowspan="3">개</td>
			</tr>
			<tr>
				<th>데이터 수</th>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<th>컬럼 수</th>
				<td></td>
				<td></td>
			</tr>	
		</table>
		<table class="report-tb">
			<tr>
				<td><br /><h4>데이터 전처리 기준</h4></td>
			</tr>
			<tr>
				<th>이상값</th>
				<th>결측값</th>
			</tr>
			<tr>
				<td>
					<p>다음과 같은 범위에 해당하는 값을 이상값이라고 정의하고 제거</p>
					<p>제 1사분위 수 - 1.5 x (제 3사분위 수 - 제 1사분위 수)</p>
					<p>제 3사분위 수 + 1.5 x (제 3사분위 수 - 제 1사분위 수)</p>	
				</td>
				<td>
					<p>결측값이 전체 데이터 수의 1% 미만인 경우, 행을 제거함</p>
					<p>반대의 경우는 열을 제거함</p>
				</td>
			</tr>
		</table>
		<table class="report-tb">
			<tr>
				<td><br /><h4>학습 데이터 변수 선택</h4></td>
			</tr>
			<tr>
				<td colspan="6">
					<img src="./image/graph.png" alt="" />
				</td>
			</tr>
			<tr>
				<th>최적 변수 개수</th>
				<td>7</td>
				<th>모델 정확도</th>
				<td>0.824</td>
				<th>변수 중요도</th>
				<td>5.4 이상</td>
			</tr>
			<tr>
				<td colspan="6">
					<img src="./image/graph2.png" alt="" />
				</td>
			</tr>			
		</table>
		<table class="report-tb">
			<tr>
				<td><br /><h4>선택된 변수</h4></td>				
			</tr>
			<tr>
				<th>변수명</th>
				<th>변수 중요도</th>
				<td rowspan="3">
					<div class="explainBox">
						<p>변수 선택 기준</p>
						<p>반복적 변수 제거법(REF, Recursive Feature Elimination)</p>
						<p>원하는 개수의 변수가 남을 때까지 변수를 하나씩 제거하는 방법</p>
						<p>랜덤 포레스트(Random Forest) 모델을 이용하여 변수의 중요도를 계산하고, 원하는 개수의 변수를 선택한다.</p>
					</div>
				</td>
			</tr>
			<tr>
				<td>거래채널</td>
				<td>8</td>
			</tr>			
		</table>		
		<table class="report-tb">
			<tr>
				<td><br /><h4>학습 결과</h4></td>
			</tr>
			<tr>
				<th>학습 정보</th>
			</tr>
			<tr>
				<th>Batch Size</th>
				<td></td>
				<th>Epoch</th>
				<td></td>
				<th>의심탐지모델 임계치</th>
				<td></td>
			</tr>
			<tr>
				<td colspan="3"><br /><h4>모델 성능</h4></td>
				<td colspan="3"><br /><h4>탐지개요</h4></td>
			</tr>
			<tr>
				<td colspan="3"><img src="./image/performance.png" alt="" /></td>
				<td colspan="3">
					<table>
						<tr>
							<td></td>
							<th>총 건수</th>
							<th>정상</th>
							<th>이상</th>
						</tr>
						<tr>
							<td>정상 탐지 건수</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>이상 탐지 건수</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>의심 탐지 건수</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>				
				</td>
			</tr>
		</table>
		
	</div>
</body>
</html>