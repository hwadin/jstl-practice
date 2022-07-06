<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%-- DELETE FROM qna_board
	 WHERE qna_num = ${param.qna_num} --%>
<s:update dataSource="jdbc/MySQLDBCP">
	UPDATE qna_board SET qna_delete = 'Y'
	WHERE qna_num = ${param.qna_num} 	
</s:update>
<c:redirect url="qna_list.jsp"/>