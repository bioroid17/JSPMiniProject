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
		<title>Phantom by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${project}/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="${project}/assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="inner">

							<!-- Logo -->
								<a href="../index.html" class="logo">
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
							<header>
								<h1>This is Phantom, a free, fully responsive site<br />
								template designed by <a href="http://html5up.net">HTML5 UP</a>.</h1>
								<p>Etiam quis viverra lorem, in semper lorem. Sed nisl arcu euismod sit amet nisi euismod sed cursus arcu elementum ipsum arcu vivamus quis venenatis orci lorem ipsum et magna feugiat veroeros aliquam. Lorem ipsum dolor sit amet nullam dolore.</p>
							</header>
							<section class="tiles">
								<c:forEach var="dto" items="${dtos}">
									<article class="style1">
										<span class="image">
											<c:if test="${dto.moviePosterSysName eq null}">
												<img src="${project}/images/pic01.jpg" alt="" />
											</c:if>
											<c:if test="${dto.moviePosterSysName ne null}">
												<img src="${project}/moviePoster/${dto.moviePosterSysName}" alt="" />
											</c:if>
										</span>
										<a href="movieInfo.do?movieCd=${dto.movieCd}">
											<h2>${dto.movieNm}</h2>
											<div class="content">
												<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
											</div>
										</a>
									</article>
								</c:forEach>
							</section>
							<br>
							<br>
							<br>
							<br>
							<c:if test="${count gt 0}">
								<ul class="actions">
									<c:if test="${startPage gt pageBlock}">
										<li class="page-item">
											<input type="button" value="이전" class="primary" onclick="location='movieList.do?pageNum=${startPage - pageBlock}'"/>
										</li>
									</c:if>
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i eq currentPage}">
											<li class="page-item">
												<input type="button" value="${i}" class="primary" disabled/>
											</li>
										</c:if>
										<c:if test="${i ne currentPage}">
											<li class="page-item">
												<input type="button" value="${i}" class="primary" onclick="location='movieList.do?pageNum=${i}'"/>
											</li>
										</c:if>
									</c:forEach>
									<c:if test="${pageCount gt endPage}">
										<li class="page-item">
											<input type="button" value="다음" class="primary" onclick="location='movieList.do?pageNum=${startPage + pageBlock}'"/>
										</li>
									</c:if>
								</ul>
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
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>

	</body>
</html>