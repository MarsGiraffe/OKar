<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="project.kCar.dao.DAO_adm"
    import="project.kCar.vo.*"%>

<%
DAO_adm dao = new DAO_adm();

String volS = request.getParameter("volume");
if(volS==null) volS ="";
String opid = "";
int chNum = 0;


if(!volS.equals("")){%>
<div class="option-section"><h4>내장</h4>
<%
opid = "int";
	for(Options co:dao.getOptionList(opid)){
		chNum++;
%>
	<div class="option-check">
		<input type="checkbox" class="form-check-input" id="check<%=chNum%>" name="option" value="<%=co.getOpid()%>">
		<label class="optionName" for="check<%=chNum%>"><%=co.getOpname()%></label>
	</div>
	<%
	}
	%>
</div>
<div class="option-section"><h4>외장</h4>
<%
opid = "ext";
	for(Options co:dao.getOptionList(opid)){
	chNum++;
%>
	<div class="option-check">
		<input type="checkbox" class="form-check-input" id="check<%=chNum%>" name="option" value="<%=co.getOpid()%>">
		<label class="optionName" for="check<%=chNum%>"><%=co.getOpname()%></label>
	</div>
	<%
	}
	%>
</div>
<div class="option-section"><h4>안전</h4>
<%
opid = "saf";
	for(Options co:dao.getOptionList(opid)){
	chNum++;
%>
	<div class="option-check">
		<input type="checkbox" class="form-check-input" id="check<%=chNum%>" name="option" value="<%=co.getOpid()%>">
		<label class="optionName" for="check<%=chNum%>"><%=co.getOpname()%></label>
	</div>
	<%
	}
	%>
</div>
<div class="option-section"><h4>편의</h4>
<%
opid = "con";	
	for(Options co:dao.getOptionList(opid)){
	chNum++;
%>
	<div class="option-check">
		<input type="checkbox" class="form-check-input" id="check<%=chNum%>" name="option" value="<%=co.getOpid()%>">
		<label class="optionName" for="check<%=chNum%>"><%=co.getOpname() %></label>
	</div>
	<%}%>
</div>
<%}%>
