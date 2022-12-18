<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" href="../assets/css/main.css" />
		<noscript><link rel="stylesheet" href="../assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="inner">

							<!-- Logo -->
								<a href="../index.html" class="logo">
									<span class="symbol"><img src="../images/logo.svg" alt="" /></span><span class="title">Phantom</span>
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
								<form method="post" name="movieform" action="movieInsertPro.do" enctype="multipart/form-data" onsubmit="return moviecheck()">
									<div class="row gtr-uniform">
										<div class="col-6 col-12-xsmall">
											<input type="text" name="movieTitle" id="movieTitle" placeholder="영화 제목">
										</div>
										<div class="col-6 col-12-xsmall">
											<input type="file" name="moviePoster" id="moviePoster">
										</div>
										<div class="col-4 col-12-xsmall">
											<input type="text" name="movieTime" id="movieTime" placeholder="러닝 타임">
										</div>
										<div class="col-4 col-12-xsmall">
											<input type="text" name="movieTags" id="movieTags" placeholder="태그 입력">
										</div>
										<div class="col-4 col-12-xsmall">
											<input type="text" name="movieGenre" id="movieGenre" placeholder="장르 입력">
										</div>
										<div class="col-2 col-10-small">
											<input type="radio" id="ageall" name="movieAge" value="all" checked>
											<label for="ageall">전체관람가</label>
										</div>
										<div class="col-2 col-10-small">
											<input type="radio" id="age12" name="movieAge" value="12">
											<label for="age12">12세이상</label>
										</div>
										<div class="col-2 col-10-small">
											<input type="radio" id="age15" name="movieAge" value="15">
											<label for="age15">15세이상</label>
										</div>
										<div class="col-2 col-10-small">
											<input type="radio" id="age18" name="movieAge" value="18">
											<label for="age18">18세이상</label>
										</div>
										<div class="col-2 col-10-small">
											<input type="radio" id="limited" name="movieAge" value="limited">
											<label for="limited">제한관람가</label>
										</div>
										<div class="col-6 col-12-xsmall">
											<input type="text" name="movieDirector" id="movieDirector" placeholder="감독 이름">
										</div>
										<div class="col-6 col-12-xsmall">
											<input type="text" name="movieActors" id="movieActors" placeholder="출연진 이름">
										</div>
										<div class="col-12">
											<textarea name="movieInfo" id="movieInfo" placeholder="영화의 내용을 입력하세요." rows="10"></textarea>
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
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>

	</body>
</html>