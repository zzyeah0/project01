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
<script type="text/javascript">
	var request = new XMLHttpRequest();
	function searchFunction() {
		request.open("Post", "./tranSearch.do?="+encodeURIComponent(document.getElementById("").value), true);
		request.onreadystatechange = searchProcess;
		request.send(null);
	}
	function searchProcess() {
		var table = document.getElemntById("list");
		table.innerHTML = "";
		if(request.readState == 4 && request.status == 200) {
			var object = eval('(' + request.responseText ')');
			var result = object.result;
			for(var i=0; i < result.length; i++) {
				var row = table.insertRow(0);
				for(var j=0; j<result[i].length; j++) {
					var cell = row.insertCell(j);
					cell.innerHTML = result[i][j].value;
				}
			}
		}
	}
</script>
</head>
<body>
	<jsp:include page="/header.jsp" />
	<c:set var="list" value="${list }" />
	<div class="pages">
		<form action="<%=request.getContextPath()%>/tranSearch.do" method="post">
		<div class="filter">
			<table>			
				<tr>
					<td>거래구분</td>
					<td colspan="3">						
						<label><input type="checkbox" name="ab" value="ab" />이상거래</label>
						<label><input type="checkbox" name="do" value="do" />의심거래</label>
					</td>
					<td>고객식별번호</td>
					<td colspan="3"><input type="text" name="cust_id" /></td>
				</tr>
				<tr>
					<td>거래채널</td>
					<td>
						<select name="t_chn">
							<option value="">선택</option>
							<option value="1">영업점</option>
							<option value="2">자동화기기</option>
							<option value="3">인터넷뱅킹</option>
							<option value="4">스마트뱅킹</option>
							<option value="5">제휴</option>
							<option value="6">오픈API</option>
							<option value="7">공동망</option>													
						</select>
					</td>
					<td>업무명</td>
					<td>
						<select name="t_name">
							<option value="">선택</option>
							<option value="1">계좌신규</option>
							<option value="2">자동이체</option>
							<option value="3">가상계좌발급</option>
							<option value="4">가상계좌입금</option>
							<option value="5">대출신청</option>							
						</select>
					</td>
					<td>대응여부</td>
					<td colspan="3">
						<select name="t_act">
							<option value="">선택</option>
							<option value="1">확인중</option>
							<option value="2">조치중</option>
							<option value="3">조치완료</option>
							<option value="4">정상거래</option>														
						</select>
					</td>
				</tr>
				<tr>
					<td>발생일시</td>
					<td colspan="7">
						<input type="date" />부터					
						 <input type="date" />까지
					</td>
				</tr>
				<tr>
					<td colspan="6"></td>
					<td>
						<select name="rowSize">
							<option value="5">5개씩</option>
							<option value="10" selected>10개씩</option>
							<option value="20">20개씩</option>
							<option value="30">30개씩</option>														
						</select>
					</td>
					<td>
						<input type="submit" class="btn blue" value="조회" onclick="searchFunction();"/>
						<input type="reset" class="btn grey" value="초기화" />
					</td>
				</tr>
			</table>
		</div>
		</form>
		<div class="content">
			<table>
			<thead>
				<tr>
					<th>
						<input type="checkbox" name="" value="" />
					</th>
					<th>No.</th>
					<th>거래구분</th>
					<th>고객식별번호</th>
					<th>거래채널</th>
					<th>업무명</th>
					<th>대응여부</th>
					<th>발생일시</th>
				</tr>
				</thead>
				<tbody id="list">
				<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
				<tr align="center" style = "cursor:pointer;" onClick = "location.href='tranCont.do?no=${dto.getTran_id() }'">
					<td>
						<input type="checkbox" name="" value="" />
					</td>
					<td>${dto.getTran_id() }</td>
					<td>
						<c:if test="${dto.getTran_ab().equals('2') }">이상</c:if>
						<c:if test="${dto.getTran_ab().equals('3') }">의심</c:if>	
					</td>
					<td>${dto.getCust_id() }</td>
					<td>${dto.getTran_chn() }</td>
					<td>${dto.getTran_name() }</td>
					<td>
						<c:if test="${dto.getTran_act().equals('0') }">미확인
						<input type="button" class="btn coral" value="대응하기" />
						</c:if>
						<c:if test="${dto.getTran_act().equals('2') }">대응완료</c:if>
					</td>
					<td>${dto.getTran_date() }</td>					
				</tr>
				</c:forEach>
				</c:if>
				<c:if test="${empty list }">
				<tr>
					<td colspan="8">등록된 데이터가 없거나 일시적 오류로 불러올 수 없습니다.</td>
				</tr>
			</c:if>
			</tbody>
			</table>
		</div>
		<input type="button" class="btn liblue" value="다운로드" />
		
		<div align="center">
			<ul class="pagination">
				<c:if test="${page > block }">
					<li class="paginate_button previous"> 
					  <a href="transaction.do?page=1">◀◀</a></li>
					<li><a href="transaction.do?page=${startBlock-1 }">◀</a></li>
				</c:if>
				
				<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
				<c:if test="${i == page }">
					<li class="active"><a href="transaction.do?page=${i }">${i }</a></li>
				</c:if>
				<c:if test="${i != page }">
					<li><a href="transaction.do?page=${i }">${i }</a></li>
				</c:if>
				</c:forEach>
				
				<c:if test="${endBlock < allPage }">
					<li><a href="transaction.do?page=${endBlock+1 }">▶</a></li>
					<li class="paginate_button next"> 
					  <a href="transaction.do?page=${allPage }">▶▶</a></li>					
				</c:if>				
			</ul>
		</div>
	
	</div>
</body>
</html>