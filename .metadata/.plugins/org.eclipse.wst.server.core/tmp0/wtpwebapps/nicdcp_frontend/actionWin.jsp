<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="css/nicdcp.css">
<title>�����ϱ�</title>
</head>
<body class="ligrey">	
	<c:set var="dto" value="${list }" />
	<c:set var="a_dto" value="${dto }" />
	<div id="actionWin">	
		<h4>���� �� �̻� ���� �Է�</h4>
		<table>
			<tr>
				<th>�ŷ�����</th>
				<td>
					<c:if test="${dto.getTran_ab()==1}">���� �ŷ�</c:if>
					<c:if test="${dto.getTran_ab()==2}">�̻� �ŷ�</c:if>
					<c:if test="${dto.getTran_ab()==3}">�ǽ� �ŷ�</c:if>
				</td>
			</tr>
			<tr>
				<th>�з� �ٰ�</th>
				<td><input type="button" value="Ȯ��" /></td>
			</tr>
			<tr>
				<th>�̻� ����</th>
				<td>
					<input type="radio" name="tran_ab" value="" />���� �ŷ�
					<input type="radio" name="tran_ab" value="" />�̻� �ŷ�								
				</td>
			</tr>
			<tr>
				<th>����</th>
				<td><textarea name="" id="" cols="40" rows="5"></textarea></td>
			</tr>
			<tr>
				<th>���� ��Ȳ</th>
				<td>
					<label for="checking"><input type="radio" id="checking" name="act_prg" value="" />Ȯ�� ��</label>
					<label for="acting"><input type="radio" id="acting" name="act_prg" value="" />��ġ ��</label>
					<label for="acted"><input type="radio" id="acted" name="act_prg" value="" />��ġ �Ϸ�</label>
					<label for="checked"><input type="radio" id="checked" name="act_prg" value="" />����ŷ� Ȯ�οϷ�</label>
				</td>
			</tr>
			<tr>
				<th>��ġ ���</th>
				<td>
					<input type="checkbox" />���� Ȯ��
					<input type="checkbox" />�ŷ� ����
				</td>
			</tr>
			<tr>
				<th>����</th>
				<td><textarea name="" id="" cols="40" rows="5"></textarea></td>
			</tr>
			<tr>
				<th>���� �̷�</th>
			</tr>
			<tr>
				<td colspan="2">
					<table>
						<tr>
							<th>�Ͻ�</th>
							<th>��ġ��</th>
							<th>�����Ȳ</th>
							<th>��ġ ���</th>
							<th>����</th>
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