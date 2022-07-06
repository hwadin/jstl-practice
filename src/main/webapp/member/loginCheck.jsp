<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!-- loginCheck.jsp -->
<!--
	 로그인 요청 처리 
	 로그인 성공한 회원의 정보( 세션에 저장)를 member 를 키값으로 저장
-->
<f:requestEncoding value="utf-8" />
<jsp:useBean id="member" class="vo.MemberVO" scope="session"/>
<jsp:setProperty name="member" property="*"/>
<c:catch var="e">
	<s:query var="r" dataSource="jdbc/MySQLDBCP"
	 sql="SELECT * FROM big_member WHERE u_id =? AND u_pass=?">
	<s:param>${param.u_id}</s:param>
	<s:param>${param.u_pass}</s:param>
	</s:query>
	 <c:choose>
	 <c:when test="${r.rowCount>0}">
	 <h2>회원정보가 존재함.</h2>
	 <c:forEach var="data" items="${r.rows}">
	 	<c:set target="${member}" property="u_num" value="${data.u_num}"/>
	 	<c:set target="${member}" property="u_id" value="${data.u_id}"/>
	 	<c:set target="${member}" property="u_pass" value="${data.u_pass}"/>
	 	<c:set target="${member}" property="u_age" value="${data.u_age}"/>
	 	<c:set target="${member}" property="u_gender" value="${data.u_gender}"/>
	 	<c:set target="${member}" property="u_join" value="${data.u_join}"/>
	 	<c:set target="${member}" property="u_regdate" value="${data.u_regdate}"/><br/>
	 </c:forEach>
	 	<% 
	 	String login = request.getParameter("login");
	 	if(login !=null){
	 	Cookie cookie = new Cookie("u_id",member.getU_id());
		cookie.setMaxAge(60*60*24*7);
		cookie.setPath("/");
		response.addCookie(cookie);}
		%>
	<c:redirect url="/index.jsp"/>
	 </c:when>
	 <c:otherwise>
	 	<h2>회원정보가 존재하지않음.<h2>
	  <c:redirect url="/login.jsp"/>	
	 </c:otherwise>
 </c:choose>
</c:catch>
<c:if test="${!empty e}">
	<h3>검색 실패 - ${e.getMessage()}</h3>
</c:if>


<!-- loginCheck.jsp -->
<!--
	 로그인 요청 처리 
	 로그인 성공한 회원의 정보를 member 를 키값으로 저장
-->
<%-- <f:requestEncoding value="utf-8"/>
<jsp:useBean id="member"
			 class="vo.MemberVO" 
			 scope="session"/>
<jsp:setProperty property="u_id" name="member"/>
<jsp:setProperty property="u_pass" name="member"/>
<c:catch var="e">
	<s:query var="rs" dataSource="jdbc/MySQLDBCP">
		SELECT * FROM big_member 
		WHERE u_join = 'Y' and u_id = ? AND u_pass = ?
		<s:param>${member.u_id}</s:param>
		<s:param>${member.u_pass}</s:param>		
	</s:query>
	<c:choose>
		<c:when test="${rs.rowCount > 0}">							결과 행의정보는 하나니까 rs.rows[0]
			<jsp:setProperty name="member" property="u_num" value="${rs.rows[0]['u_num']}"/>
			<jsp:setProperty name="member" property="u_age" value="${rs.rows[0]['u_age']}"/>
			<jsp:setProperty name="member" property="u_gender" value="${rs.rows[0]['u_gender']}"/>
			<jsp:setProperty name="member" property="u_regdate" value="${rs.rows[0]['u_regdate']}"/>
			
			<!-- session 추가 완료 Cookie 확인 -->
			<c:if test="${!empty param.login}"> 로그인체크가 비어있지않으면
				<%
					Cookie cookie = new Cookie("u_id",member.getU_id());
					cookie.setPath("/");
					cookie.setMaxAge(60*60*24*7);
					response.addCookie(cookie);
				%>
			</c:if>
			<script>
				alert('${member.u_id} : 로그인 성공');
				location.href='../index.jsp';
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert('로그인 실패');
				history.go(-1);
			</script>
			<c:remove var="member" scope="session"/> -> 로그인실패했을때 세션정보 삭제해주기
		</c:otherwise>
	</c:choose>
</c:catch>
<c:if test="${!empty e}">
	<script>
		alert('로그인 실패 : ${e.message}');
		history.go(-1);
	</script>
</c:if> --%>
