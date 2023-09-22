<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="project.kCar.dao.DAO_adm"
	import="project.kCar.vo.*" import="java.util.*"%>

<%
DAO_adm dao = new DAO_adm();

String delId = request.getParameter("id");


List<MemInfo> mlist = dao.getMemInfo();

if(delId==null){
	delId="";
	
	for(MemInfo m:mlist){%>
	<tr> 
		<td name="id"><%=m.getMem_id() %></td>
		<td><%=m.getMem_pass() %></td>
		<td><%=m.getMname() %></td>
		<td><%=m.getLicense_id() %></td>
		<td><%=m.getEmail() %></td>
		<td><%=m.getPhone() %></td>
		<td><%=m.getAuth() %></td>
		<td class="text-center"><a class="btn btn-outline-danger mt-auto"
			href="#" onclick="deleteMem()">삭제</a></td>
	</tr><%} %>
<%
} else {
%>
<%=dao.deleteMem(delId) %>
<%} %>
