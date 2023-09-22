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
	<link href="./css/sign-up02.css" rel="stylesheet" type="text/css">
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
    <div id="main" class="container mt-3">
        <div id="content">
			<div>
				<h2 id="pageintro">회원가입</h2>
            </div>
			<div id="processbox">
				<span class="checkedprocess">&nbsp;V&nbsp;</span>
				<span id="checkingprocess">&nbsp;2&nbsp;</span>
				<span class="checkedprocess">&nbsp;3&nbsp;</span>
			</div>
		</div>
    	<form id="form" action="./sign-up03.jsp" method="post">
            <div class="mb-3 mt-3 inputbox">
                <label for="memname">이름</label>
                <input type="text" class="form-control inputbox2" 
                id="memname" placeholder="이름을 입력해주세요" name="memname">
                <div class="notice" id="noticeName"></div>
            </div>
            <div class="mb-3 mt-3 inputbox">
                <label for="id">아이디</label>
                <input type="text" class="form-control inputbox2" 
                id="id" placeholder="아이디를 입력해주세요" name="id">
                <div class="notice" id="noticeId"> 아이디는 6자 이상 입력해주세요</div>
            </div>
            <button type="button" class="btn btn-secondary" id="validbtn">중복 확인</button>
        <div class="mb-3 mt-3 inputbox">
                <label for="pass">비밀번호</label>
                <input type="password" class="form-control inputbox2" 
            id="pass" placeholder="비밀번호를 입력해주세요" name="pass">
            <span class="notice" id="noticePass">비밀번호는 영어,숫자,특수문자중 2개를 포함하여 8~20자로 설정해주세요</span>
        </div>
        <div class="mb-3 mt-3 inputbox">
            <label for="passcheck">비밀번호 확인</label>
            <input type="password" class="form-control inputbox2" 
            id="passcheck" placeholder="비밀번호를 재입력해주세요" name="passcheck">
            <span class="notice" id="noticeCheckPass">비밀번호를 다시 한번 입력해주세요</span>
        </div>
        <div class="mb-3 mt-3 inputbox">
            <label for="email">이메일</label>
            <input type="text" class="form-control inputbox2" 
            id="email" placeholder="이메일을 입력해주세요" name="email">
            <span class="notice" id="noticeEmail">사용하시는 이메일을 입력해주세요</span>
        </div>
        <div class="mb-3 mt-3 inputbox">
            <label for="phonenum">전화번호</label>
            <input type="tel" class="form-control inputbox2" 
            id="phonenum" placeholder="전화번호를 입력해주세요" name="phonenum">
            <span class="notice" id="noticePhone">사용하시는 전화번호를 입력해주세요</span>
        </div>
        <div id="btnbox">
			<button type="submit" class="btn btn-primary" id="btn02">회원가입 진행</button>
        </div>
        
    </form>
    
</div>
</div>
</body>
<script type="text/javascript">
var memnameOb = document.querySelector("#memname")
var idOb = document.querySelector("#id")
var passOb = document.querySelector("#pass")
var passcheckOb = document.querySelector("#passcheck")
var emailOb = document.querySelector("#email")
var phonenumOb = document.querySelector("#phonenum")
var noticeNameOb = document.querySelector("#noticeName")
var noticeIdOb = document.querySelector("#noticeId")
var noticePassOb = document.querySelector("#noticePass")
var noticeCheckPassOb = document.querySelector("#noticeCheckPass")
var noticeEmailOb = document.querySelector("#noticeEmail")
var noticePhoneOb = document.querySelector("#noticePhone")
var validbtnOb = document.querySelector("#validbtn")
var btn02 = document.querySelector("#btn02")

