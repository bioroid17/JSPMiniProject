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

							<!-- Logo -->
								<a href="../index.do" class="logo">
									<span class="symbol"><img src="../../images/logo.svg" alt="" /></span><span class="title">Phantom</span> 
								</a>

							<!-- Nav -->
								<nav>
									<ul>
										
									</ul>
								</nav>

						</div>
					</header>

				<!-- Main -->
					<div id="main">
						<div class="logininner">
							<header>
								<h1>로그인<br /></h1>
								<p>로그인후 이용이 가능합니다</p>
							</header>
							<section class="login">
								<article class="style2">
									<form id="log_1" name="loginForm" method="post" action="loginPro.do" onsubmit="return loginCheck()">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="userId" type="text" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'')"  placeholder="아이디" autofocus />
                                                <label>아이디</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="userPasswd" type="password" placeholder="비밀번호" />
                                                <label>비밀번호</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0" style="margin-left: 43%;" >
                                            	<button type="submit" class="btn btn-primary">로그인</button>
                                            </div>
                                        </form>
                                        <div class="logintag">
											<a href="signselectForm.do">회원가입</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;   
											<a href="airportmain.do">메인페이지</a>
										</div>
								</article>
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
			<script src="../../assets/js/script.js"></script>

	</body>
</html>