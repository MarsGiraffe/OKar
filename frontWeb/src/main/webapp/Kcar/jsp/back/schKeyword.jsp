<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="project.kCar.vo.OkayCar_Res"%>
<%@page import="java.util.List"%>
<%@page import="project.kCar.dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String keyword = request.getParameter("keyword"); 
if(keyword==null){
	keyword="";
}

DAO dao = new DAO();
List<OkayCar_Res> clist = dao.searchKeyword(keyword);
	System.out.println(clist.size());
%>
<div style="width:100%; text-align: center;">
	<h2 style="display:block;">'<%=keyword %>'의 검색결과</h2><br>
</div>
<%
for (OkayCar_Res ok : clist) {
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
<%}
}%>