// 비밀번호 입력란 입력값
var str01;
// 비밀번호 재입력란 입력값
var str02;
// 이름 형식에 대한 정규식 선언(한글로 최소 2글자)
var nameptrn = /^[가-힣]{2,}$/;
// 아이디 형식에 대한 정규식 선언(영어와 숫자를 포함하여 글자수 제한 6)
var idptrn = /^[a-zA-Z]+[a-zA-Z0-9]{5,}$/g;
// 비밀번호 형식에 대한 정규식 선언(영어 대문자와 소문자, 숫자, 특수문자중 2개 이상 입력 및 글자 수 제한 8~20)
var passptrn =/^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{8,20}$/;
// 이메일 형식에 대한 정규식 선언(영어 또는 숫자 + @ 영어 또는 숫자 + . + 2자 이상 영어)
var emailptrn = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$/;
// 핸드폰 번호 형식에 대한 정규식 선언(01+(0,1,6,7,8,9)+숫자(3~4자)+숫자(4자))
var phoneptrn = /^01([0|1|6|7|8|9])\d{3,4}\d{4}$/;
// 공백 검사용 정규식 선언
var reg = /\s/g;
// 아이디 중복확인 버튼 비활성화
validbtnOb.disabled=true;
// 회원가입 진행 버튼 비활성화
btn02.disabled=true;
var flag1=false;
var flag2=false;
var flag3=false;
var flag4=false;
var flag5=false;
var flag6=false;
function checkBtn(){
	if(flag1===true&&flag1===flag2&&flag2===flag3&&flag3===flag4&&flag4===flag5&&flag5===flag6){
		btn02.disabled=false;
	}else{
		btn02.disabled=true;
	}
	if(btn02.disabled===false&&str01!=str02){
			btn02.disabled=true;
			noticePassOb.innerText="입력한 비밀번호를 다시 확인해주세요!"
			noticePassOb.style.color="red"
	}
}
	
// 이름 입력란 keyup 이벤트
memnameOb.onkeyup=function(){
	if(nameptrn.test(this.value)){
		noticeNameOb.innerText="";
		flag1=true;
		// 이름 입력란에 입력한 값에 공백이 있을 경우 
		// 안내 문구 변경
	}else if(this.value.match(reg)){
		noticeNameOb.innerText="이름에 공백이 들어가있습니다!! 다시 확인해주세요"
		noticeNameOb.style.color="red"
		flag1=false;
	// 이름 입력란에 입력한 값이 형식에 불일치할 경우
	// 안내 문구 초기화
	}else if(!nameptrn.test(this.value)){
		noticeNameOb.innerText="이름을 제대로 입력해주세요!!";
		noticeNameOb.style.color="red"
			flag1=false;
	}else{
		flag1=false;
	}
	checkBtn()
}

// 아이디 입력란 keyup 이벤트
idOb.onkeyup=function(){
	// 아이디 입력란에 입력한 값에 공백이 없고,
	// 형식과 일치할 경우 아이디 중복확인버튼 활성화 및 안내문구 초기화
	if(!this.value.match(reg)&&idptrn.test(this.value)){
		noticeIdOb.innerText=""
		validbtnOb.disabled=false;
		flag2=false;
	// 아이디 입력란에 입력한 값에 공백이 있을 경우,
	// 안내문구 변경 및 아이디 중복확인 버튼 비활성화
	}else if(this.value.match(reg)){
		noticeIdOb.innerText="공백이 들어가있습니다!! 확인해주세요"
		noticeIdOb.style.color="red"
		validbtnOb.disabled=true;
		flag2=false;
	// 아이디 입력란에 입력한 값이 형식과 불일치할 경우,
	// 안내문구 변경 및 아이디 중복확인 버튼 비활성화
	}else if(!idptrn.test(this.value)){
		noticeIdOb.innerText="아이디는 영문으로 시작하고, 영어와 숫자를 이용하여 6~20자로 입력해야합니다."
		noticeIdOb.style.color="red"
		validbtnOb.disabled=true;
		flag2=false;
	}else{
		flag2=false;
	}
	checkBtn()
}

