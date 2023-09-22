<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.kCar.dao.DAO_adm"
	import="project.kCar.vo.*" import="java.util.*"%>
	

<%
DAO_adm dao = new DAO_adm(); 
String estCarNum = request.getParameter("estCarNum");


if(estCarNum==null){
	estCarNum="";
	List<MemCarRegist> mcelist = dao.getMemCarEstedInfo();
	for(MemCarRegist mce:mcelist){
	%>
	<tr>
		<td><%=mce.getRegist_id()%></td> 
		<td><%=mce.getModel()%></td>
		<td name="carNum"><%=mce.getCar_num() %></td>
		<td><%=mce.getDiag() %></td>
		<td><%=mce.getIsPass() %></td>
		<%if(mce.getIsReg().equals("FALSE")){ %>
			<td class="text-center">  
			<button type="button" class="btn btn-outline-success mt-auto" onclick="goRegister()">
			차량등록
			</button></td>
		<%} else { %>
			<td class="text-center">  
			<button type="button" class="btn btn-outline-dark mt-auto" disabled>
			등록완료
			</button></td>
		<%} %>
	</tr><%} %>

<%} %>

