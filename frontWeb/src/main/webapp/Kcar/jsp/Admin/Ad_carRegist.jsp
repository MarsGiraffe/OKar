<%@page import="project.kCar.dao.DAO_adm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" 
	import="java.util.*"
	%>
    <!DOCTYPE html>
    <html lang="en">

    <head>
	<%@ include file="Ad_Head.jsp" %> 
    </head>
<%
DAO_adm dao = new DAO_adm();
String carNum = request.getParameter("carNum"); 
log(carNum);

if(!carNum.equals("")){
	pageContext.setAttribute("info", dao.getMemCarEstedInfo(carNum));
			
}
%>

<script type="text/javascript">
function getSyn(page){
	var xhr = new XMLHttpRequest();
	xhr.open("get",page,false)
	xhr.send()
	return xhr.responseText;
}

function getGrade(){
	var manuVal = document.querySelector("#manufactor").value
	var modelVal = document.querySelector("#model").value
	var volVal = document.querySelector("#volume").value
	
	var htmlCode = getSyn("../back/CarRegistDB.jsp?manu="+manuVal+"&model="+modelVal+"&volume="+volVal)
	
	if(manuVal=='')
		document.querySelector("#manufactor").innerHTML=htmlCode
	if(manuVal!=''&&modelVal=='')
		document.querySelector("#model").innerHTML=htmlCode
	if(modelVal!=''&&volVal=='')
		document.querySelector("#volume").innerHTML=htmlCode
		
	if(volVal!=''){
		var htmlCodeOp = getSyn("../back/OptionDB.jsp?volume="+volVal)
		
		document.querySelector("#optionBox").innerHTML = htmlCodeOp
	}
}



function insertInfo(){
	var selManu = document.getElementById("manufactor");
	var selModel = document.getElementById("model");
	var selVolume = document.getElementById("volume");
	var manu = selManu.options[selManu.selectedIndex].text;
	var model = selModel.options[selModel.selectedIndex].text;
	var volume = selVolume.options[selVolume.selectedIndex].text;
	var carNumV = document.querySelector("#carNum").value
	var accidentV = document.querySelector("#accident").value
	var priceV = document.querySelector("#price").value
	var driveDistV = document.querySelector("#driveDist").value
	
	var opsV = document.querySelectorAll("input[name='option']:checked")
	var qrst = "";
	
	for(var i=0; i<opsV.length; i++){
		var options = opsV[i].value
		qrst += "&option=" + options;
		
		if(i !== opsV.length - 1){
			qrst += "&"
		}
	}

	
	var htmlCode=getSyn("../back/insertCar.jsp?manu="+manu+
			"&model="+model+"&vol="+volume+"&carNum="+carNumV+
			"&accident="+accidentV+"&price="+priceV+"&driveDist="+driveDistV+
			qrst).trim();
	console.log(htmlCode)
	if(htmlCode=="Y"){
		alert('등록완료')
		initInfo();
		window.location.href="Ad_carInfo.jsp"
	} else {
		alert('정보 입력이 잘못되었습니다.')
	}
}

function initInfo(){
	document.querySelector("#manufactor").value = ""
	document.querySelector("#model").value = ""
	document.querySelector("#volume").value = ""
	document.querySelector("#optionBox").innerHTML = ""
	document.querySelector("#carNum").value = ""
	document.querySelector("#accident").value = ""
	document.querySelector("#price").value = ""
	document.querySelector("#driveDist").value = ""
}
</script>
    <body>
    
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          
        </nav>
        <!-- Product section-->
        <div>
            <div class="container px-4 px-lg-5 my-5"> 
                <div class="inforow gx-4 gx-lg-5 align-items-center">
                    <div class="infosection">
                        <h1 class="display-7 fw-bolder subtitle">차량평가 정보</h1>
                        <ul class="carOptionLists">
                            <li class="info-1"><span><b>차량번호</b></span>
                               <li class="info-2"><span>${info.car_num }</span>
                            <li class="info-1"><span><b>차량명</b></span>
                               <li class="info-2"><span>${info.model }</span>
                            <li class="info-1"><span><b>주행거리</b></span>
                               <li class="info-2"><span>${info.drive_dist }km</span>
                            <li class="info-1"><span><b>신청자명</b></span>
                               <li class="info-2"><span>${info.mname }</span>
                            <li class="info-1"><span><b>휴대폰번호</b></span>
                               <li class="info-2"><span>${info.phone }</span>
                            <li class="info-1"><span><b>방문진단지역</b></span>
                               <li class="info-2"><span>${info.address }</span>
                            <li class="info-1"><span><b>판매시기</b></span>
                               <li class="info-2"><span>${info.want_time }</span>
                            <li class="info-1"><span><b>등록시기</b></span>
                               <li class="info-2"><span>${info.reg_time }</span>
                            <li class="info-1"><span><b>차량평가여부</b></span>
                               <li class="info-2"><span>${info.eval }</span>
                            <li class="info-1"><span><b>사고횟수</b></span>
                               <li class="info-2"><span>${info.accident_cnt }</span>
                            <li class="info-1"><span><b>사고내용</b></span>
                               <li class="info-2"><span>${info.diag }</span>
                            <li class="info-1"><span><b>차량등록여부</b></span>
                               <li class="info-2"><span>${info.isReg }</span>
                        </ul>
                    </div>
                    <div class="infosection">
                        <h1 class="display-7 fw-bolder subtitle">등록</h1>
                        <div class="btndiv">
							<button class="btn btn-outline-info flex-shrink-0 btndiv" 
									type="button" onclick="initInfo()">초기화
							</button>
							<button class="btn btn-outline-dark flex-shrink-0 btndiv" 
									type="button" onclick="insertInfo()">등록하기
							</button>
						</div>
                        <ul class="carOptionLists">
                        
                           	<li class="info-1"><span><b>제조사</b></span>
                           	<li class="info-2"><span>
	                            <select id="manufactor" onchange="getGrade()">     
	                            </select></span>
                               
                          	<li class="info-1"><span><b>모델</b></span>
                           	<li class="info-2"><span> 
	                            <select id="model" onchange="getGrade()">
	                            </select></span>
                                
                          	<li class="info-1"><span><b>배기량</b></span>
                          	<li class="info-2"><span> 
	                            <select id="volume" onchange="getGrade()">
	                            </select></span>
                               
                            <li class="info-1"><span><b>사고 건수</b></span>
                               <li class="info-2">
                               <input type="number" id="accident" value="0"/>건
                               
                            <li class="info-1"><span><b>주행거리</b></span>
                            	<li class="info-2">
                            	<input type="number" id="driveDist" value="0"/>km
                            	
                            <li class="info-1"><span><b>판매가격</b></span>
                            	<li class="info-2">
                            	<input type="number" id="price" placeholder="0"/>만원
                            	
                            <li class="info-1"><span><b>차량번호</b></span>
                            	<li class="info-2">
                            	<input type="text" id="carNum" value="${info.car_num }" disabled/>
                           
                        </ul>
                    	<form>
                    	 <div class="option-div" id="optionBox">
	                    </div>
	                    </form>
	                    
                    </div>
                </div>
            </div>
        </div>
       
    
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/static/js/scripts.js"></script>
        <script type="text/javascript">
        getGrade();
        </script>
    </body>

    </html>