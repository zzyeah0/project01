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
	<div class="pages">	
		<form method="post" action="<%=request.getContextPath()%>/tranUpdate.do">
		<table style="min-width: 800px;" class="regi">
			<tr>
				<td colspan="6"><h4>거래 등록</h4></td>
			</tr>
			<tr>
				<th>업무명</th>
				<td>
					<select name="tran_name">
						<option value="00">선택</option>
						<option value="01">계좌신규</option>
						<option value="02">자동이체</option>
						<option value="03">가상계좌발급</option>
						<option value="04">가상계좌입금</option>
						<option value="05">대출신청</option>							
					</select>
				</td>
				<th>거래지점</th>
				<td>
					<select name="branch_name">
						<option value="00">선택</option>
						<option value="01">여의도</option>
						<option value="02">사당</option>
						<option value="03">동작</option>
						<option value="04">강남</option>
						<option value="05">노원</option>							
						<option value="06">목동</option>
						<option value="07">서교</option>
					</select>
				</td>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<th>거래채널</th>
				<td>
					<select name="tran_chn" id="">
						<option value="00">선택</option>
						<option value="01">영업점</option>
						<option value="02">자동화기기</option>
						<option value="03">인터넷뱅킹</option>
						<option value="04">스마트뱅킹</option>
						<option value="05">제휴</option>
						<option value="06">오픈API</option>
						<option value="07">공동망</option>						
					</select>
				</td>
				<th>거래유형</th>
				<td>
					<select name="tran_type" id="">
						<option value="00">선택</option>
						<option value="01">신규</option>
						<option value="02">등록</option>
						<option value="03">입금</option>
					</select>				
				</td>
				<th>거래금액</th>
				<td><input type="text" name="tran_amt" value=""/></td>				
			</tr>
			<tr>
				<th>이상여부</th>				
				<td>
					<label for="01"><input type="radio" name="tran_ab" id="01" />정상</label>
					<label for="02"><input type="radio" name="tran_ab" id="02" />이상</label>
					<label for="03"><input type="radio" name="tran_ab" id="03" />의심</label>					
				</td>
				<th>대응여부</th>
				<td>
					<c:if test="${dto.getTran_act().equals('00') }">미확인
					<input type="button" class="btn coral" value="대응하기" />
					</c:if>
					<c:if test="${dto.getTran_act().equals('02') }">대응완료</c:if>
				</td>				
			</tr>
			<tr>
				<td colspan="6"><br /><h4>고객 등록</h4></td>
			</tr>
			<tr>
				<th>ID No.</th>
				<td><input type="text" name="cust_id"/></td>
				<th>고객명</th>
				<td><input type="text" name="" /></td>
				<th>성별</th>
				<td>
					<select name="" id="">
						<option value="00">선택안함</option>
						<option value="01">남성</option>
						<option value="02">여성</option>
					</select>					
				</td>
			</tr>
			<tr>
				<th>고객유형</th>
				<td>
					<select name="" id="">
						<option value="00">선택</option>
						<option value="01">개인</option>
						<option value="02">개인사업자단독</option>
						<option value="03">개인사업자복수</option>
						<option value="04">법인</option>
					</select>
				</td>
				<th>생년월일</th>
				<td><input type="date" /></td>
				<th>전화번호</th>
				<td>
				<select name="" id="">
					<option value="">선택</option>
					<option value="">010</option>
					<option value="">02</option>
					<option value="">031</option>
					<option value="">032</option>
					<option value="">033</option>
					<option value="">041</option>
					<option value="">042</option>
					<option value="">043</option>
					<option value="">044</option>
					<option value="">051</option>
					<option value="">052</option>
					<option value="">053</option>
					<option value="">054</option>
					<option value="">055</option>
					<option value="">061</option>
					<option value="">062</option>
					<option value="">063</option>
					<option value="">064</option>
					<option value="">070</option>
				</select>
				-<input type="text" size="4" maxlength="4" />-<input type="text" size="4" maxlength="4" /></td>
			</tr>
			<tr>
				<th>직업</th>
				<td><input type="text" /></td>
				<th>주소</th>
				<td colspan="3"><input type="text" />
				</td>
			</tr>
			<tr>
				<th colspan="6">
					<br />
					<input type="submit" class="btn blue" value="등록" />
					<input type="reset" class="btn grey" value="다시 작성" />
				</th>
			</tr>
			</table>		
			</form>
	</div>
</body>
</html>