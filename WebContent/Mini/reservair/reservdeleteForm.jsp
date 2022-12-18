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
								<h1>예약 취소<br /></h1>
							</header>
							<section>
									<form method="post" action="reservdeletePro.do?userId=${dto.userId}" name="reservdeleteForm">
										<input type="hidden" name="reservNum" value="${reservNum}">
										<span>예약을 취소하시겠습니까?</span>
										<br>
										<div class="col-12">
												<ul class="actions">
													<li><input type="submit" value="예약취소" class="primary" /></li>
													<li><input type="button" value="돌아가기" onclick="location='myReserv.do?userId=${dto.userId}'" /></li>
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