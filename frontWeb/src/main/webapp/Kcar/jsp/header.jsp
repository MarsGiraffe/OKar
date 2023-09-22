<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- css파일 분리 -->
	<link href="../resources/static/css/header.css" rel="stylesheet" type="text/css">
	</head>
	<body id="headerbody">
	<div class="kcarHeader">
		<div class="gnbArea">
			<div class="topNavi">
				<h1 class="kcarHeaderLogo"></h1>
				<button class="menuAll">
				<span class="_hidden">전체메뉴</span>
				</button>
				<ul role="menubar"
					class="el-menu-demo gnb el-menu--horizontal el-menu"
					style="background-color:;">
					
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
	</div>
	
	</body>
	
	</html>