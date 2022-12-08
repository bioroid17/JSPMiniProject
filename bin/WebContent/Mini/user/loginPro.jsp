<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${result eq -1}">
    <script type="text/javascript">
        alert("아이디가 일치하지 않습니다.");
        window.location.replace("loginForm.do");
     </script>
</c:if>

<%-- 비밀번호가 저장된 값과 일치하지 않을경우 메시지출력 --%>
<c:if test="${result eq 0}">
   <script type="text/javascript">
        alert("비밀번호가 일치하지 않습니다.");
        window.location.replace("loginForm.do");
     </script>
</c:if>

<%-- 아이디와 비밀번호가 일치할 시 성공후 메인페이지 이동후 세션에 아이디값 저장 --%>
<c:if test="${result eq 1}">
	${sessionScope.memId = userId}
    <c:redirect url="airportmain.do">
		<c:param name="userId" value="${requestScope.userId}" />
	</c:redirect>
</c:if>