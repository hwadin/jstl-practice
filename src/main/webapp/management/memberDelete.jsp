<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!-- memberDelete.jsp -->
<!-- 삭제할 회원 번호를 넘겨 받아 u_join column의 값을 N으로 수정 -->
<s:update dataSource="jdbc/MySQLDBCP">
	UPDATE big_member SET u_join = 'N',
	u_regdate = now() WHERE u_num = ?
	<s:param>${param.u_num}</s:param> 
</s:update>
<script>
	alert('회원 정보 삭제 완료');
	location.href="member.jsp";
</script>












