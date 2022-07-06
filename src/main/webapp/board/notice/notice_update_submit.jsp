<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!-- 공지사항 게시글 정보 수정  -->
<f:requestEncoding value="utf-8"/>
<c:catch var="e">
	<jsp:useBean id="notice" class="vo.NoticeVO"/>
	<jsp:setProperty property="*" name="notice"/>
	<s:update var="result" dataSource="jdbc/MySQLDBCP">
		UPDATE notice_board SET 
		n_category = ?,
		n_title = ?,
		n_content = ? 
		WHERE n_num = ?
		<s:param>${notice.notice_category}</s:param>
		<s:param>${notice.notice_title}</s:param>
		<s:param>${notice.notice_content}</s:param>
		<s:param>${notice.notice_num}</s:param>
	</s:update>
	<c:choose>
		<c:when test="${result > 0}">
			<c:redirect url="notice_success.jsp"/>
		</c:when>
		<c:otherwise>
			<c:redirect url="notice_fail.jsp"/>
		</c:otherwise>
	</c:choose>
</c:catch>
<c:if test="${!empty e}">
	<c:redirect url="notice_fail.jsp"/>
</c:if>





