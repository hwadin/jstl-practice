<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<jsp:include page="../../common/header.jsp" />
<jsp:useBean id="pm" class="util.PageMaker" />
<!-- 한번에 보여줄 페이지 번호 개수 -->
<c:set target="${pm}" property="displayPageNum" value="5"/>
<!-- 한페이지에 보여줄 게시물 개수 -->
<c:set target="${pm.cri}" property="perPageNum" value="5"/>
<!-- 사용자가 요청한 페이지 번호 -->
<c:if test="${!empty param.page}">
	<c:set target="${pm.cri}" property="page" value="${param.page}"/>
</c:if>
<!-- 전체 게시물 개수  -->
<s:query var="r" dataSource="jdbc/MySQLDBCP">
	SELECT count(*) AS c FROM qna_board
</s:query>
<c:set target="${pm}" property="totalCount" value="${r.rows[0].c}"/>
<s:query var="rs" dataSource="jdbc/MySQLDBCP"
		startRow="${pm.cri.startRow}"
		maxRows="${pm.cri.perPageNum}">
	SELECT * FROM qna_board ORDER BY qna_re_ref DESC
</s:query>
<section class="wrap"> <!-- 본문내용은 섹션 안에서  -->
	<table>
		<tr>
			<th colspan="5">
				<h1>질문과 답변 목록</h1>
			</th>
		</tr>
		<c:if test="${!empty member}"> 
			<tr>
				<th colspan="5" style="text_align:right">
					<a href="qna_write.jsp">질문 작성하러 가기</a>
				</th>
			</tr>
		</c:if>
		<c:choose>
			<c:when test="${rs.rowCount > 0}">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성시간</th>
					<th>조회수</th>
				</tr>
				<c:forEach var="board" items="${rs.rows}">
					<c:choose>
						<c:when test="${board.qna_delete eq 'N'}">
							<tr>
								<td>${board.qna_num}</td>
								<td style="text-align:left;padding:5px;">
									<c:if test="${board.qna_re_lev != 0}">
										<c:forEach var="i" begin="1" end="${board.qna_re_lev}">
											&nbsp;&nbsp;&nbsp;
										</c:forEach>
										▶ <!-- ㅁ + 한자 -->
									</c:if>
									<a href="qna_detail.jsp?qna_num=${board.qna_num}">
									${board.qna_title}
									</a>
								</td>
								<td>${board.qna_name}</td>
								<td>${board.qna_date}</td>
								<td>${board.qna_readcount}</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<th colspan="5">삭제된 게시물 입니다.</th>
							</tr>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					<tr>
					<td colspan="5">
					<c:if test="${pm.cri.page ne 1}">
					<a href="qna_list.jsp?page=1">[처음]</a>
					</c:if>
					<c:if test="${pm.prev}">
						<a href="qna_list.jsp?page=${pm.startPage - 1}">[이전]</a>
					</c:if>
				<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
					<a href="qna_list.jsp?page=${i}">[${i}]</a>
				</c:forEach>
					<c:if test="${pm.next}">
						<a href="qna_list.jsp?page=${pm.endPage + 1}">[다음]</a>
					</c:if>
					<c:if test="${pm.cri.page != pm.maxPage}">
						<a href="qna_list.jsp?page=${pm.maxPage}">[마지막]</a>
					</c:if>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<th colspan="5">
						등록된 게시물이 없습니다.
					</th>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</section>
<jsp:include page="../../common/footer.jsp" />