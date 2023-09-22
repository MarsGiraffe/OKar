<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="Ad_Head.jsp"%>
</head>
<script type="text/javascript">
	function getSyn(page) {
		var xhr = new XMLHttpRequest();
		xhr.open("get", page, false)
		xhr.send()
		return xhr.responseText;
	}

	function getEstiRegList() {
		var htmlCode = getSyn("../back/CarEstimation.jsp")
		document.querySelector("tbody").innerHTML = htmlCode;
	}

	function registEst() {
		var row = event.target.closest('tr');
		var carNum = row.querySelector("[name=carNum]").innerText

		if (carNum != null) {
			console.log(carNum)
			document.querySelector("#RegCarNum").value = carNum
		}
	}
	function RegToCarInfo() {
		var RegCarNum = document.querySelector("#RegCarNum").value
		var accCnt = document.querySelector("#accCnt").value
		var diag = document.querySelector("input[name='accRadio']:checked").value
		var isPass = document.querySelector("input[name='sellRadio']:checked").value

		var Code = getSyn("../back/CarEstimation.jsp?RegCarNum="+RegCarNum+
				"&accCnt="+accCnt+"&diag="+diag+"&isPass="+isPass).trim();
		console.log(Code)
		if(Code=='Y'){
			alert('평가등록 완료!')
			document.querySelector("#regEst").reset();
			getEstiRegList();
		} else{
			alert('등록실패!')
		}
		
	}
	
</script>
<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">

			<div class="list-group list-group-flush">
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!" onclick="location.href='Ad_memInfo.jsp'">회원정보</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!" onclick="location.href='Ad_carInfo.jsp'">차량등록</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					onclick="location.href='Ad_carEst.jsp'">차량평가</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">매출조회</a>
			</div>
		</div>
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">



			<!-- Page content-->
			<div class="container-fluid">
				<!-- Top navigation-->
				<nav
					class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
					<div class="container-fluid">
						<h2>차량평가 요청</h2>
					</div>
				</nav>
			</div>
			<!-- Section-->
			<section class="py-5">
				<table class="AdContent">
					<thead>
						<tr>
							<th>등록번호</th>
							<th>모델명</th>
							<th>차량번호</th>
							<th>방문요청지역</th>
							<th>요청시기</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</section>
		</div>

	</div>
	<!-- The Modal -->
	<form id="regEst">
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h2 class="modal-title">차량평가 등록</h2>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>

				</div>
				<div class="mb-3 mt-3">
					<label for="title">차량번호</label> <input type="text"
						class="form-control" id="RegCarNum" name="RegCarNum" disabled>
				</div>
				<div class="mb-3 mt-3">
					<label for="title">사고횟수</label> <input type="number" value="0"
						class="form-control" id="accCnt" placeholder="0" name="accCnt">
				</div>
			
				<div class="form-check">
					<input type="radio" class="radiobox" id="accR1" name="accRadio" value="무사고" checked>
						 <label for="accR1">무사고</label>
					<input type="radio" class="radiobox" id="accR2" name="accRadio" value="단순수리">
						 <label for="accR2">단순수리</label>
					<input type="radio" class="radiobox" id="accR3" name="accRadio" value="사고">
						 <label for="accR3">사고</label>
				</div>
			
				<div class="form-check">
					<input type="radio" class="radiobox" id="sellR1" name="sellRadio" value="판매가능" checked> 
					<label class="form-check-label" for="sellR1">판매가능</label>
					<input type="radio" class="radiobox" id="sellR2" name="sellRadio" value="판매불가능"> 
					<label class="form-check-label" for="sellR2">판매불가능</label>
				</div>
				<!-- Modal body -->
				<div class="modal-body"></div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="RegToCarInfo()"
						data-bs-dismiss="modal">등록</button>
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">닫기</button>
				</div>

			</div>
		</div>
	</div>
	</form>

	<script>
		getEstiRegList();
	</script>
</body>
</html>
