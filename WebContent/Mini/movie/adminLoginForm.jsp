<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="setting.jsp"%>
<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Elements - Phantom by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${project}/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="${project}/assets/css/noscript.css" /></noscript>
		<script src="${project}/Mini/movie/script.js"></script>
	</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="inner">

							<!-- Logo -->
								<a href="${project}/index.html" class="logo">
									<span class="symbol"><img src="${project}/images/logo.svg" alt="" /></span><span class="title">Phantom</span>
								</a>

							<!-- Nav -->
								<nav>
									<ul>
										<li><a href="#menu">Menu</a></li>
									</ul>
								</nav>

						</div>
					</header>

				<%@include file="menu.jsp"%>

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<h1>Elements</h1>

							<!-- Text -->
							<section>
								<h2>Form</h2>
								<form method="post" name="adminLoginForm" action="adminLoginPro.do" onsubmit="return logincheck()" >
									<div class="row gtr-uniform">
										<div class="col-12">
											<input type="text" name="adminId" id="adminId" placeholder="관리자 아이디 입력">
										</div>
										<div class="col-12">
											<input type="password" name="adminPasswd" id="adminPasswd" placeholder="비밀번호 입력">
										</div>
										<div class="col-12">
											<ul class="actions">
												<li><input type="submit" value="등록" class="primary" /></li>
												<li><input type="reset" value="취소" /></li>
											</ul>
										</div>
									</div>
								</form>
							</section>

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
			<script src="${project}/assets/js/jquery.min.js"></script>
			<script src="${project}/assets/js/browser.min.js"></script>
			<script src="${project}/assets/js/breakpoints.min.js"></script>
			<script src="${project}/assets/js/util.js"></script>
			<script src="${project}/assets/js/main.js"></script>

	</body>
</html>