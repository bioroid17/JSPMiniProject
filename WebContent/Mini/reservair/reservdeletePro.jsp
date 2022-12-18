<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
 
<c:if test="${resultCheck == 0}">
   <script type="text/javascript">
      
      alert("먼카틀림");
      
   </script>
</c:if>
<c:if test="${resultCheck != 0}">
      <c:if test="${result == 0}">
         <script type="text/javascript">
         
         alert("삭제실패");
         
         </script>
         <meta http-equiv="refresh" content="0; url=../airportmain.do">
      </c:if>
   <c:if test="${result != 0}">
	  <c:redirect url="myReserv.do?userId=${dto.userId}"/>
   </c:if>
</c:if>