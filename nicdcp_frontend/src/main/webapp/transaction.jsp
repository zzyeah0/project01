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
	<c:set var="map" value="${map }" />			
	<div class="pages">	
		<form action="<%=request.getContextPath()%>/transaction.do" method="post">		
		<div class="filter">		
			<table>			
				<tr>
					<td>거래구분</td>
					<td colspan="3">								
						<label><input type="checkbox" name="tran_ab" value="2" <c:if test="${map.ab.equals('02') }">checked="checked</c:if>"/>이상거래</label>
						<label><input type="checkbox" name="tran_ab" value="3" <c:if test="${map.ab.equals('03') }">checked="checked</c:if>"/>의심거래</label>
					</td>
					<td>고객식별번호</td>
					<td colspan="3"><input type="text" name="cust_id" /></td>
				</tr>
				<tr>
					<td>거래채널</td>
					<td>
						<select name="t_chn">
							<option value="0">선택</option>
							<option value="1" <c:if test="${map.chn.equals('1') }">selected</c:if>>영업점</option>
							<option value="2" <c:if test="${map.chn.equals('2') }">selected</c:if>>자동화기기</option>
							<option value="3" <c:if test="${map.chn.equals('3') }">selected</c:if>>인터넷뱅킹</option>
							<option value="4" <c:if test="${map.chn.equals('4') }">selected</c:if>>스마트뱅킹</option>
							<option value="5" <c:if test="${map.chn.equals('5') }">selected</c:if>>제휴</option>
							<option value="6" <c:if test="${map.chn.equals('6') }">selected</c:if>>오픈API</option>
							<option value="7" <c:if test="${map.chn.equals('7') }">selected</c:if>>공동망</option>													
						</select>
					</td>
					<td>업무명</td>
					<td>
						<select name="t_name">
							<option value="0">선택</option>
							<option value="1" <c:if test="${map.nm.equals('1') }">selected</c:if>>계좌신규</option>
							<option value="2" <c:if test="${map.nm.equals('2') }">selected</c:if>>자동이체</option>
							<option value="3" <c:if test="${map.nm.equals('3') }">selected</c:if>>가상계좌발급</option>
							<option value="4" <c:if test="${map.nm.equals('4') }">selected</c:if>>가상계좌입금</option>
							<option value="5" <c:if test="${map.nm.equals('5') }">selected</c:if>>대출신청</option>							
						</select>
					</td>
					<td>대응여부</td>
					<td colspan="3">
						<select name="t_act">
							<option value="0">선택</option>
							<option value="1" <c:if test="${map.act.equals('1') }">selected</c:if>>확인중</option>
							<option value="2" <c:if test="${map.act.equals('2') }">selected</c:if>>조치중</option>
							<option value="3" <c:if test="${map.act.equals('3') }">selected</c:if>>조치완료</option>
							<option value="4" <c:if test="${map.act.equals('4') }">selected</c:if>>정상거래</option>														
						</select>
					</td>
				</tr>
				<tr>
					<td>발생일시</td>
					<td colspan="7">
						<input type="date" name="dateFrom" value="<c:if test="${!map.df.equals('1900-01-01') }">${map.df}</c:if>"/>부터					
						 <input type="date" name="dateTo" value="<c:if test="${!map.dt.equals('2200-12-31') }">${map.dt}</c:if>"/>까지
					</td>
				</tr>
				<tr>
					<td colspan="6"></td>
					<td>
						<select name="rowSize">
							<option value="5" <c:if test="${rowsize==5}">selected</c:if>>5개씩</option>
							<option value="10" <c:if test="${rowsize==10}">selected</c:if>>10개씩</option>
							<option value="20" <c:if test="${rowsize==20}">selected</c:if>>20개씩</option>
							<option value="30" <c:if test="${rowsize==30}">selected</c:if>>30개씩</option>														
						</select>
					</td>
					<td>						
						<input type="submit" class="btn blue" value="조회" />
						<input type="button" class="btn grey" value="초기화" onclick="location.href='transaction.do'"/>
					</td>
				</tr>
			</table>
		</div>
		</form>					
		<div class="content">
			<table id="tb1">
			<thead>
				<tr>
					<th>
						<input type="checkbox" name="checkAll" id="checkAll" onclick="checkAll()" />
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
				<tr align="center" onmouseover="this.style.cursor='pointer'" onClick = "if (link) location.href='tranCont.do?no=${dto.getTran_id() }'" >
					<td onmouseover="link=false;" onmouseout="link=true;">
						<input type="checkbox" name="checkRow" value="${dto.getTran_id() }" />
					</td>					
					<td>${dto.getTran_id() }</td>
					<td>
						<c:if test="${dto.getTran_ab().equals('02') }">이상</c:if>
						<c:if test="${dto.getTran_ab().equals('03') }">의심</c:if>	
					</td>
					<td>${dto.getCust_id() }</td>
					<td>
						<c:if test="${dto.getTran_chn().equals('01') }">영업점</c:if>
						<c:if test="${dto.getTran_chn().equals('02') }">자동화기기</c:if>
						<c:if test="${dto.getTran_chn().equals('03') }">인터넷뱅킹</c:if>
						<c:if test="${dto.getTran_chn().equals('04') }">스마트뱅킹</c:if>
						<c:if test="${dto.getTran_chn().equals('05') }">제휴</c:if>
						<c:if test="${dto.getTran_chn().equals('06') }">오픈API</c:if>
						<c:if test="${dto.getTran_chn().equals('07') }">공동망</c:if>
					</td>
					<td>
						<c:if test="${dto.getTran_name().equals('01') }">계좌신규</c:if>
						<c:if test="${dto.getTran_name().equals('02') }">자동이체</c:if>
						<c:if test="${dto.getTran_name().equals('03') }">가상계좌발급</c:if>
						<c:if test="${dto.getTran_name().equals('04') }">가상계좌입금</c:if>
						<c:if test="${dto.getTran_name().equals('05') }">대출신청</c:if>
					</td>
					<td>
						<c:if test="${dto.getTran_act().equals('00') }">미확인
						<input type="button" class="btn coral" value="대응하기" onmouseover="link=false;" onmouseout="link=true;" onclick="location.href='<%=request.getContextPath()%>/actionPopup.do?no=${dto.getTran_id()}'"/>
						</c:if>
						<c:if test="${dto.getTran_act().equals('02') }">대응완료</c:if>
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
			</table><br />
		</div>		
		<form action="<%=request.getContextPath()%>/tranDelete.do" onsubmit="deleteAction();" method="post">
			<input type="submit" class="btn coral" style="float:right;" value="삭제" />
			<input type="hidden" value="" name="delList" id="delList"/>
			<input type="hidden" value="" name="delNum" id="delNum"/>
		</form>
		<input type="button" class="btn liblue" value="다운로드" />
		<input type="button" class="btn blue" value="등록" onclick="location.href='tranInsert.jsp'"/>
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