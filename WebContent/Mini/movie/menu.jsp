<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Menu -->
<nav id="menu">
	<c:if test="${sessionScope.adminId ne null}">
		<h2>안녕하세요, 관리자님</h2>
	</c:if>
	<c:if test="${sessionScope.adminId eq null}">
		<h2>안녕하세요</h2>
	</c:if>
	<ul>
		<c:if test="${sessionScope.adminId ne null}">
			<li><a href="adminLogout.do">로그아웃</a></li>
			<li><a href="movieInsertForm.do">영화 등록</a></li>
		</c:if>
		<c:if test="${sessionScope.adminId eq null}">
			<li><a href="adminLoginForm.do">관리자 로그인</a></li>
		</c:if>
		<li><a href="../index.html">Home</a></li>
	</ul>
</nav>
