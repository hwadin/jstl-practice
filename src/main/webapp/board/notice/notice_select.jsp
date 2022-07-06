<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!-- notice_select.jsp -->
<s:query var="rs" dataSource="jdbc/MySQLDBCP">
	SELECT * FROM notice_board WHERE n_num = ? 
	<s:param>${param.notice_num}</s:param>
</s:query>
<c:forEach var="row" items="${rs.rows}">
	<jsp:useBean id="notice" class="vo.NoticeVO" scope="request"/>
	<c:set target="${notice}" property="notice_num" value="${row.n_num}"/>
	<c:set target="${notice}" property="notice_category" value="${row.n_category}"/>
	<c:set target="${notice}" property="notice_author" value="${row.n_author}"/>
	<c:set target="${notice}" property="notice_title" value="${row.n_title}"/>
	<c:set target="${notice}" property="notice_content" value="${row.n_content}"/>
	<c:set target="${notice}" property="notice_date" value="${row.n_date}"/>	
</c:forEach>






