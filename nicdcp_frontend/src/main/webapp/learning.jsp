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
<script>
	var link = true;	
</script>
<script>
	function checkAll() {
		if($("#checkAll").is(':checked')){
			$("input[name=checkRow]").prop("checked", true);
		}else {
			$("input[name=checkRow]").prop("checked", false);
		}
	}
	
	function deleteAction() {
		var checkRow = "";
		var checkNum = 0;
		$("input[name='checkRow']:checked").each(function() {
			checkRow = checkRow + $(this).val()+",";
			checkNum += 1;
		});
		checkRow = checkRow.substring(0,checkRow.lastIndexOf(","));
		
		if(checkRow == ''){
			alert("삭제할 대상을 선택하세요.");
			return false;
		}
		console.log("### checkRow =>"+checkRow);
		console.log("### checkNum =>"+checkNum);
		
		if(confirm("선택한 데이터를 삭제하시겠습니까?")){			
			$('#delList').val(checkRow);
			$('#delNum').val(checkNum);
		} 
	}

</script>
<body>
	<jsp:include page="/header.jsp" />
	<c:set var="list" value="${list }" />
	<div class="pages">		
		<h4 class="inline">학습 이력</h4>
		<input id="learning-btn" type="button" class="btn blue" value="새 학습" onclick="location.href='step1.jsp'" />		
		<form action="<%=request.getContextPath()%>/learningList.do" method="post">
		<div class="filter"><table>
			<tr>			
				<td>학습일자</td>
				<td>
					<input type="date" name="dateFrom" value="<c:if test="${!map.df.equals('1900-01-01') }">${map.df}</c:if>"/>부터					
					<input type="date" name="dateTo" value="<c:if test="${!map.dt.equals('2200-12-31') }">${map.dt}</c:if>"/>까지
				</td>
				<td>학습 담당자</td>
				<td><input type="text" name="learning_emp" /></td>				
			</tr>
			<tr>
				<td colspan="3"></td>
				<td>
					<select name="rowSize">
						<option value="5" <c:if test="${rowsize==5}">selected</c:if>>5개씩</option>
						<option value="10" <c:if test="${rowsize==10}">selected</c:if>>10개씩</option>
						<option value="20" <c:if test="${rowsize==20}">selected</c:if>>20개씩</option>
						<option value="30" <c:if test="${rowsize==30}">selected</c:if>>30개씩</option>														
					</select>				
					<input type="submit" class="btn blue" value="조회" />
					<input type="reset" class="btn grey" value="초기화"  onclick="location.href='learningList.do'"/>
				</td>
			</tr>
		</table></div>
		</form>
		<div class="content"><table id="tb1">
			<thead>
			<tr>
				<th><input type="checkbox" name="checkAll" id="checkAll" onclick="checkAll()" /></th>
				<th>No.</th>
				<th>학습일자</th>
				<th>데이터셋 파일명</th>
				<th>학습담당자</th>
				<th>현재 사용 중인 모델</th>
			</tr>
			</thead>
			<tbody id="list">
			</tbody>
			<c:if test="${!empty list }">
			<c:forEach items="${list }" var="dto">
			<tr align="center" onmouseover="this.style.cursor='pointer'" onClick = "if (link) location.href='learningCont.do?no=${dto.getLearning_id() }'">
				<td onmouseover="link=false;" onmouseout="link=true;">
					<input type="checkbox" name="checkRow" value="${dto.getLearning_id() }" />
				</td>
				<td>${dto.getLearning_id() }</td>
				<td>${dto.getLearning_date() }</td>
				<td>${dto.getDataset_file() }</td>
				<td>${dto.getLearning_emp() }</td>
				<td>
					<c:if test="${dto.getLearning_state().equals('Y')}">
					<img class="yesorno" alt="" src="./image/yes.png">
					</c:if>
					<c:if test="${dto.getLearning_state().equals('N')}">
					<img class="yesorno" alt="" src="./image/no.png">
					</c:if>			
				</td>
			</tr>
			</c:forEach>
			</c:if>
			<c:if test="${empty list }">
			<tr>
				<td colspan="6">학습 내역이 없거나 일시적 오류로 불러올 수 없습니다.</td>
			</tr>
			</c:if>			
		</table></div>
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