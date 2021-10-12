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
function printClock(){
	var currentDate = new Date();
	var calendar = currentDate.getFullYear() + "-" + currentDate.getMonth() + "-" + currentDate.getDate();
	var currentHours = addZeros(currentDate.getHours(),2);
	var currentMinute = addZeros(currentDate.getMinutes(),2);
	var currentSeconds = addZeros(currentDate.getSeconds(),2);
	var clock = document.getElementById("clock");
	clock.innerHTML = calendar + " " + currentHours+":"+currentMinute+":"+currentSeconds
	setTimeout("printClock()", 1000);
}

function addZeros(num, digit) {
	var zero = '';
	num = num.toString();
	if (num.length < digit) {
		for(i=0; i<digit-num.length; i++) {
			zero += '0';
		}	
	}
	return zero+num;
}
</script>
<body onload="printClock()">
	<jsp:include page="/header.jsp" />
	<c:set var="l_dto" value="${l_dto }" />
	<c:set var="t_dto" value="${t_dto }" />
	<c:set var="array" value="${array }" />
	<div class="pages">
		<div class="contents">
		<table>
		<tr>
			<td>
			<table>
				<tr>
					<td><h4>거래현황</h4></td>
				</tr>
				<tr>
					<td><div class="box short">
						총 거래량 <h3>${array[0]}</h3>
						<button><img src="./image/refresh.png" alt="" /></button>
					</div></td>
					<td><div class="box short">
						정상 거래 <h3>${array[1]}</h3>
						<button><img src="./image/refresh.png" alt="" /></button>
					</div></td>
					<td><div class="box short">
						이상 거래 <h3>${array[2]}</h3>
						<button><img src="./image/refresh.png" alt="" /></button>
					</div></td>
				</tr>
			</table>
			</td>
			<td rowspan="3">
				<table>
				<tr>
					<td><h4>학습정보</h4></td>
				</tr>
				<tr>
					<td><div class="transp"><table>
					<tr>
						<th>학습일자</th>
					</tr>
					<tr>
						<td>${l_dto.getLearning_date()}</td>
					</tr>
					<tr>
						<th>학습 데이터</th>
					</tr>
					<tr>
						<td>${l_dto.getDataset_file()}</td>
					</tr>
					<tr>
						<th>다음 학습 예정일까지</th>
					</tr>
					<tr>
						<td><h1>D-39</h1></td>
					</tr>
					<tr>
						<td><input type="button" class="btn blue" onclick="location.href='step1.jsp'" value="새 학습" /></td>
					</tr>
					</table></div></td>			
				</tr>
				<tr>
					<td><h4>모델정보</h4></td>
				</tr>
				<tr>
					<td><div class="transp"><table class="content">
					<tr>
						<td colspan="2">
						<img id="performance" src="./image/performance.png" alt="" />
						</td>
					</tr>
					<tr>
						<th>의심탐지 수</th>
						<td>${l_dto.getDnum_10()}</td>
					</tr>
					<tr>
						<th>임계치</th>
						<td>${l_dto.getThreshold_10()}</td>
					</tr>
					</table></div></td>		
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td>
			<table>
				<tr>
					<td><h4>탐지 현황</h4></td>
				</tr>
				<tr>
					<td rowspan="2"><div class="box long blue" style="background-color:#DAE3F3;">
						정상 거래<h3>${array[3]}</h3>
						<button><img src="./image/refresh-grey.png" alt="" /></button>
					</div></td>
					<td rowspan="3"><div class="box big grey" style="background-color:#F2F2F2;">
						미확인<h3>${array[6]}</h3>
						<button><img src="./image/refresh-grey.png" alt="" /></button>
					</div></td>				
				</tr>
				<tr></tr>			
				<tr>
					<td rowspan="2"><div class="box long red">
						이상 거래<h3>${array[4]}</h3>
						<button><img src="./image/refresh-grey.png" alt="" /></button>
					</div></td>							
				</tr>			
				<tr>
					<td rowspan="3"><div class="box big transp">
						탐지율<h1>66%</h1>
						<button><img src="./image/refresh-grey.png" alt="" /></button>
					</div></td>	
				</tr>
				<tr>
					<td rowspan="2"><div class="box long yellow">
						의심 거래<h3>${array[5]}</h3>
						<button><img src="./image/refresh-grey.png" alt="" /></button>
					</div></td>						
				</tr>		
			</table>
			</td>
		</tr>
		<tr>
			<td>
			<div class="d-tb"><form action=""><table>
				<tr>
					<td colspan="3"><h4>실시간 이상 거래 탐지 리스트</h4></td>
					<td colspan="2"><p id="clock"></p></td>
					<td><a href="<%=request.getContextPath()%>/transaction.do">더보기<img src="./image/more.png" alt="" id="more-btn"/></a></td>
				</tr>
				<tr>
					<th>No.</th>
					<th>이상여부</th>
					<th>거래채널</th>
					<th>업무명</th>
					<th>발생일시</th>
					<th>대응여부</th>
				</tr>
				<c:if test="${!empty t_dto }">
				<c:forEach items="${t_dto }" var="t_dto">
				<tr>
					<td>${t_dto.getTran_id()}</td>
					<td>
						<c:if test="${t_dto.getTran_ab().equals('2') }">이상</c:if>
						<c:if test="${t_dto.getTran_ab().equals('3') }">의심</c:if>				
					</td>
					<td>${t_dto.getTran_chn()}</td>
					<td>${t_dto.getTran_name()}</td>	
					<td>${t_dto.getTran_date()}</td>
					<td>
						<c:if test="${t_dto.getTran_act().equals('0') }">미확인
						<input type="button" class="btn coral" onclick="location.href='<%=request.getContextPath()%>/actionPopup.do?no=${t_dto.getTran_id()}'" value="대응하기" />					
						</c:if>
						<c:if test="${t_dto.getTran_act().equals('2') }">대응완료</c:if>
					</td>		
				</tr>
				</c:forEach>
				</c:if>						
			</table></form></div>
			</td>
		</tr>
		</table>
		</div>				
	</div>
</body>
</html>