<%@page import="java.util.List"%>
<%@page import="project.kCar.dao.DAO"%>
<%@page import="project.kCar.vo.OkayCar_Res"%>
<%@page import="java.text.DecimalFormat"%>
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
<title>차량 상세페이지</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="../resources/static/assets/logo.png" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/static/css/styles.css" rel="stylesheet" />
<style type="text/css">
	#monthlyCost{
		width: 100%;
		text-align: center;
		border: 1px solid #b70f28;
		border-radius: 0.8rem;
		padding: 10px;
		margin-top: 30px;
	}
	
</style>
</head>
<%
DecimalFormat decFormat = new DecimalFormat("###,###"); // 쉼표 찍는 내장 객체

String car_num = request.getParameter("car_num");
DAO dao = new DAO();
OkayCar_Res ok = dao.getCarInfo(car_num);

// 차량 가격
int carCost = ok.getPrice() * 10000;

// 차량 선수금
int advance = (int) (carCost * 0.3);

// 취득세(차량금액*0.07)
int tax = (int)(carCost * 0.07);

// 이전등록비
int transfer = tax + 3000 + 1000;
int tot_cost = carCost + transfer + ok.manage_cost + ok.agency_fee; // 지불할 총 금액 (차량가격 + 관리비 + 수수료 + 이전등록비)
%>
<script type="text/javascript">
	function sell(){
		var car_num = "<%=ok.getCar_num()%>";
		var isBuy = confirm(car_num +" 차량을 구매하시겠습니까?");
		if(isBuy == true){
			buy();
		}
	}
	function buy(){
		var car_num = "<%=ok.getCar_num()%>";
		var xhr = new XMLHttpRequest();
		console.log("car_num="+car_num);
		xhr.open("post","back/buy.jsp",true);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded; charset=euc-kr;")
		xhr.send("car_num="+car_num);
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				/* var searchList= document.querySelector("#searchList");
				searchList.innerHTML = xhr.responseText; */
				alert("구매가 완료되었습니다.");
				location.href="SearchCar.jsp";		// 메인으로 이동
			}
		}
	}
</script>
<body>
	<iframe src="header.jsp"
		style="width: 100%; height: 100%; overflow: hidden;" scrolling="no"></iframe>

	<!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<h1 class="display-5 fw-bolder"><%=ok.getManufactor()%>
					<%=ok.getModel()%>
					<%=ok.getVolume()%></h1>
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0" src="<%=ok.getImg_src()%>"
						alt="..." />
				</div>
			</div>
		</div>
	</section>
	<div>
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<h1 class="display-5 fw-bolder"><%=decFormat.format(ok.getPrice())%>만원
					</h1>
					<ul class="carOptionLists">
						<li class="fs-5 mb-5"><span>13년 7월식(14년형)</span></li>
						<li class="fs-5 mb-5"><span><%=decFormat.format(ok.getDrive_dist())%>km</span></li>
						<li class="fs-5 mb-5"><span><%=decFormat.format(ok.getAccident_cnt())%>건</span></li>
						<li class="fs-5 mb-5"><span>단순수리</span></li>
					</ul>
					<p class="lead">차량 예상 가격</p>
					<input type="text" class="price-inner"
						value="<%=decFormat.format(carCost)%>" />원
					<input type="hidden" value="<%=carCost %>" id="carCost" />
					<p class="lead">선수금</p>
					<input type="text" class="price_2-inner"
						value="<%=advance / 10000%>" />만원
					<p class="lead">할부기간</p>
					<div class="monthlyRadio">
						<input type="radio" name="radioBtn" id="12개월" value="12" checked/>
						<label for="12개월" class="radio-inner" onclick="monthly({val:12})">12개월</label>
						<input type="radio" name="radioBtn" id="24개월" value="24" />
						<label for="24개월" class="radio-inner" onclick="monthly({val:24})">24개월</label>
						<input type="radio" name="radioBtn" id="36개월" value="36" />
						<label for="36개월" class="radio-inner" onclick="monthly({val:36})">36개월</label>
						<input type="radio" name="radioBtn" id="48개월" value="48" />
						<label for="48개월" class="radio-inner" onclick="monthly({val:48})">48개월</label>
						<input type="radio" name="radioBtn" id="60개월" value="60" />
						<label for="60개월" class="radio-inner" onclick="monthly({val:60})">60개월</label>
						<input type="radio" name="radioBtn" id="72개월" value="72" />
						<label for="72개월" class="radio-inner" onclick="monthly({val:72})">72개월</label>
					</div>
					<%-- 월 할부금 출력될 공간 --%>
					<div>
						<h2 id="monthlyCost">월 541666원</h2>
					</div>
				</div>
				<div class="col-md-6" id="tot-price">
					<h1 class="display-5 fw-bolder" style="font-size: 30pt;"><%=ok.getManufactor()%>
						<%=ok.getModel()%>
						<%=ok.getVolume()%></h1>

					<p class="lead">총 구매 예상 비용</p>
					<div class="el-collapse-item__content">
						<ul class="costDetailLists">
							<li class="tot-li"><span>차량가</span><span><%=decFormat.format(carCost)%>원</span></li>
							<li class="tot-li"><span>이전등록비</span><span><%=decFormat.format(transfer)%>원</span></li>
							<li class="tot-li"><span>관리비용</span><span><%=decFormat.format(ok.manage_cost)%>원</span></li>
							<li class="tot-li"><span>등록신청대행수수료</span><span><%=decFormat.format(ok.agency_fee)%>원</span></li>
							<li class="tot-li"><span>배송비</span><span>배송 지역에 따라
									달라집니다.</span></li>
							<li class="tot-li"><span>합계</span><span style="color: red;"><%=decFormat.format(tot_cost)%>원</span></li>
						</ul>
					</div>
					<div class="d-flex">
					<form method="post">
						<input type="hidden" id="car_num" value="<%=ok.getCar_num() %>"/>
						<button onclick="sell()" class="btn btn-outline-dark flex-shrink-0" type="button">
							<i class="bi-cart-fill me-1"></i> 홈서비스 바로구매
						</button>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 다른 상품 추천 (최대 4가지) -->
	<section class="py-5 bg-light">
		<div class="container px-4 px-lg-5 mt-5">
			<h2 class="fw-bolder mb-4">Related products</h2>
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<%
				List<OkayCar_Res> clist = dao.getCarList();
				int index = 0;
				if(clist.size() < 4) {
					index = clist.size()-1;	// 판매중인 차량이 4개 미만일 경우
				}
				for (int i=0; i<=index; i++) {
				%>
				<div class="col mb-5">
					<div class="card h-100"
						onclick="location.href='detailCar.jsp?car_num=<%=clist.get(i).getCar_num()%>';">
						<!-- Product image-->
						<img class="card-img-top" src="<%=clist.get(i).getImg_src()%>" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder"><%=clist.get(i).getManufactor()%>
									<%=clist.get(i).getModel()%>
									<%=clist.get(i).getVolume()%></h5>
								<!-- Product price-->
								<%=clist.get(i).getPrice()%>만원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="detailCar.jsp?car_num=<%=clist.get(i).getCar_num()%>">View
									options</a>
							</div>
						</div>
					</div>
				</div>
				<%}%>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2023</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/static/js/scripts.js"></script>
</body>
</html>
