<%@page import="user.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- memberDBBean 가져와야함 --%>

<c:if test="${result == 0}">
	<span style="color:green">${param.userId}는 사용할 수 있는 아이디 입니다.</span>
</c:if>
<c:if test="${result == 1}">
	<span style="color:red">${param.userId}는 사용할 수 없는 아이디 입니다.</span>
</c:if>