<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="project.kCar.vo.*"%>
<%@page import="java.util.List"%>
<%@page import="project.kCar.dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String manu = request.getParameter("manu"); 
if(manu==""){
	manu=null;
}
String model = request.getParameter("model");
if(model==""){
	model=null;
}
String vol = request.getParameter("volume");
if(vol==""){
	vol=null;
}
System.out.println(manu);
System.out.println(model);
System.out.println(vol);
int price = 0;
int acc = 0;
int dist = 0;
String priceS = request.getParameter("price");
if(priceS.equals("null")) {
	price=0;
}
String accS = request.getParameter("acc");
if(accS.equals("null")) {
	acc=0;
}
String distS = request.getParameter("dist");
if(distS.equals("null")) {
	dist=0;
}


DAO dao = new DAO();
Map<String, String> sch = new HashMap<>();
sch.put("manu", manu);
sch.put("model", model);
sch.put("volume", vol);
sch.put("price", price+"");
sch.put("acc", acc+"");
sch.put("dist", dist+"");
for (OkayCar_Res ok : dao.searchCar(sch)) {
	System.out.println(ok.getCar_num());
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
<%
	if(ok.getCar_num() == null){
		%>
		<h2 style="text-align:center;">검색결과가 없습니다.</h2>
		<%
	}
%>
<%}
}%>