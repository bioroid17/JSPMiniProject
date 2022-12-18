<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp" %>

<c:if test="${result eq 0}">
	<script type="text/javascript">	
		alert("이미 예약이 완료 되어있는 항공편 입니다.");
	</script>
	<meta http-equiv="refresh" content="0; url=reservmain.do?userId=${sessionScope.memId}">
</c:if>
<c:if test="${result != 0}">
    <c:redirect url="reservmain.do">
    	<c:param name="userId" value="${sessionScope.memId}" />
    </c:redirect>
</c:if>