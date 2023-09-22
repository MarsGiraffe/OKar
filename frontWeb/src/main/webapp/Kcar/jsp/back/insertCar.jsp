<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="project.kCar.vo.*"
    import="project.kCar.dao.*"%>
<% // ?manu=현대&model=아반떼&vol=1.6가솔린&carNum=12가1234&accident=2&price=1800&driveDist=30000

String manufactor = request.getParameter("manu");
if(manufactor==null) manufactor="";
String model = request.getParameter("model");
if(model==null) model="";
String volume = request.getParameter("vol");
if(volume==null) volume="";
String carNum = request.getParameter("carNum");
if(carNum==null) carNum="";

String accidentS = request.getParameter("accident"); 
int accident = 0;
String priceS = request.getParameter("price");
int price = 0;
String driveDistS = request.getParameter("driveDist");
int driveDist = 0;

String options[] = request.getParameterValues("option");


DAO_adm dao = new DAO_adm();


if(!manufactor.equals("")&&!priceS.equals("")&&!carNum.equals("")){
	accident=Integer.parseInt(accidentS);
	price=Integer.parseInt(priceS);
	driveDist=Integer.parseInt(driveDistS);
	
	Okay_CR ocr = new Okay_CR(
			manufactor,model,volume,carNum,
			price,accident,driveDist);
	
	if(dao.insertCarInfo(ocr).equals("Y")){
		String allSuc="";
		for(int i=0; i<options.length; i++){
			log(options[i]);
			log(dao.insertOptions(carNum,options[i]));
			
			if(i == (options.length-1)){
				allSuc="Y";
			}%>			
		<%} 
		if(allSuc.equals("Y")){%>
		<%=dao.UpdateIsReg(carNum) %>
	<%} else {%>
		<%="N"%>
		<%} 
	} 
}%>


    
