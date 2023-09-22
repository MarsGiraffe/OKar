<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
import="project.kCar.vo.MemberVO"
import="project.kCar.dao.MemberDao"%>
<% 
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String memname = request.getParameter("memname");
String email = request.getParameter("email");
String phonenum = request.getParameter("phonenum");
%>    
<!DOCTYPE html> 
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>회원가입</title>
	<link href="./css/header.css" rel="stylesheet" type="text/css">
	<link href="./css/sign-up03.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="kcarHeader">
	<div class="gnbArea">
		<div class="topNavi">
			<h1 class="kcarHeaderLogo"></h1>
			<button class="menuAll">
			<span class="_hidden">전체메뉴</span>
			</button>
			<ul role="menubar"
				class="el-menu-demo gnb el-menu--horizontal el-menu">
				
				<li role="menuitem" aria-haspopup="true" class="el-submenu">
					<div class="el-submenu__title" style="border-bottom-color: transparent;">
						내차팔기<i class="el-submenu__icon-arrow el-icon-arrow-down"></i>
					</div>
					<div class="el-menu--horizontal gnbSubMenu typeCenter1" Style="display: none;">
						
						<ul role="menu"
							class="el-menu el-menu--popup el-menu--popup-bottom-start">
							<div class="menuTitArea">
								<strong class="menuTit">내차팔기</strong>
							</div>
							<li role="menuitem" tabindex="-1" class="el-menu-item menuItem">
								내차팔기 홈서비스</li>
							<li role="menuitem" tabindex="-1" class="el-menu-item menuItem">
								법인차매각신청</li>
							<li role="menuitem" tabindex="-1" class="el-menu-item menuItem">
								폐차신청</li>
							<li role="menuitem" tabindex="-1" class="el-menu-item menuItem">
								내차팔기 고객후기</li>
							<li role="menuitem" tabindex="-1" class="el-menu-item menuItem">
								직영점 보상판매</li>
						</ul>
					</div></li>
				<li role="menuitem" aria-haspopup="true" class="el-submenu">
					<div class="el-submenu__title"
						style="border-bottom-color: transparent;">
						내차사기 <i class="el-submenu__icon-arrow el-icon-arrow-down"></i>
					</div>
					<div class="el-menu--horizontal gnbSubMenu typeCenter1"
						style="display: none;">
						<ul role="menu"
							class="el-menu el-menu--popup el-menu--popup-bottom-start">
							<div class="menuTitArea">
								<strong class="menuTit">내차사기</strong>
							</div>
							<li role="menuitem" tabindex="-1" class="menuTitArea el-menu-item menuItem">
								차량검색</li>
							<li role="menuitem" tabindex="-1" class="el-menu-item menuItem">
								홈서비스 타임딜</li>
							<li role="menuitem" tabindex="-1" class="el-menu-item menuItem">
								내차사기 홈서비스</li>
							<li role="menuitem" tabindex="-1" class="el-menu-item menuItem">
								판매준비차량</li>
							<li role="menuitem" tabindex="-1" class="el-menu-item menuItem">
								3D 라이브 뷰</li>
							<li role="menuitem" tabindex="-1" class="el-menu-item menuItem">
								최근 본 차량</li>
							<li role="menuitem" tabindex="-1" class="el-menu-item menuItem">
								내차사기 고객후기</li>
							<li role="menuitem" tabindex="-1" class="el-menu-item menuItem">
								리스차량</li>
							<li role="menuitem" tabindex="-1" class="el-menu-item menuItem">
								브랜드 인증관</li>
						</ul>
					</div></li>
			</ul>
		</div>
		<div class="utilArea">
			<div class="utilMenu">
				<a><span>로그인</span></a> <a><span>회원가입</span></a>
			</div>
			<div class="searchArea" >
				<div class="el-input topinput">
					<input type="text" autocomplete="off" placeholder="차량을 검색하세요."
						value="" class="el-input__inner">
				</div>
				<button class="searchBtn">
					<span>차량검색</span>
				</button>
			</div>
		</div>
	</div>
