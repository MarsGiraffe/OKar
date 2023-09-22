<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.kCar.dao.DAO_adm"
	import="project.kCar.vo.*" import="java.util.*"%>

<%
DAO_adm dao = new DAO_adm();

String RegCarNum = request.getParameter("RegCarNum");
String isPass = request.getParameter("isPass");
String accCntS = request.getParameter("accCnt");

String diag = request.getParameter("diag");

log(RegCarNum);

if(RegCarNum==null){
	RegCarNum="";
	List<MemCarRegist> mclist = dao.getMemCarInfo();
	for(MemCarRegist mcr:mclist){
	%>
	<tr>
		<td><%=mcr.getRegist_id() %></td>
		<td><%=mcr.getModel() %></td>
		<td name="carNum"><%=mcr.getCar_num() %></td>
		<td><%=mcr.getAddress() %></td>
		<td><%=mcr.getWant_time() %></td>
		<%if(mcr.getEval().equals("FALSE")){ %>
			<td class="text-center">  
			<button type="button" class="btn btn-outline-success mt-auto" 
			data-bs-toggle="modal" data-bs-target="#myModal" onclick="registEst()">평가등록
			</button></td>
		<%} else { %>
			<td class="text-center">  
			<button type="button" class="btn btn-outline-dark mt-auto" 
			data-bs-toggle="modal" data-bs-target="#myModal" disabled>등록완료
			</button></td>
		<%} %>
	</tr><%} %>

<%} 
if(!RegCarNum.equals(""))  {
	log(RegCarNum);
	int accCnt = Integer.parseInt(accCntS);
	Okay_CR ocr = new Okay_CR(RegCarNum,accCnt,isPass,diag);
	%>
	<%if(dao.insertEstiInfo(ocr).equals("Y")){%>
		<%=dao.UpdateEval(RegCarNum) %>
	<%} %>
<%} %>
