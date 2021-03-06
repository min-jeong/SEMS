<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js" />"></script>

<style type="text/css">
table {
    border-collapse: collapse;
}

table, td, th {
	width: 400px;
	text-align:left;
    border: 1px solid black;
}
.time{
	display:none;
}

<style type="text/css">
.inputButton {
	border:none;
	border-radius:5px;
	padding:6px 12px;
	font-weight:bold;
	text-transform:uppercase;
	color:#FFFFFF;
	background-color:#E05149;
	cursor: pointer;
}
select, input {
	display: inline;
}
</style>

</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#attendLeaveTime").click(function(){
			var check = $(this).is(":checked");
			var plus = 0;

			if(check){
				$(".time").show();
			}else{
				$(".time").hide();
			}
		});

	});


</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
강의ID : ${eduInfo.educationId}<br/>
강의명 : ${eduInfo.educationTitle}<br/>
강의기간 : ${eduInfo.startYear}-${eduInfo.startMonth}-${eduInfo.startDate} ~ ${eduInfo.endYear}-${eduInfo.endMonth}-${eduInfo.endDate}
<br/>
<div>
	<input type="checkbox" id="attendLeaveTime" name="attendLeaveTime">출석/퇴근 시간 보기<br>
	지각 △ 결석 X 조퇴 ●  출석 ○
	<table>
		<c:forEach var="attendHistory" items="${attendList.attends}">
				<tr>
					<td class="classDate" style="CURSOR:hand;" title="${attendHistory.value.get(1)}">${attendHistory.key} 
							&nbsp;
						<span class="time">${attendHistory.value.get(1)}</span>
					</td>
					<td> ${attendHistory.value.get(0)}</td>
					
				</tr>
		</c:forEach>
	
	</table>
	




</div>

<form id="pagingForm">
	<div style="text-align: center;">
		${ attendList.paging.getPagingList("pageNo", "[@]", "이전", "다음", "pagingForm") }
	</div>
</form>

</body>
</html>