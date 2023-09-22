<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="project.kCar.dao.DAO"
    import="project.kCar.vo.*"
    import="java.util.List"
    %>
    <%
    DAO dao = new DAO();%>
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<title>Insert title here</title>
	<script type="text/javascript">
	
	//function getSchCar(page){
	//	var xhr = new XMLHttpRequest();
	//	xhr.open("get",page,false);
	//	xhr.send()
	//	return xhr.responseText;
	//}    
	function key13(){
		if(event.keyCode==13) // 입력하다가 enter입력시만 검색
			callSchCarList()
	}
    function callSchCarList(){
    	var carname = document.querySelector("#carname").value;
    	document.querySelector("#SchCarList").innerHTML
    		=getSchCar("search.jsp?carname="+carname)
    }
    function getSchCar(page){
    	var carname = document.getElementsByName("carname");
		var comArr = [];
 		for(var i=0; i<coms.length; i++){
 			if(coms[i].checked){
 				comArr.push(coms[i].value);
 			}
 		}
		var xhr = new XMLHttpRequest();
		xhr.open("post","search.jsp",true);
		xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded")
		xhr.send("carname="+carname)
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				var codeList = JSON.parse(xhr.responseText)
				var show=""
				codeList.forEach(function(code){
					show+="<tr ondblclick='detail("+code.no+")' class='text-center "+(code.refno==0?'table-info':'')+"'>"
					show+="<td>"+code.no+"</td>"
					show+="<td>"+code.title+"</td>"
					show+="<td>"+(code.val==undefined?'':code.val)+"</td>"
					show+="<td>"+code.refno+"</td>"
					show+="<td>"+code.ordno+"</td>"
					show+="</tr>"
				})
				var tBody = document.querySelector("tbody")
				tBody.innerHTML = show;
	}    
    function schCar(page){
		var carname = document.getElementsByName("carname");
		var comArr = [];
 		for(var i=0; i<coms.length; i++){
 			if(coms[i].checked){
 				comArr.push(coms[i].value);
 			}
 		}
		var xhr = new XMLHttpRequest()
		xhr.open("post","search.jsp",true)
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded")
		xhr.send("carname="+carname)
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				var codeList = JSON.parse(xhr.responseText)
				var show=""
				codeList.forEach(function(code){
					show+="<tr ondblclick='detail("+code.no+")' class='text-center "+(code.refno==0?'table-info':'')+"'>"
					show+="<td>"+code.no+"</td>"
					show+="<td>"+code.title+"</td>"
					show+="<td>"+(code.val==undefined?'':code.val)+"</td>"
					show+="<td>"+code.refno+"</td>"
					show+="<td>"+code.ordno+"</td>"
					show+="</tr>"
				})
				var tBody = document.querySelector("tbody")
				tBody.innerHTML = show;
			}
		}
	}
    </script>
	<!-- css파일 분리 -->
	<link href="../resources/static/css/header.css" rel="stylesheet" type="text/css">
	<link href="../resources/static/css/main.css" rel="stylesheet" type="text/css">
	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/static/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/static/css/styles.css" rel="stylesheet" />
        <link href="../resources/static/css/styles_sidebar.css" rel="stylesheet" />
        <script type="text/javascript">
		function goSellCar(){
			var win = window.open('SellCar.jsp');
			win.focus()
		}
	
	</script> 
</head>
<body>
<!-- 헤더 -->
<div class="kcarHeader">
	<div class="gnbArea">
		<div class="topNavi">
			<h1 class="kcarHeaderLogo"></h1>
			<button class="menuAll">
				<span class="_hidden">전체메뉴</span>
			</button>
			<ul class="el-menu-demo gnb el-menu--horizontal el-menu">
				<li class="el-submenu">
					<div class="el-submenu__title" onclick="goSellCar()">
						내차팔기
					</div>
				</li>
				<li class="el-submenu">
					<div class="el-submenu__title">
						내차사기
					</div>
				</li>
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
	<!-- 내용 -->
	<div class="box">
		<div>
			<h1>차량모델검색</h1>
		</div>
		<div class="search">
			<div class="searchL">
				<input type="text" onkeyup="key13()" name="keyword" 
				 id="searchInput" class="searchBox" placeholder="원하는 차량을 검색하세요.">
			</div>
			<div class="searchR">
				<button type="button" onclick="callSchCarList()" class="searchBtn">
					<span>차량검색</span>
				</button>
			</div>
		</div>
		<form>
		<div class="rtabBox">
			<div class="selectBox">
			<div class="sign_line">
                    <div class="sign_input">
                        <span class="selecbox1">
                         <!-- 국산/수입 -->   
                        <select style="font-size: 15px;font-weight: bold;color: #16171d;" name="h_area1" onChange="cat1_change(this.value,h_area2)" class="h_area1">
							  <option selected>국산/수입</option>
							  <option value='1'>국산</option>
							  <option value='2'>수입</option>
                            </select>
                        </span>
                        
                    </div>
                    <div class="sign_input">
                    <span class="selecbox2">
                         <!-- 제조사 선택 -->   
                            <select style="font-size:15px" name="h_area2" onChange="cat2_change(this.value.h_area3)" class="h_area2">
							  <option>제조사 선택</option>
							</select>
                        </span>
                    </div>
                    <div class="sign_input">
                    <span class="selecbox3">
                         <!-- 모델 선택 -->   
                            <select style="font-size:15px" name="h_area3" onChange="cat3_change(this.value.h_area4)" class="h_area3">
							  <option>모델 선택</option>
							</select>
                        </span>
                    </div>
                    <div class="sign_input">
                    <span class="selecbox4">
                         <!-- 세부모델 선택 -->   
                            <select style="font-size:15px" name="h_area4" onChange="cat4_change(this.value)" class="h_area4">
							  <option>세부모델 선택</option>
							</select>
                        </span>
                    </div>
                    <button type="button" id="mkt_clickSearchCar" class="el-button btnSearch apply el-button--default">
                    	<span>검색하기</span>
                    </button>
                </div>
                </div>
		</div>
		</form>
	</div>
	<form id="SchCarList">
	<section class="py-5" style="position: relative;" >
       <div class="container px-4 px-lg-5 mt-5">
           <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <%
				List<SchCar> clist = dao.getSchCarList();
				for(SchCar schlist : clist){
			   %>
               <div class="col mb-5" >
                   <div class="card h-100" onclick="location.href='detailCar.jsp';">
                       <!-- Product image-->
                       <img class="card-img-top" src="	https://img.kcar.com/carpicture/carpicture03/pic6083/kcarM_60836237_001.jpg" alt="...">
                       <!-- Product details-->
                       <div class="card-body p-4">
                           <div class="text-center">
                               <!-- Product name-->
                               <h5 class="fw-bolder"><%=schlist.getCarname() %></h5>
                               <!-- Product price-->
                               <%=schlist.getPrice() %>만원
                           </div>
                       </div>
                       <!-- Product actions-->
                       <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                           <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상세보기</a></div>
                       </div>
                   </div>
               </div>
               <%}%>
           </div>
       </div>
   </section>
