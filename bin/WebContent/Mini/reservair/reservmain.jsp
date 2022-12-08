<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Phantom by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../../assets/css/main.css" />
		<noscript><link rel="stylesheet" href="../../assets/css/noscript.css" /></noscript>
		
	</head>
	<body class="is-preload">
		<!-- Wrapper --> 
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="inner">

							<!-- Logo -->
								<a href="../index.do" class="logo">
									<span class="symbol"><img src="../../images/logo.svg" alt="" /></span><span class="title">Phantom</span>
								</a>

							<!-- Nav -->
								<nav>
									<ul>
										<li><a href="#menu">Menu</a></li>
									</ul>
								</nav>

						</div>
					</header>

				<!-- Menu -->
					<nav id="menu">
						<!-- 로그인 -->
						<c:if test="${sessionScope.memId ne null}">
						<div style="display:flex">
							<h3 style="font-widegt:bold">${dto.userName}</h3><h4>님 안녕하세요.</h4>
						</div>
						<ul>
							<li><a href="../user/logoutPro.do">로그아웃</a></li>
							<li><a href="#">내 예약 보기</a></li>
							<li><a href="../reservair/reservmain.do?userId=${dto.userId}">예약 하러가기</a></li>
							<li><a href="../user/usermodifyForm.do?userId=${dto.userId}">회원정보 수정</a></li>
							<li><a href="../user/userdeleteForm.do?userId=${dto.userId}">회원탈퇴</a></li>
						</ul>
						</c:if>
					</nav>

				<!-- Main -->
					<div id="main">
						<div class="inner">						
							<h1>이곳은 공항</h1>
								<div class="col-6 col-12-medium">		
									<ul class="actions stacked">
										<c:if test="${dto.userInfo ne '일반회원'}">
											<li><a href="airinputForm.do?userId=${dto.userId}" class="button small fit">비행기 등록</a></li>
										</c:if>
									</ul>
								</div>
								<c:if test="${count == 0}">
		                           <tr>
		                              <td colspan="10" style="text-align:center"><b>현재 등록된 일정이 없습니다.</b></td>
		                           </tr>
	                        	</c:if>
	                        	<c:if test="${count != 0}">
	                        			<div class="table-wrapper">
										<table class="alt">
											<thead>
												<tr>
													<th>항공사</th>
													<th>출발지</th>
													<th>도착지</th>
													<th>출발 시간</th>
													<th>도착 시간</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="ato" items="${ato}">
													<tr onclick="location='reservcontent.do?userId=${dto.userId}&reNum=${ato.reNum}'">
														<td>${ato.airName}</td>
														<td>${ato.startCity}</td>
														<td>${ato.finishCity}</td>
														<td>${ato.startDate} - ${ato.startTime}</td>
														<td>${ato.finishDate} - ${ato.finishTime}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
	                        	</c:if>
						</div>
					</div>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<section>
								<h2>Get in touch</h2>
								<form method="post" action="#">
									<div class="fields">
										<div class="field half">
											<input type="text" name="name" id="name" placeholder="Name" />
										</div>
										<div class="field half">
											<input type="email" name="email" id="email" placeholder="Email" />
										</div>
										<div class="field">
											<textarea name="message" id="message" placeholder="Message"></textarea>
										</div>
									</div>
									<ul class="actions">
										<li><input type="submit" value="Send" class="primary" /></li>
									</ul>
								</form>
							</section>
							<section>
								<h2>Follow</h2>
								<ul class="icons">
									<li><a href="#" class="icon brands style2 fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands style2 fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands style2 fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon brands style2 fa-dribbble"><span class="label">Dribbble</span></a></li>
									<li><a href="#" class="icon brands style2 fa-github"><span class="label">GitHub</span></a></li>
									<li><a href="#" class="icon brands style2 fa-500px"><span class="label">500px</span></a></li>
									<li><a href="#" class="icon solid style2 fa-phone"><span class="label">Phone</span></a></li>
									<li><a href="#" class="icon solid style2 fa-envelope"><span class="label">Email</span></a></li>
								</ul>
							</section>
							<ul class="copyright">
								<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="../../assets/js/jquery.min.js"></script>
			<script src="../../assets/js/browser.min.js"></script>
			<script src="../../assets/js/breakpoints.min.js"></script>
			<script src="../../assets/js/util.js"></script>
			<script src="../../assets/js/main.js"></script>

	</body>
</html>