<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/common/header.jsp" />
<section class="wrap">
<form id="joinForm" action="<c:url value='/member/joinCheck.jsp'/>" method="post">
	<table class="join">
		<tr>
			<td colspan="2"><h1>회원가입</h1></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="u_id" autofocus required placeholder="ID 작성" /></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="u_pass" required placeholder="비밀번호 작성"/></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" id="re_pass" required placeholder="비밀번호 확인"/></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="number" name="u_age" required placeholder="나이 작성"/></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<label>
					<input type="radio" name="u_gender" value="male" checked/> 남성
				</label>
				<input type="radio" id="female" name="u_gender" value="female"/>
				<label for="female"> 여성 </label>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="button" onclick="javascript:directJoin();" value="회원가입" />
				 | 
				<button type="button" onclick="javascript:directLogin();">로그인</button>
			</td>
		</tr>
	</table>
</form>
</section>
<jsp:include page="/common/footer.jsp" />
<script>
	/* login page로 이동 */
	function directLogin(){
		location.href="<c:url value='/member/login.jsp'/>";
	}

	/* 회원가입 요청 처리 */
	function directJoin(){
		var form = document.getElementById("joinForm");
		var u_id = form.u_id;
		var u_pass = form.u_pass;
		var u_re_pass = document.getElementById("re_pass");
		var u_age = form.u_age;
		
		if(u_id.value.length > 12 || u_id.value.length < 4){
			alert('아이디는 4~12글자이내에서 작성해 주세요.');
			u_id.value = "";
			u_id.focus();
		}else if(u_pass.value.length > 8 || u_pass.value.length < 4){
			alert('비밀번호는 4~8글자이내에서 작성해주세요.');
			u_pass.value="";
			u_pass.focus();
		}else if(u_pass.value != u_re_pass.value){
			alert('비밀번호가 일치하지 않습니다.');
			u_re_pass.value="";
			u_re_pass.focus();
		}else if(u_age.value == null || u_age.value == '' || isNaN(u_age.value)){
			u_age.value="";
			u_age.focus();
		}else{
			form.submit();
		}
	}
</script>