</form>

	
</div>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/static/js/scripts_sidebar.js"></script>
<script language=javascript>

 var cat1_num = new Array(1,2);
 var cat1_name = new Array('국산','수입');

 var cat2_num = new Array();
 var cat2_name = new Array();

 var cat3_num = new Array();
 var cat3_name = new Array();

 var cat4_num = new Array();
 var cat4_name = new Array();
 
 

 cat2_num[1] = new Array(3,4);
 cat2_name[1] = new Array('현대','기아');

 cat2_num[2] = new Array(5,6);
 cat2_name[2] = new Array('벤츠','BMW');

 cat3_num[3] = new Array(7,8,9,10,11);
 cat3_name[3] = new Array('싼타페','코나','그랜저','i30','아반떼');

 cat3_num[4] = new Array(12,13,14);
 cat3_name[4] = new Array('카니발','모하비','셀토스');

 cat3_num[5] = new Array(15,16);
 cat3_name[5] = new Array('C클래스','S클래스');

 cat3_num[6] = new Array(17,18);
 cat3_name[6] = new Array('xm3','xm4');

 cat4_num[7] = new Array(19);
 cat4_name[7] = new Array('더뉴싼타페');

 cat4_num[8] = new Array(20);
 cat4_name[8] = new Array('코나1.6');
    
 cat4_num[9] = new Array(21,22);
 cat4_name[9] = new Array('그랜저 IG', '더 뉴 그랜저');
    
 cat4_num[10] = new Array(23);
 cat4_name[10] = new Array('i30 1.6');
    
 cat4_num[11] = new Array(24);
 cat4_name[11] = new Array('아반떼 AD');
    
 cat4_num[12] = new Array(193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214);
 cat4_name[12] = new Array('광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');

 cat2_num[13] = new Array(215,216,217,218,219,220,221,222,223,224,225,226,227,228,229);
 cat2_name[13] = new Array('군산시','김제시','남원시','익산시','전주시 덕진구','전주시 완산구','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');

 cat2_num[14] = new Array(230,231,232,233);
 cat2_name[14] = new Array('서귀포시','제주시','남제주군','북제주군');

 cat2_num[15] = new Array(234,235,236,237,238,239,240,241,242,243,244,245,246,247,248);
 cat2_name[15] = new Array('공주시','논산시','보령시','서산시','아산시','천안시','금산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');

 cat2_num[16] = new Array(249,250,251,252,253,254,255,256,257,258,259,260);
 cat2_name[16] = new Array('제천시','청주시 상당구','청주시 흥덕구','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');

function cat1_change(key,sel){
 if(key == '') return;
 var name = cat2_name[key];
 var val = cat2_num[key];

 for(i=sel.length-1; i>=0; i--)
  sel.options[i] = null;
 sel.options[0] = new Option('선택','', '', 'true');
 for(i=0; i<name.length; i++){
  sel.options[i+1] = new Option(name[i],val[i]);
 }
}
function cat2_change(key,sel){
 if(key == '') return;
 var name = cat3_name[key];
 var val = cat3_num[key];

 for(i=sel.length+1; i>=0; i--)
  sel.options[i] = null;
 sel.options[0] = new Option('선택','', '', 'true');
 for(i=0; i<name.length; i++){
  sel.options[i+1] = new Option(name[i],val[i]);
 }
}
function cat3_change(key,sel){
 if(key == '') return;
 var name = cat4_name[key];
 var val = cat4_num[key];

 for(i=sel.length+1; i>=0; i--)
  sel.options[i] = null;
 sel.options[0] = new Option('선택','', '', 'true');
 for(i=0; i<name.length; i++){
  sel.options[i+1] = new Option(name[i],val[i]);
 }
}
</script>
</body>

</html>