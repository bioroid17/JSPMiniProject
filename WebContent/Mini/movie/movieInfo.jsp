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
		<title>Generic - Phantom by HTML5 UP</title>
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
								<a href="index.html" class="logo">
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
							<h1>Generic Page</h1>
						
							<section>
								<h2>영화</h2>
								<div class="row">
									<div class="col-6 col-12-medium">
										<span class="image main"><img src="${project}/moviePoster/${movieDto.moviePosterSysName}" alt="" /></span>
									</div>
									<div class="col-6 col-12-medium">
										<div class="table-wrapper">
											<table>
												<thead>
													<tr>
														<th colspan='2'>${movieDto.movieNm}</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td style="width:25%">상영시간</td>
														<td>${infoDto.showTm}</td>
													</tr>
													<tr>
														<td>장르</td>
														<td>${infoDto.genres}</td>
													</tr>
													<tr>
														<td>감독</td>
														<td>${infoDto.directorNms}</td>
													</tr>
													<tr>
														<td>출연진</td>
														<td>${infoDto.actorNms}</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</section>
							<hr>
							<section>
								<h2>시놉시스</h2>
								<%-- <p>${movieDto.movieInfo}</p> --%>
								<p>시놉시스를 준비중입니다.</p>
							</section>
				
							<c:if test="${sessionScope.adminId ne null}">
								<div class="col-12">
									<ul class="actions">
										<li><input type="button" value="수정" class="primary" onclick="location='movieUpdateForm.do?movieCd=${movieDto.movieCd}'"/></li>
										<li><input type="button" value="삭제" class="primary" onclick="location='movieDeleteForm.do?movieCd=${movieDto.movieCd}'"/></li>
									</ul>
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
			<script src="${project}/assets/js/jquery.min.js"></script>
			<script src="${project}/assets/js/browser.min.js"></script>
			<script src="${project}/assets/js/breakpoints.min.js"></script>
			<script src="${project}/assets/js/util.js"></script>
			<script src="${project}/assets/js/main.js"></script>

	</body>
</html>