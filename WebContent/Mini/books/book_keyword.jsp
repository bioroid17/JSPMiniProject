<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>This is Book</title>
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
								<a href="index.html" class="logo">
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

				<!-- Menu -->
					<nav id="menu">
						<h2>Menu</h2>
						<ul>
							<li><a href="index.html">Home</a></li>
							<li><a href="generic.html">Ipsum veroeros</a></li>
							<li><a href="generic.html">Tempus etiam</a></li>
							<li><a href="generic.html">Consequat dolor</a></li>
							<li><a href="elements.html">Elements</a></li>
						</ul>
					</nav>

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								<h1>This is Phantom, a free, fully responsive site<br />
								template designed by <a href="http://html5up.net">HTML5 UP</a>.</h1>
								<p>Etiam quis viverra lorem, in semper lorem. Sed nisl arcu euismod sit amet nisi euismod sed cursus arcu elementum ipsum arcu vivamus quis venenatis orci lorem ipsum et magna feugiat veroeros aliquam. Lorem ipsum dolor sit amet nullam dolore.</p>
							</header>
							<section class="tiles">
							<c:forEach var = "dto" items = "${dto}">
								<article class="style1">
									<span class="image">
										<img src="../images/pic01.jpg" alt="" />
									</span>
									<c:if test="${dto.b_Name eq '봄'}">
									<a href="">
										<h2>봄</h2>
										<div class="content">
											<p>${dto.b_Name}</p>
											<p>${dto.b_Num}</p>
											<p>${dto.b_Writer}</p>
											<p>${dto.b_SangSae}</p>
										</div>	
									</a>
									</c:if>
									<c:if test="${dto.b_Name eq '여름'}">
									<a href="">
										<h2>여름</h2>
										<div class="content">
											<p>${dto.b_Name}</p>
											<p>${dto.b_Num}</p>
											<p>${dto.b_Writer}</p>
											<p>${dto.b_SangSae}</p>
										</div>	
									</a>
									</c:if>
									<c:if test="${dto.b_Name eq '가을'}">
									<a href="">
										<h2>가을</h2>
										<div class="content">
											<p>${dto.b_Name}</p>
											<p>${dto.b_Num}</p>
											<p>${dto.b_Writer}</p>
											<p>${dto.b_SangSae}</p>
										</div>	
									</a>
									</c:if>
									<c:if test="${dto.b_Name eq '겨울'}">
									<a href="">
										<h2>겨울</h2>
										<div class="content">
											<p>${dto.b_Name}</p>
											<p>${dto.b_Num}</p>
											<p>${dto.b_Writer}</p>
											<p>${dto.b_SangSae}</p>
										</div>	
									</a>
									</c:if>
								</article>
								</c:forEach>
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