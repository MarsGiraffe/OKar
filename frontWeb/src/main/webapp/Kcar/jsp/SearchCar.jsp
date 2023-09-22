<%@page import="project.kCar.vo.*"%>

<%@page import="java.util.List"%>

<%@page import="project.kCar.dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Okar - 내차사기</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="../resources/static/assets/logo.png" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/static/css/styles.css" rel="stylesheet" />
<link href="../resources/static/css/styles_sidebar.css" rel="stylesheet" />

<style type="text/css">
input[type=checkbox] {
	position: relative;
	outline: 0;
	display: none;
	flex: 1;
}

input[type=checkbox]+label {
	color: #16171d;
	letter-spacing: -.05rem;
	border-radius: 0.3rem;
	background-color: #fff;
	white-space: nowrap;
	border: 2px solid #dcdfe6;
	color: #606266;
	outline: 0;
	margin: 0;
	position: relative;
	cursor: pointer;
	transition: all .3s cubic-bezier(.645, .045, .355, 1);
	padding: 8px;
	font-size: 14px;
}

input[type=checkbox]:checked+label {
	color: #16171d;
	border-color: #b70f28;
	background-color: #fff;
	box-shadow: 0 2px 4px 0 rgba(22, 23, 29, .04) !important;
}
</style>
</head>
<script type="text/javascript">

	function schCar(){
		var coms = document.getElementsByName("manu");
		var comArr = [];
 		for(var i=0; i<coms.length; i++){
 			if(coms[i].checked){
 				comArr.push(coms[i].value);
 			}
 		}
		var models = document.getElementsByName("model");
		var modArr = [];
 		for(var i=0; i<models.length; i++){
 			if(models[i].checked){
 				modArr.push(models[i].value);
 			}
 		}
		var vols = document.getElementsByName("volume");
		var volArr = [];
 		for(var i=0; i<vols.length; i++){
 			if(vols[i].checked){
 				volArr.push(vols[i].value);
 			}
 		}
 		var price = document.getElementById("price");
 		var acc = document.getElementById("acc");
 		var dist = document.getElementById("dist").value;
		var xhr = new XMLHttpRequest();
		console.log("manu="+comArr+"&model="+modArr+"&volume="+volArr+"&price="+price+"&acc="+acc+"&dist="+dist);
		xhr.open("post","back/search.jsp",true);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded; charset=euc-kr;")
		xhr.send("manu="+comArr+"&model="+modArr+"&volume="+volArr+"&price="+price+"&acc="+acc+"&dist="+dist);
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				var searchList= document.querySelector("#searchList");
				searchList.innerHTML = xhr.responseText;
			}
		}
	}
	
	function schKeyword() {
		var keyword = document.querySelector("#keyword").value;
		var xhr = new XMLHttpRequest();
		console.log("keyword="+keyword);
		xhr.open("post","back/schKeyword.jsp",true);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded; charset=euc-kr;")
		xhr.send("keyword="+keyword);
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				var searchList= document.querySelector("#searchList");
				searchList.innerHTML = xhr.responseText;
			}
		}
	}

</script>
<body>
	<iframe src="header.jsp"
		style="width: 100%; height: 100%; overflow: hidden;" scrolling="no"></iframe>
	<!-- Header-->
	<header style="background-color: #F15F5F" class="py-5">
		<div class="container px-4 px-lg-5 my-5"
			style="background-color: #F15F5F">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">내차 사기</h1>
			</div>
		</div>
	</header>
