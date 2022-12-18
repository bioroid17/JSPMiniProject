<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="${project}/Mini/movie/script.js"></script>

<%-- result는 request 객체로 넘어오지만 requestScope는 생략이 가능. --%>
<c:if test="${result eq 0}">
	<script type="text/javascript">
	<!--
		erroralert(updateerror);
	//-->
	</script>
</c:if>
<c:if test="${result ne 0}">
	<c:redirect url="movieList.do" />
</c:if>