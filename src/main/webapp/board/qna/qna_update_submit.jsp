<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!-- qna_update_submit.jsp -->
<f:requestEncoding value="utf-8"/>
<jsp:useBean id="qna" class="vo.QNABoardVO"/>
<jsp:setProperty property="*" name="qna"/>
<s:update dataSource="jdbc/MySQLDBCP">
	UPDATE qna_board SET 
	qna_name = ? ,
	qna_title = ? ,
	qna_content = ? 
	WHERE qna_num = ?
	<s:param>${qna.qna_name}</s:param>
	<s:param>${qna.qna_title}</s:param>
	<s:param>${qna.qna_content}</s:param>
	<s:param>${qna.qna_num}</s:param>	
</s:update>
<c:redirect url="qna_detail.jsp?qna_num=${qna.qna_num}"/>
