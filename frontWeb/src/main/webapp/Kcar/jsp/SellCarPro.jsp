<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- vo 클래스 import --%>      
<%@ page import="project.kCar.vo.*" %>  
<%-- DAO import --%>   
<%@ page import="project.kCar.dao.A05_MemberDao" %> 
<!DOCTYPE html>
<html>
<head>
    <title>회원가입 처리 JSP</title>
    
    <!-- css 파일 분리 -->
</head>
<body>
    <%-- JoinForm.jsp에서 입력한 정보를 넘겨 받아 처리한다. --%>
    <% 
        // 한글 깨짐을 방지하기 위한 인코딩 처리
        request.setCharacterEncoding("UTF-8"); 
    %>
    
    <%-- 자바빈 관련 액션태그 사용 --%>
    <jsp:useBean id="memberBean" class="project.kCar.vo.SellCarInfo" />
    <jsp:setProperty property="*" name="memberBean"/>    
    
    <%
    	A05_MemberDao dao = A05_MemberDao.getInstance();
    
        // 회원정보를 담고있는 memberBean을 dao의 insertMember() 메서드로 넘긴다.
        // insertMember()는 회원 정보를 JSP_MEMBER 테이블에 저장한다.
        dao.insertSellCarInfo(memberBean);
    %>
    
    <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">신청 정보를 확인하세요.</font></b>
        <br><br>
        <br><br>
        
        <%-- 자바빈에서 입력된 값을 추출한다. --%>
        <table>
            <tr>
                <td id="title">차량번호</td>
                <td><%=memberBean.getCarnum() %></td>
            </tr>
                        
            <tr>
                <td id="title">차량명</td>
                <td><%=memberBean.getCarname() %></td>
            </tr>
                    
            <tr>
                <td id="title">주행거리</td>
                <td><%=memberBean.getMileage() %></td>
            </tr>
                    
            <tr>
                <td id="title">신청자명</td>
                <td><%=memberBean.getMname()%></td>
            </tr>
                    
            <tr>
                <td id="title">휴대폰번호</td>
                <td>
                    <%=memberBean.getPhone1() %>-
                    <%=memberBean.getPhone2() %>- 
                    <%=memberBean.getPhone3() %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">방문진단 요청지역</td>
                <td>
                    <%=memberBean.getH_area1()%><%=memberBean.getH_area2()%>
                </td>
            </tr>
                    
            <tr>
                <td id="title">판매시기</td>
                <td><%=memberBean.getSelldate() %></td>
            </tr>
            <tr>
                <td id="title">비밀번호</td>
                <td>
                    <%=memberBean.getPass() %>
                </td>
            </tr>
        </table>
        
        <br>
        <input type="button" value="확인">
    </div>
</body>
</html>
