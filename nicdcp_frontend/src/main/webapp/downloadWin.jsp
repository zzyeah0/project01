<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����ϱ�</title>
</head>
<body>	
	
	<div id="downloadWin" class="popUp">		
		<table>
			<tr>
				<td><h4>������ �׸�</h4></td>
				<td><h4>�̸�����</h4></td>
			</tr>
			<tr>
				<td>
					<div>
						<table>
							<tr><td><label for="no"><input type="checkbox" id="no">No.</label></td></tr>
							<tr><td><label for="tran_name"><input type="checkbox" id="tran_name">������</label></td></tr>
						</table>
					</div>
				</td>
				<td>
					<table>
						<tr></tr>
					</table>				
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<h4>���� ����</h4>
					<label for="excel"><input type="radio" id="excel" name="filetype" />Excel</label>
					<label for="pdf"><input type="radio" id="pdf" name="filetype" />PDF</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="�ٿ�ε�" />
				</td>
			</tr>
		</table>
	</div>
</body>
</html>