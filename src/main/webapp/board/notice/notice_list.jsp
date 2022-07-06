<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<jsp:include page="../../common/header.jsp" />
<!-- 페이징 정보 처리 -->
<jsp:useBean id="pm" class="util.PageMaker" />
<c:if test="${!empty param.page}">
	<c:set target="${pm.cri}" property="page" value="${param.page}"/>
</c:if>
<!-- 전체 게시물 개수 -->
<s:query var="r" dataSource="jdbc/MySQLDBCP">
	SELECT count(*) AS c FROM notice_board
</s:query>
<c:set target="${pm}" property="totalCount" value="${r.rows[0].c}"/>

<!-- 게시물 목록 검색 -->
<s:query var="rs" dataSource="jdbc/MySQLDBCP"
         startRow="${pm.cri.startRow}" 
		 maxRows="${pm.cri.perPageNum}">
	SELECT * FROM notice_board
	 ORDER BY n_num DESC
</s:query>
<c:if test="${rs.rowCount > 0}">
	<jsp:useBean id="noticeList" 
				 class="java.util.ArrayList" 
			 	 type="java.util.List<vo.NoticeVO>"/>
	<c:forEach var="notice" items="${rs.rows}">
		<jsp:useBean id="vo" class="vo.NoticeVO" />
		<c:set target="${vo}" property="notice_num" value="${notice.n_num}"/>
		<c:set target="${vo}" property="notice_category" value="${notice.n_category}"/>
		<c:set target="${vo}" property="notice_author" value="${notice.n_author}"/>
		<c:set target="${vo}" property="notice_title" value="${notice.n_title}"/>
		<c:set target="${vo}" property="notice_content" value="${notice.n_content}"/>
		<c:set target="${vo}" property="notice_date" value="${notice.n_date}"/>
		<c:set var="temp" value="${noticeList.add(vo)}"/> 
		<c:remove var="vo"/>
	</c:forEach>		 	  
</c:if>
<section  class="wrap">
	<table class="list">
		<tr>
			<th colspan="4">
				<h1>공지사항-${noticeList.size()}</h1>
			</th>
		</tr>
		<c:if test="${member.u_id eq 'admin'}">
		<tr>
			<td colspan="4">
				<a href="notice_write.jsp">글 작성하러 가기</a>
			</td>
		</tr>
		</c:if>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
		<c:choose>
			<c:when test="${!empty noticeList}">
				<!-- 게시글 목록 존재 시 -->
				<c:forEach var="n" items="${noticeList}">
					<tr>
						<td>${n.notice_num}</td>
						<td>
							<a href="notice_detail.jsp?notice_num=${n.notice_num}">
								[${n.notice_category}] ${n.notice_title}
							</a>
						</td>
						<td>${n.notice_author}</td>
						<td>${n.notice_date}</td>
					</tr>
				</c:forEach>
				<tr>
					<th colspan="4">
						<c:if test="${pm.prev}">
							<a href="notice_list.jsp?page=1">[&lt;&lt;]</a>
							<a href="notice_list.jsp?page=${pm.startPage-1}">[&lt;]</a>
						</c:if>
						<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
							<c:choose>
								<c:when test="${pm.cri.page eq i}">
									<span style="color:red;">[${i}]</span>
								</c:when>
								<c:otherwise>
									<a href="notice_list.jsp?page=${i}">[${i}]</a>
								</c:otherwise>
							</c:choose>						
						</c:forEach>
						<c:if test="${pm.next}">
							<a href="notice_list.jsp?page=${pm.endPage+1}">[&gt;]</a>
						</c:if>
						<c:if test="${pm.cri.page != pm.maxPage}">
							<a href="notice_list.jsp?page=${pm.maxPage}">[&gt;&gt;]</a>
						</c:if>
					</th>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">등록된 게시물이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</section>
<jsp:include page="../../common/footer.jsp" />