<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
 	<form method="post">
		<div class="border-end bg-white" id="sidebar-wrapper">
			<button type="button" onclick="company_Car()"
				class="list-group-item list-group-item-action list-group-item-light p-3">제조사</button>
			<div style="display: none;" class="list-group list-group-flush"
				id="company_Car">
				<%
				DAO dao = new DAO();
				List<Car_Res_Info> infolist = dao.getCarResInfo();
				for (Car_Res_Info cri : infolist) {
					if (cri.getLevel() == 1) {
				%>
				<input type="checkbox" name="manu" id="<%=cri.getName()%>"
					value="<%=cri.getName()%>" /> <label for="<%=cri.getName()%>"><%=cri.getName()%></label>
				<%}%>
				<%}%>
			</div>
			<button type="button" onclick="model_Car()"
				class="list-group-item list-group-item-action list-group-item-light p-3">모델명</button>
			<div style="display: none;" class="list-group list-group-flush"
				id="model_Car">
				<%
				for (Car_Res_Info cri : infolist) {
					if (cri.getLevel() == 2) {
				%>
				<input type="checkbox" name="model" id="<%=cri.getName()%>"
					value="<%=cri.getName()%>" /> <label for="<%=cri.getName()%>"><%=cri.getName()%></label>
				<%}%>
				<%}%>
			</div>
			<button type="button" onclick="fuel_Car()"
				class="list-group-item list-group-item-action list-group-item-light p-3">연료</button>
			<div style="display: none;" class="list-group list-group-flush"
				id="fuel_Car">
				<%
				for (Car_Res_Info cri : infolist) {
					if (cri.getLevel() == 3) {
				%>
				<input type="checkbox" name="volume" id="<%=cri.getName()%>"
					value="<%=cri.getName()%>" /> <label for="<%=cri.getName()%>"><%=cri.getName()%></label>
				<%}%>
				<%}%>
			</div>
			<button type="button" onclick="diriving_Car()"
				class="list-group-item list-group-item-action list-group-item-light p-3">주행거리</button>
			<div style="display: none;" class="list-group list-group-flush"
				id="diriving_Car">
				<select name="dist" id="dist">
					<%
					for (int i = 10000; i <= 100000; i += 10000) {
					%>
					<option name="dist" id="dist" value="<%=i%>"><%=i%>km
					</option>
					<%}%>
				</select>
			</div>
			<button type="button" onclick="pay_Car()"
				class="list-group-item list-group-item-action list-group-item-light p-3">가격</button>
			<div style="display: none;" class="list-group list-group-flush"
								id="pay_Car">
								<%
								for (int i = 100; i <= 900; i += 100) {
								%>
								<input type="radio" name="price" id="<%=i%>" value="<%=i%>" /><label
									for="<%=i%>"><%=i / 100%>백</label>
								<%
								}
								for (int i = 1000; i <= 9000; i += 1000) {
								%>
								<input type="radio" name="price" id="<%=i%>" value="<%=i%>" /><label
									for="<%=i%>"><%=i / 1000%>천</label>
								<%
								}
								%>
							</div>
			<button type="button" onclick="option_Car()"
				class="list-group-item list-group-item-action list-group-item-light p-3">옵션</button>
			<div style="display: none;" class="list-group list-group-flush"
				id="option_Car">
				<%
				List<Car_Option> olist = dao.getOptionInfo();
				for (Car_Option co : olist) {
				%>
				<input type="checkbox" name="option" id="<%=co.getOpName()%>"
					value="<%=co.getOpId()%>" />
					<label for="<%=co.getOpName()%>"><%=co.getOpName()%></label>
				<%}%>
			</div>
			<button type="button" onclick="crush_Car()"
				class="list-group-item list-group-item-action list-group-item-light p-3">사고유무</button>
			<div style="display: none;" class="list-group list-group-flush"
				id="crush_Car">
				<input type="radio" name="acc" id="모두포함" value="" /><label
					for="모두포함">모두포함</label> <input type="radio" name="acc"
					id="무사고" value="0" /><label for="무사고">무사고</label>
					<input type="radio" name="acc" id="사고"
					value="1" /><label for="사고">사고</label>
			</div>
		<div class="container-fluid">
			<button type="button" onclick="schCar()" style="background-color: #F15F5F" class="easySchBtn">검색</button>
		</div>
		</div>
 	</form>
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Top navigation-->
			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<div class="container-fluid">
					<form class="searchForm" method="post">
						<input type="text" id="keyword" name="keyword" class="searchBox" placeholder="원하는 차량을 검색하세요." />
						<input type="button" onclick="schKeyword()" class="searchBtn" value="검색" />
					</form>
				</div>
			</nav>
			<!-- Page content-->
			<div class="container-fluid">
				<!-- Section-->
				<section class="py-5">
					<div class="container px-4 px-lg-5 mt-5">
						<div id="searchList"
							class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
							<%
							List<OkayCar_Res> clist = dao.getCarList();
							for (OkayCar_Res ok : clist) {
								if(ok.getSell_or_not().equals("N")) {
							%>
							<div class="col mb-5">
								<div class="card h-100"
									onclick="location.href='detailCar.jsp?car_num=<%=ok.getCar_num()%>';">
									<!-- Product image-->
									<img class="card-img-top" src="<%=ok.getImg_src()%>" alt="..." />
									<!-- Product details-->
									<div class="card-body p-4">
										<div class="text-center">
											<!-- Product name-->
											<h5 class="fw-bolder"><%=ok.getManufactor()%>
												<%=ok.getModel()%>
												<%=ok.getVolume()%></h5>
											<!-- Product price-->
											<%=ok.getPrice()%>만원
										</div>
									</div>
									<!-- Product actions-->
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
											<a class="btn btn-outline-dark mt-auto"
												href="detailCar.jsp?car_num=<%=ok.getCar_num()%>">View
												options</a>
										</div>
									</div>
								</div>
							</div>
							<%}
						}%>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/static/js/scripts_sidebar.js"></script>
</body>
</html>
