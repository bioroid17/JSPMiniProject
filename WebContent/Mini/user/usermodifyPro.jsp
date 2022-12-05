<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<c:if test="${result eq 0}">
	<script type="text/javascript">
	alert( "수정 실패" );
	</script>
</c:if>


<c:if test="${result != 0}">
	<c:remove var="memId" scope="session"/> 
	<c:redirect url="airportmain.do"/>
</c:if>