// 비밀번호 입력란 keyup 이벤트
passOb.onkeyup=function(){
    // 비밀번호 입력란 입력 값
    str01=passOb.value;
    // 비밀번호 입력란에 입력한 값과 선언한 정규식 패턴이 
    // 일치할 경우 색상 및 안내 문구 변경
    if(str01.length>=8&&str01.length<=20&&passptrn.test(str01)){	
        noticePassOb.innerText="올바르게 입력하였습니다."
        noticePassOb.style.color="#aaaaaa"
        flag3=true;
    // 비밀번호 입력란에 입력한 값과 기존 비밀번호가
    // 일치하지 않을 경우 색상 및 안내 문구 변경
	}else if(str01.match(reg)){
		noticePassOb.innerText="비밀번호에 공백이 들어가 있습니다. 다시 확인해주세요!"
		noticePassOb.style.color="red"
		flag3=false;
	    // 비밀번호 입력란에 입력한 값과 선언한 정규식 패턴이 
	    // 일치하지 않을 경우 색상 및 안내 문구 변경
	}else if(!passptrn.test(str01)){
		noticePassOb.innerText="영문/숫자/특수문자 중 2가지 이상 조합하여 8~20자로 입력해주세요."
		noticePassOb.style.color="red"
		flag3=false;
	}else{
		noticePassOb.innerText="영문/숫자/특수문자 중 2가지 이상 조합하여 8~20자로 입력해주세요."
		noticePassOb.style.color="black"
		flag3=false;
	}
   
    checkBtn()

}

// 비밀번호 재입력란 keyup 이벤트
passcheckOb.onkeyup=function(){
	// 비밀번호 재입력란 입력 값
    str02=passcheckOb.value;
    // 비밀번호 입력란에 입력한 값과 비밀번호 재입력란에 입력한 값이
    // 일치할 경우 안내 문구 변경  
    if(str01==str02){
		noticeCheckPassOb.innerText="입력하신 비밀번호가 동일합니다."
		noticeCheckPassOb.style.color="#aaaaaa"
		flag4=true;
	// 비밀번호 입력란에 입력한 값과 비밀번호 재입력란에 입력한 값이
	// 다를 경우 색상 및 안내문구 변경
    }else{
		noticeCheckPassOb.innerText="입력하신 비밀번호가 일치하는지 다시 확인해주세요!!"
        noticeCheckPassOb.style.color="red";
		flag4=false;
    }
    
    checkBtn()
}
// 이메일 입력란 keyup 이벤트
emailOb.onkeyup=function(){
	if(emailptrn.test(this.value)){
		noticeEmailOb.innerText="이메일 입력 완료!"
		noticeEmailOb.style.color="black"
		flag5=true;
	}else if(this.value.match(reg)){
		noticeEmailOb.innerText="이메일에 공백이 들어가 있습니다. 다시 확인해주세요!"
		noticeEmailOb.style.color="red"
		flag5=false;
	}else if(!emailptrn.test(this.value)){
		noticeEmailOb.innerText="이메일 형식에 올바르지 않습니다. 다시 확인해주세요!"
		noticeEmailOb.style.color="red"
		flag5=false;
	}
	checkBtn()
}

// 핸드폰 번호 입력란 keyup 이벤트
phonenumOb.onkeyup=function(){
	if(phoneptrn.test(this.value)){
		noticePhoneOb.innerText="전화번호 입력 완료!"
		noticePhoneOb.style.color="black"
		flag6=true;
	}else if(this.value.match(reg)){
		noticePhoneOb.innerText="전화번호에 공백이 들어가 있습니다. 다시 확인해주세요!"
		noticePhoneOb.style.color="red"
		flag6=false;
	}else if(!phoneptrn.test(this.value)){
		noticePhoneOb.innerText="전화번호 형식에 올바르지 않습니다. 다시 확인해주세요!"
		noticePhoneOb.style.color="red"
		flag6=false;
	}
	checkBtn()
}

// 아이디 중복검사
validbtnOb.onclick=function(){
	var page = "./back/validCheckId.jsp?id="+idOb.value
	var xhr = new XMLHttpRequest()
	xhr.open("get",page,true)
	xhr.send()
	xhr.onreadystatechange=function(){
		if(xhr.readyState==4&&xhr.status==200){
			var memObj = JSON.parse(xhr.responseText)
			console.log(memObj)
			if(memObj.id==""){
				alert(idOb.value+"은 사용 가능한 아이디입니다.")
				flag2=true;
			}else{
				alert(idOb.value+"는 이미 등록되어 있습니다.\n다른 아이디 입력하세요")
				idOb.value=""
				idOb.focus()
				flag2=false;
			}
		}
				checkBtn()
	}
			
}


</script>
</html>