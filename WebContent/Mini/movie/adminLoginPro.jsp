<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="${project}/Mini/movie/script.js"></script>

<%-- result는 request 객체로 넘어오지만 requestScope는 생략이 가능. --%>
<c:if test="${result eq -1}">
	<%-- 아이디가 없다. --%> 
	<script type="text/javascript">
		<!--
		erroralert(iderror);
		//-->
	</script>
</c:if>
<c:if test="${result eq 0}">
	<%-- 비밀번호가 다르다 --%> 
	<script type="text/javascript">
		<!--
		erroralert(passwderror);
		//-->
	</script>
</c:if>
<c:if test="${result eq 1}">
	<%-- 비밀번호가 같다 --%>
	${sessionScope.adminId = adminId};
	<c:redirect url="movieList.do"/>
</c:if>