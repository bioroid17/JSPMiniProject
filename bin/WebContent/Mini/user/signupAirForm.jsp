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
								<h1>항공사 회원가입<br /></h1>
							</header>
							<section>
									<form method="post" action="signupAirPro.do" name="signupAirForm" onsubmit="return signAircheck()">
										<input type="hidden" value="0" name="confirmvalue">
										<input type="hidden" value="0" name="confirmtelvalue">
										
										<div class="row gtr-uniform">
											<div class="col-6 col-12-small">
												<input type="text" name="userId" id="demo-name" placeholder="아이디" />
											</div>
											
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
											
											<div id="idcheck"></div>
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
											
											
											<div class="col-6 col-12-small">
												<input type="password" name="userPasswd" id="demo-name" placeholder="비밀번호" />
											</div>
											
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
											
											
											<div class="col-6 col-12-small">
												<input type="password" name="userRePasswd" id="demo-name" placeholder="비밀번호 재입력" />
											</div>
											
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
											
											<div id="passwdcheck"></div>
				
											
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
											
											
											<div class="col-12 col-12-small" style="width:50%">
												<select name="userInfo" id="demo-category">
													<option value="">선택</option>
													<option value="대한항공">대한항공</option>
													<option value="아시아나 항공">아시아나 항공</option>
													<option value="진에어">진에어</option>
													<option value="티웨이항공">티웨이 항공</option>											
												</select>
											</div>
											<br>
											
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
											
											
											<div class="col-6 col-12-small">
												<input type="text" name="userName" id="demo-name" placeholder="이름" />
											</div>
											<br>
											
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
										
										
											<div class="col-6 col-12-xsmall">
												<input type="text" name="userTel" id="demo-name" placeholder="010-0000-0000 ( - 기호 없이 입력 )" oninput="autouserTel(this)" maxlength="13" />
											</div>
											<script>
											const autouserTel = (target) => {
												 target.value = target.value
												   .replace(/[^0-9]/g, '')
												  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
												}
											</script>
											<br>
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
											
											<div id="telcheck"></div>
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
												<br><br><br>
											</div>
											
											
											<div class="col-12">
												<ul class="actions">
													<li><input type="submit" value="가입하기" class="primary" /></li>
													<li><input type="button" value="취소" onclick="location='airportmain.do'" /></li>
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
			
			
			<script>
				$(document).ready(
						function() {
							// 아이디 자리의 이벤트가 키업일경우
							// 아이디 중복확인
							$("input[name=userId]").on(
								"keyup",
								function(event){
									$.ajax(
										{	// json 영역
											type : "POST",
											url : "userConfirm.do",
											data : 	{//시리얼라이즈
												userId : $("input[name=userId]").val() // 아이디 값만
											},
											dataType : "text",
											success : function(data) {
												// 성공
												$("#idcheck").html(data); // 데이터출력
												
												if(data.indexOf('사용할 수 있는') != -1){
													signupAirForm.confirmvalue.value = "1";
												} else {
													signupAirForm.confirmvalue.value = "0";
												}
											},
											error : function(error) {
												// 실패
												$("#idcheck").html(error); // error 출력
											}
											
										}
									);
									
								}
							);
						}
				);
		</script>
		
		
		<script>
				$(document).ready(
						function() {
							$("input[name=userTel]").on(
								"keyup",
								function(event){
									$.ajax(
										{	// json 영역
											type : "POST",
											url : "userTelConfirm.do",
											data : 	{//시리얼라이즈
												userTel : $("input[name=userTel]").val() // 아이디 값만
											},
											dataType : "text",
											success : function(data) {
												// 성공
												$("#telcheck").html(data); // 데이터출력
												
												if(data.indexOf('사용할 수 있는') != -1){
													signupAirForm.confirmtelvalue.value = "1";
												} else {
													signupAirForm.confirmtelvalue.value = "0";
												}
											},
											error : function(error) {
												// 실패
												$("#telcheck").html(error); // error 출력
											}
											
										}
									);
									
								}
							);
						}
				);
		</script>

	</body>
</html>