<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="css/nicdcp.css">
<title>대응하기</title>
</head>
<body class="ligrey">	
	<c:set var="dto" value="${list }" />
	<c:set var="a_dto" value="${dto }" />
	<div id="actionWin">	
		<h4>대응 및 이상 여부 입력</h4>
		<table>
			<tr>
				<th>거래구분</th>
				<td>
					<c:if test="${dto.getTran_ab()==1}">정상 거래</c:if>
					<c:if test="${dto.getTran_ab()==2}">이상 거래</c:if>
					<c:if test="${dto.getTran_ab()==3}">의심 거래</c:if>
				</td>
			</tr>
			<tr>
				<th>분류 근거</th>
				<td><input type="button" value="확인" /></td>
			</tr>
			<tr>
				<th>이상 여부</th>
				<td>
					<input type="radio" name="tran_ab" value="" />정상 거래
					<input type="radio" name="tran_ab" value="" />이상 거래								
				</td>
			</tr>
			<tr>
				<th>설명</th>
				<td><textarea name="" id="" cols="40" rows="5"></textarea></td>
			</tr>
			<tr>
				<th>진행 상황</th>
				<td>
					<label for="checking"><input type="radio" id="checking" name="act_prg" value="" />확인 중</label>
					<label for="acting"><input type="radio" id="acting" name="act_prg" value="" />조치 중</label>
					<label for="acted"><input type="radio" id="acted" name="act_prg" value="" />조치 완료</label>
					<label for="checked"><input type="radio" id="checked" name="act_prg" value="" />정상거래 확인완료</label>
				</td>
			</tr>
			<tr>
				<th>조치 방식</th>
				<td>
					<input type="checkbox" />유선 확인
					<input type="checkbox" />거래 차단
				</td>
			</tr>
			<tr>
				<th>설명</th>
				<td><textarea name="" id="" cols="40" rows="5"></textarea></td>
			</tr>
			<tr>
				<th>대응 이력</th>
			</tr>
			<tr>
				<td colspan="2">
					<table>
						<tr>
							<th>일시</th>
							<th>조치자</th>
							<th>진행상황</th>
							<th>조치 방식</th>
							<th>설명</th>
						</tr>
						<tr>
							
						</tr>
					</table>				
				</td>
			</tr>
		</table>
	</div>
</body>
</html>