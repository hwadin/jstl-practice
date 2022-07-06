<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <!-- 로그아웃 요청 처리 -->
<%
	Cookie cookie = new Cookie("u_id","");
	cookie.setMaxAge(0);
	cookie.setPath("/");
	response.addCookie(cookie);
	session.removeAttribute("member");
%>

<c:redirect url="/index.jsp"/>	

<%--  <!-- 로그아웃 요청 처리 -->

<c:remove var="member" scope="session"/> 
<%
	Cookie cookie = new Cookie("u_id","");
	cookie.setPath("/");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
%>
<script>
	alert("로그아웃 완료!");
	location.href='../index.jsp';
</script>
 --%>

