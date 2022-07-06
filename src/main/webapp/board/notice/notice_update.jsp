<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../common/header.jsp" />
<jsp:include page="notice_select.jsp" />
<section>
	<form action="notice_update_submit.jsp" method="post">
		<input type="hidden" name="notice_num" value="${notice.notice_num}" />
		<table class="list">
			<tr>
				<th colspan="2"><h1>공지사항 수정</h1></th>
			</tr>
			<tr>
				<td>카테고리</td>
				<td style="text-align: left; padding: 10px;"><select
					name="notice_category">
						<option value="${notice.notice_category}" selected>${notice.notice_category}</option>
						<option value="공지">공지</option>
						<option value="알림">알림</option>
						<option value="이벤트">이벤트</option>
						<option value="당첨">당첨</option>
				</select></td>
			</tr>
			<tr>
				<td>제목</td>
				<td style="text-align: left; padding: 10px;">
					<input type="text" name="notice_title" value="${notice.notice_title}"  required style="width:100%;"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td style="width: 700px;">
					<textarea style="width: 700px;height:100px;" name="notice_content" >${notice.notice_content}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="작성완료" /></td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="../../common/footer.jsp" />