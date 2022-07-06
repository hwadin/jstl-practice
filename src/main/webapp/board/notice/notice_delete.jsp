<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<!-- notice_delete.jsp -->
<s:update var="result" dataSource="jdbc/MySQLDBCP">
	DELETE FROM notice_board WHERE n_num = ?
	<s:param>${param.notice_num}</s:param>
</s:update>
<c:if test="${result > 0}">
	<c:redirect url="notice_success.jsp"/>
</c:if>
<c:if test="${result != 1}">
	<c:redirect url="notice_fail.jsp"/>
</c:if>










