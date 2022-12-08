<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp" %>

<c:if test="${result eq 0}">
	<script type="text/javascript">
		
		alert("등록 실패");
		
	</script>
</c:if>
<c:if test="${result != 0}">
    <c:redirect url="reservmain.do">
    	<c:param name="userId" value="${sessionScope.memId}" />
    </c:redirect>
</c:if>