<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!-- memberSubmit.jsp -->
<!-- 관리자 회원 정보 수정 완료 -->
<f:requestEncoding value="utf-8" />
<jsp:useBean id="updateMember" class="vo.MemberVO"/>
<jsp:setProperty property="*" name="updateMember"/>
<s:update var="result" dataSource="jdbc/MySQLDBCP">
	UPDATE big_member SET u_pass = ?, 
	u_age = ?, u_gender = ?, u_regdate = sysdate() 
	WHERE u_num = ?
	<s:param>${updateMember.u_pass}</s:param>
	<s:param>${updateMember.u_age}</s:param>
	<s:param>${updateMember.u_gender}</s:param>
	<s:param>${updateMember.u_num}</s:param>
</s:update>
<c:choose>
	<c:when test="${result == 1}">
		<script>
			alert('${updateMember.u_id} 정보 수정 완료');
			location.href='member.jsp';
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert('정보 수정 실패');
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>








