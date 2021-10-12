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
	<c:set var="dto" value="${dto }" />
	<c:set var="info" value="${info }" />
	<div class="pages">
		<input type="button" class="btn grey" onclick="history.back()" value="목록으로" />
		<input type="button" class="btn liblue" value="인쇄" />
		<table>
			<tr>
				<td colspan="6"><h4>거래정보</h4></td>
			</tr>
			<tr>
				<th>업무명</th>
				<td>${dto.getTran_name() }</td>
				<th>상품분류</th>
				<td>${dto.getTran_type() }</td>
				<th>발생일시</th>
				<td>${dto.getTran_date() }</td>
			</tr>
			<tr>
				<th>거래채널</th>
				<td>${dto.getTran_chn() }</td>
				<th>상품상세</th>
				<td></td>
				<th>대응여부</th>
				<td>
					<c:if test="${dto.getTran_act().equals('0') }">미확인
					<input type="button" class="btn coral" value="대응하기" />
					</c:if>
					<c:if test="${dto.getTran_act().equals('2') }">대응완료</c:if>
				</td>
			</tr>
			<tr>
				<th>거래유형</th>
				<td>${dto.getTran_type() }</td>
				<th>거래금액</th>
				<td>${dto.getTran_am() }</td>
				<th>이상여부</th>
				<td>
					<c:if test="${dto.getTran_ab().equals('1') }">정상</c:if>
					<c:if test="${dto.getTran_ab().equals('2') }">이상</c:if>
					<c:if test="${dto.getTran_ab().equals('3') }">의심</c:if>					
				</td>
			</tr>
			<tr>
				<td colspan="6"><h4>고객정보</h4></td>
			</tr>
			<tr>
				<th>ID No.</th>
				<td>${info.getCust_id() }</td>
				<th>고객명</th>
				<td>${info.getCust_name() }</td>
				<th>성별</th>
				<td>${info.getCust_gender() }</td>
			</tr>
			<tr>
				<th>고객유형</th>
				<td>${info.getCust_type() }</td>
				<th>생년월일</th>
				<td>${info.getCust_bdate() }</td>
				<th>전화번호</th>
				<td>${info.getCust_phone() }</td>
			</tr>
			<tr>
				<th>직업</th>
				<td>${info.getCust_job() }</td>
				<th>주소</th>
				<td colspan="3">${info.getCust_addr() }</td>
			</tr>
			<tr>
				<td colspan="6"><h4>거래 이력 조회</h4></td>
			</tr>
			<tr>
				<td colspan="6">
				<div class="filter">
					<table>
						<tr>
							<th>업무명</th>
							<td>
								<select name="" id="">
									<option value="">선택</option>
									<option value="">계좌신규</option>
									<option value="">자동이체</option>
									<option value="">가상계좌발급</option>
									<option value="">가상계좌입금</option>
									<option value="">대출신청</option>							
								</select>
							</td>
							<th>거래유형</th>
							<td>
								<select name="" id="">
									<option value="">선택</option>
									<option value="">계좌신규</option>
									<option value="">자동이체</option>
									<option value="">가상계좌발급</option>
									<option value="">가상계좌입금</option>
									<option value="">대출신청</option>							
								</select>
							</td>
							<th>상품분류</th>
							<td>
								<select name="" id="">
									<option value="">선택</option>
									<option value="">영업점</option>
									<option value="">자동화기기</option>
									<option value="">인터넷뱅킹</option>
									<option value="">스마트뱅킹</option>
									<option value="">제휴</option>
									<option value="">오픈API</option>
									<option value="">공동망</option>													
								</select>
							</td>
							<th>상품상세</th>
							<td>
								<select name="" id="">
									<option value="">선택</option>
									<option value="">계좌신규</option>
									<option value="">자동이체</option>
									<option value="">가상계좌발급</option>
									<option value="">가상계좌입금</option>
									<option value="">대출신청</option>							
								</select>
							</td>
							<tr>
								<th>거래채널</th>
								<td>
								<select name="" id="">
									<option value="">선택</option>
									<option value="">확인중</option>
									<option value="">조치중</option>
									<option value="">조치완료</option>
									<option value="">정상거래</option>														
								</select>
							</td>
							<th>거래일시</th>
							<td colspan="5">
								<input type="date" />부터					
								 <input type="date" />까지
							</td>
							</tr>
							<tr>
							<td colspan="7"></td>
							<td>
								<select name="" id="">
									<option value="5">5개씩</option>
									<option value="10">10개씩</option>
									<option value="20">20개씩</option>
									<option value="30">30개씩</option>														
								</select>
							</td>
							<td>
								<input type="submit" class="btn blue" value="조회" />
								<input type="submit" class="btn grey" value="초기화" />
							</td>
						</tr>
					</table>					
				</div>
				<table>
						<tr>
						<th>
							<input type="checkbox" name="" value="" />
						</th>
						<th>No.</th>
						<th>거래일시</th>
						<th>업무명</th>
						<th>거래유형</th>
						<th>채널</th>
						<th>상품분류</th>
						<th>상품상세</th>
						<th>거래금액</th>
						<th>지점명</th>
						<th>Device</th>
						<th>Mac Address</th>						
					</tr>					
					</table>				
				</td>
			</tr>
		</table>
	</div>
</body>
</html>