</div><br><br><br>
<!-- 헤더 끝 -->
    <div class="container mt-3" id="main">
        <div id="content">
			<div>
				<h2 id="pageintro">회원가입</h2>
                </div>
                <div id="processbox">
                    <span class="checkedprocess">&nbsp;V&nbsp;</span>
                    <span class="checkedprocess">&nbsp;V&nbsp;</span>
					<span id="checkingprocess">&nbsp;3&nbsp;</span>
                </div>
			</div>
    	<form id="form" action="" method="post">
                <div id="notice01">
                    본인의 운전면허증 등록번호와 사진을 보내주세요
                </div>
            <div id="inputbox">
				<img id="preview" src="#" alt="Image Preview">

                 <!-- <div id="notice02">
                    첨부하신 운전면허증 사진파일을 확인 후<br>
                    회원가입이 완료됩니다.<br>
                    평균 확인시간은 5~10분 내외입니다.<br>
                    확인 완료시, 문자로 별도 안내 해드립니다.<br>
                    고객님께서는 번거로우시더라도 잠시만 기다려 주시기 바랍니다.
                 </div> -->
				 <div class="mb-3 mt-3">
					<label for="licensenum">운전면허증 등록번호</label>
					<input type="text" class="form-control inputbox" maxlength="15"
					   id="licensenum" placeholder="면허증 번호를 입력해주세요" name="licensenum">
					  <span id="licensenumNotice"></span>
					 </div>
            <input type="file" class="form-control" id="license" name="license" accept="image/*" onchange="previewImage(event)">
            <div id="btnbox">
                <button type="button" class="btn btn-primary" id="btn03">회원가입 완료</button>
            </div>
        </div>
    </form>
    
</div>
</body>
<script type="text/javascript">
	var licensenumOb = document.querySelector("#licensenum");
	var licensenumNoticeOb = document.querySelector("#licensenumNotice");
	var licenseumprn = /(\d{2}-\d{2}-\d{6}-\d{2})/g;
	var btn03Ob = document.querySelector("#btn03");
	var licenseOb = document.querySelector("#license")
	btn03Ob.disabled=true;
	var licensenum;
	var id;
	var pass;
	var memname;
	var email;
	var phonenum;
	var licensenum = licensenumOb.value;
	var previewOb = document.querySelector("#preview");
	function previewImage(event){
		var input = event.target;
		
		if(input.files&&input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				previewOb.src = e.target.result;
				previewOb.style.display='block';
			}
			reader.readAsDataURL(input.files[0])
		}
	}
	
	licensenumOb.onkeyup=function(){
		if(licenseumprn.test(this.value)){
			licensenumNoticeOb.innerText="";
			btn03Ob.disabled=false;
		}else{
			licensenumNoticeOb.innerText="올바른 면허증 번호를 입력해주세요";
			btn03Ob.disabled=true;
		}
	}

	btn03Ob.onclick=function(){
		id = "<%=id%>";
		pass = "<%=pass%>";
		memname = "<%=memname%>";
		email = "<%=email%>";
		phonenum = "<%=phonenum%>";
		licensenum = licensenumOb.value;
		var page="./back/sign-up_back.jsp?id="+id+"&pass="+pass+"&licensenum="+licensenum+"&memname="+memname+"&email="+email+"&phonenum="+phonenum
		var xhr = new XMLHttpRequest();
		xhr.open("get",page,true)
		
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				var response = JSON.parse(xhr.responseText)
				if(response.success==true){
					alert("회원가입 완료!!")
					location.href="./login.jsp"
				}else{
					alert("본인의 면허번호를 입력해주세요.")
					licensenum=""
					licensenumOb.focus()
			}
		}
	}
		xhr.send()
	}
	</script>
</html>