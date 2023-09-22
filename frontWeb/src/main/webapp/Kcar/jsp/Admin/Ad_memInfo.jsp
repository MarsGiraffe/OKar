<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="Ad_Head.jsp"%>
<body>
	<script type="text/javascript">
		function getSyn(page) {
			var xhr = new XMLHttpRequest();
			xhr.open("get", page, false)
			xhr.send()
			return xhr.responseText;
		}

		function getMemList() {
			var htmlCode = getSyn("../back/MemberDB.jsp")
			console.log(htmlCode)
			document.querySelector("tbody").innerHTML = htmlCode;
		}

		function deleteMem() {
			var row = event.target.closest('tr');
			var delId = row.querySelector("[name=id]").innerText

			if (delId != null) {

				if (confirm("아이디: " + delId + "를 삭제하시겠습니까?")) {
					var htmlCode = getSyn("../back/MemberDB.jsp?id=" + delId)
							.trim()

					if (htmlCode == 'Y') {
						alert("삭제완료")
						getMemList();
					} else {
						alert("삭제실패!")
					}
				}
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
						<h2>회원정보</h2>
					</div>
				</nav>
			</div>
			<!-- Section-->
			<section class="py-5">
				<table class="AdContent">
					<thead>
						<tr>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>이름</th>
							<th>면허번호</th>
							<th>이메일주소</th>
							<th>전화번호</th>
							<th>권한</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</section>
		</div>
	</div>
	<script type="text/javascript">
		getMemList();
	</script>
</body>
</html>