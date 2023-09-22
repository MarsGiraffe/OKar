<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="project.kCar.dao.DAO_adm"
    import="project.kCar.vo.*"%>
<%
DAO_adm dao = new DAO_adm();

String manuS = request.getParameter("manu");
int manu = 0;

String modelS = request.getParameter("model");
int model = 0;

String volS = request.getParameter("volume");
int vol = 0;

if(manuS.equals("")){%>
	<option value="">-선택-</option>
	<%for(CarRegistInfo cri:dao.getCarRegistList_Lev1()) {%>
	<option value="<%=cri.getCri_no()%>"><%=cri.getName() %></option>
	<%} 
} 

if(!manuS.equals("")&&modelS.equals("")){
	manu = Integer.parseInt(manuS);
	%>
	<option value="">-선택-</option>
	<%
	for(CarRegistInfo cri:dao.getCarRegistList_Lev2(manu)) {%>
	<option value="<%=cri.getCri_no()%>"><%=cri.getName() %></option>
	<%} 
	
} 
if (!modelS.equals("")&&volS.equals("")){
	model = Integer.parseInt(modelS);
	%>
	<option value="">-선택-</option>
	<%
	for(CarRegistInfo cri:dao.getCarRegistList_Lev2(model)) {%>
	<option value="<%=cri.getCri_no()%>"><%=cri.getName() %></option>
	<%}
}
%>







