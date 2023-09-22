<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="Ad_Head.jsp"%>
</head>
<script type="text/javascript">
	function getSyn(page) {
		var xhr = new XMLHttpRequest();
		xhr.open("get", page, false)
		xhr.send()
		return xhr.responseText;
	}
	function getCarInfoList(){
		document.querySelector("tbody").innerHTML = getSyn("../back/CarInfo.jsp")
		
	}
	function goRegister(){
		var row = event.target.closest('tr');
		var carNum = row.querySelector("[name=carNum]").innerText
		
		var url = "Ad_carRegist.jsp?carNum="+encodeURIComponent(carNum);
		
		window.location.href=url 
		
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
						<h2>차량등록</h2>
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
							<th>사고여부</th>
							<th>판매여부</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</section>
		</div>
	</div>
	<script>
	getCarInfoList();
	</script>
	
	<!-- Bootstrap core JS-->
	<script>
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/static/js/scripts_sidebar.js"></script>
</body>

</html>