<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<c:if test="${resultCheck eq 0}">
	<script type="text/javascript">
		alert("비밀번호가 다릅니다.");
	</script>
</c:if>


<c:if test="${resultCheck ne 0}">
	<c:if test="${result eq 0}">
		<script type="text/javascript">
		 	alert("삭제 실패");
		</script>
		<meta http-equiv="refresh" content="0; url=airportmain.do"/>
	</c:if>
	

	<c:if test="${result ne 0}">
		<c:remove var="memId" scope="session"/> 
		<c:redirect url="airportmain.do"/>
	</c:if>
</c:if>