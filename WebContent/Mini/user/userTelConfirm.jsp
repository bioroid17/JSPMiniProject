<%@page import="user.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result == 0}">
	<span style="color:green">${param.userTel}는 사용할 수 있는 전화번호 입니다.</span>
</c:if>
<c:if test="${result == 1}">
	<span style="color:red">${param.userTel}는 사용할 수 없는 전화번호 입니다.</span>
</c:if>