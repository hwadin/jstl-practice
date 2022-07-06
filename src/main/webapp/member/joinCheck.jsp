<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!-- joinCheck.jsp -->
<!-- 회원가입 처리 -->
<f:requestEncoding value="utf-8"/>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${param.id}-${param.pass}-${param.age}-${param.gender} <br/>
	 --%>
<c:catch var="e">
<s:setDataSource var="conn"
driver="com.mysql.cj.jdbc.Driver" 
url="jdbc:mysql://localhost:3306/bigdata" 
user="bigdata" 
password="12345" 
/>
<h3>${conn}</h3>
<!-- 정보 삽입 -->
<s:update var="result" dataSource="${conn}">
	INSERT INTO big_member(u_id,u_pass,u_age,u_gender) VALUES(?,?,?,?)
		<s:param>${param.u_id}</s:param>
		<s:param>${param.u_pass}</s:param>
		<s:param>${param.u_age}</s:param>
		<s:param>${param.u_gender}</s:param>
</s:update>
<c:if test="${result > 0}">
	<h3>회원가입 성공</h3>
</c:if>
</c:catch>
<c:if test="${!empty e}">
	에러메세지 : <c:out value="${e.message}"/>
</c:if>
</body>
</html>

<%-- <f:requestEncoding value="utf-8"/>
<c:catch var="e">
	<jsp:useBean id="joinMember" class="vo.MemberVO"/>
	<jsp:setProperty property="*" name="joinMember"/>
</c:catch>
<c:choose>
	<c:when test="${!empty e}">
		<script>
			alert('회원정보가 잘못되었습니다.');
			history.go(-1);
		</script>
	</c:when>
	<c:otherwise>
		<s:query var="rs" dataSource="jdbc/MySQLDBCP">
			SELECT * FROM big_member WHERE u_id = ?
			<s:param>${joinMember.u_id}</s:param>
		</s:query>
		<c:choose>
			<c:when test="${!empty rs.rows}">
				<script>
					alert('이미 사용중인 아이디입니다.');
					history.go(-1);
				</script>
			</c:when>
			<c:otherwise>
				<s:update var="result" dataSource="jdbc/MySQLDBCP">
					INSERT INTO big_member(u_id,u_pass,u_age,u_gender) 
					VALUES(?,?,${joinMember.u_age},?)  ->age는 정수값이니까 쿼리문에 바로 넣어줌.
					<s:param>${joinMember.u_id}</s:param>
					<s:param>${joinMember.u_pass}</s:param>
					<s:param>${joinMember.u_gender}</s:param>
				</s:update>
				<script>
					alert("${result}행 삽입 완료");
					location.href='login.jsp';
				</script>
			</c:otherwise>
		</c:choose>
	</c:otherwise>
</c:choose>


 --%>















