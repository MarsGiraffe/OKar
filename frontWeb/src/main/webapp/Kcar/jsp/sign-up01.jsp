<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
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
	<link href="./css/sign-up01.css" rel="stylesheet" type="text/css">
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
</div><br><br>
<!-- 헤더 끝 -->
    <div id="main" class="container mt-3">
		<div id="content">
			<div>
				<h2 id="pageintro">회원가입</h2>
                </div>
                <div id="processbox">
					<span id="checkingprocess">&nbsp;1&nbsp;</span>
                    <span class="checkedprocess">&nbsp;2&nbsp;</span>
                    <span class="checkedprocess">&nbsp;3&nbsp;</span>
                </div>
		</div>
		<form action="" method="post" id="form">
            <table  id="formintable">
            	<tr>
            		<td id="phonecheck01"><img src="./img/phonecheck01.png"/></td>
            		<td id="ipincheck01"><img src="./img/i-pincheck01.png"/></td>
            		
            	</tr>
            </table>
     	</form>
		
    </div>
</body>
<script type="text/javascript">
	phonecheck01Ob = document.querySelector("#phonecheck01");
	ipincheck01Ob = document.querySelector("#ipincheck01");
	function randomString() {
		var rancode='';
	    const chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZ'
	    const stringLength = 6
	    for (let i = 0; i < stringLength; i++) {
	      const rnum = Math.floor(Math.random() * chars.length)
	      rancode += chars.substring(rnum, rnum+1)
	    }
	    return rancode
	  }
	var checking01 = randomString();
	var checking;
	var checking2;
	phonecheck01Ob.onclick=function(){
		checking=prompt('인증번호를 입력하세요 '+ checking01,'')
		if(checking==checking01){
		location.href="./sign-up02.jsp"
		}else if(checking!=checking01){
			alert("인증번호를 다시 확인해주세요.")
			location.href="./sign-up01.jsp"
		}
	}
	
	ipincheck01Ob.onclick=function(){
		checking2=prompt('인증번호를 입력하세요 '+ checking01,'')
		if(checking2==checking01){
		location.href="./sign-up02.jsp"
		}else if(checking!=checking01){
			alert("인증번호를 다시 확인해주세요.")
			location.href="./sign-up01.jsp"
		}
	}
</script>
</html>