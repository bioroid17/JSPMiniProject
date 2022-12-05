<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
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
<%-- 비밀번호 인증 실패 --%>
<c:if test="${result eq 0}">
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.");
		history.back();
	</script>
</c:if>

<%-- 비밀번호 인증 성공 수정 폼 이동 --%>
<c:if test="${result ne 0}">
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
								<h1>수정하기<br /></h1>
							</header>
							<section>
									<form method="post" action="usermodifyPro.do" name="usermodifyviewForm" onsubmit="return modifyviewcheck()">
										<div class="row gtr-uniform">
											<div class="col-6 col-12-small">
												<input type="text" name="userId" value="${dto.userId}" id="demo-name" readonly />
											</div>
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
											
											<div id="idcheck"></div>
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
											
											<input type="hidden" name="userInfo" value="${dto.userInfo}"/>
											
											<div class="col-6 col-12-small">
												<input type="password" name="userPasswd" id="demo-name" value="${dto.userPasswd}" placeholder="비밀번호" />
											</div>
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
											
											<div class="col-6 col-12-small">
												<input type="password" name="userRePasswd" id="demo-name"  value="${dto.userPasswd}"placeholder="비밀번호 재입력" />
											</div>
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
											
											<div id="passwdcheck"></div>
				
											
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
											
											<div class="col-6 col-12-small">
												<input type="text" name="userName" value="${dto.userName}" id="demo-name" placeholder="이름" readonly />
											</div>
											<br>
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
											
											<!-- 정규표현식 이용 자동 하이픈 -->
											<div class="col-6 col-12-xsmall">
												<input type="text" name="userTel" id="demo-name" placeholder="010-0000-0000 ( - 기호 없이 입력 )" value="${dto.userTel}" oninput="autouserTel(this)" maxlength="13"/>
											</div>
											
											<script>
											const autouserTel = (target) => {
												 target.value = target.value
												   .replace(/[^0-9]/g, '')
												  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
												}
											</script>
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
												<br><br><br>
											</div>
											
								
											
											<div class="col-12">
												<ul class="actions">
													<li><input type="submit" value="수정하기" class="primary" /></li>
													<li><input type="button" value="취소" onclick="location='airportmain.do?userId=${dto.userId}'" /></li>
												</ul>
											</div>
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
			
			<!-- 비밀번호 확인 -->
			<script>
				$(document).ready(
						function() {
							$("input[name=userRePasswd]").on(
									"keyup",
									function(event){
										var userPasswd = $("input[name=userPasswd").val(); // passwd의 값
										var userRePasswd = $("input[name=userRePasswd").val(); // repasswd의 값
										if(userPasswd == userRePasswd){
											$("#passwdcheck").html("비밀번호가 같습니다").css("color","green");
										} else {
											$("#passwdcheck").html("비밀번호가 다릅니다").css("color","red");
										}
									}
								);
						}
					);
			</script>
	</body>
</c:if>
</html>