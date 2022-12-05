<%@page import="user.UserDataBean"%>
<%@page import="user.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<head>
		<title>Phantom by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../../assets/css/main.css" />
		<noscript><link rel="stylesheet" href="../../assets/css/noscript.css" /></noscript>
	</head>
</head>
<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="inner">

							
						</div>
					</header>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								<h1>회원정보 수정<br /></h1>
							</header>
							<section>
									<form method="post" action="usermodifyView.do?userId=${dto.userId}" name="usermodifyForm" onsubmit="return modifycheck()">
										<span>비밀번호를 입력해 주세요</span>
										<div class="col-6 col-12-small">
											<input type="password" name="userPasswd" id="demo-name" placeholder="비밀번호" />
										</div>
										<br>
										<div class="col-12">
												<ul class="actions">
													<li><input type="submit" value="변경하기" class="primary" /></li>
													<li><input type="button" value="취소" onclick="location='airportmain.do?userId=${dto.userId}'" /></li>
												</ul>
											</div>
									</form>
								</section>
						</div>
					</div>
			</div>

		<!-- Scripts -->
			<script src="../../assets/js/jquery.min.js"></script>
			<script src="../../assets/js/browser.min.js"></script>
			<script src="../../assets/js/breakpoints.min.js"></script>
			<script src="../../assets/js/util.js"></script>
			<script src="../../assets/js/main.js"></script>
			<script src="../../assets/js/jquery-3.6.0.js"></script>
			<script src="../../assets/js/script.js"></script>
	</body>
</html>