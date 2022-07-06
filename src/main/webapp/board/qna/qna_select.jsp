<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>

<s:query var="rs" dataSource="jdbc/MySQLDBCP">
	SELECT * FROM qna_board WHERE qna_num = ?
	<s:param>${param.qna_num}</s:param>
</s:query>
<c:forEach var="row" items="${rs.rows}">
	<jsp:useBean id="qna" class="vo.QNABoardVO"/>
	<c:set target="${qna}" property="qna_num" value="${row.qna_num}"/>
	<c:set target="${qna}" property="qna_name" value="${row.qna_name}"/>
	<c:set target="${qna}" property="qna_title" value="${row.qna_title}"/>
	<c:set target="${qna}" property="qna_content" value="${row.qna_content}"/>
	<c:set target="${qna}" property="qna_re_ref" value="${row.qna_re_ref}"/>
	<c:set target="${qna}" property="qna_re_lev" value="${row.qna_re_lev}"/>
	<c:set target="${qna}" property="qna_re_seq" value="${row.qna_re_seq}"/>
	<c:set target="${qna}" property="qna_readcount" value="${row.qna_readcount}"/>
	<c:set target="${qna}" property="qna_writer_num" value="${row.qna_writer_num}"/>
	<c:set target="${qna}" property="qna_date" value="${row.qna_date}"/>
</c:forEach>

