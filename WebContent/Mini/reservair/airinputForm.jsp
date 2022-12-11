<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
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
		<link rel="stylesheet" href="../../assets/css/main.css" />
		<noscript><link rel="stylesheet" href="../../assets/css/noscript.css" /></noscript>
		<style>
		
		/* 달력클릭X */
		input[type='date'] { position:relative; width:150px;}
		input[type='date']::-webkit-clearbutton,
		input[type='date']::-webkit-inner-spin-button {display:none;}
		input[type='date']::-webkit-calendar-picker-indicator {
			position:absolute;
			left:0;
			top:0;
			width:100%;
			height:100%;
			background:transparent;
			color:transparent;
			cursor:pointer;
		}
		/* 달력클릭X */
		
		
		input[type='time'] { position:relative; width:150px;}
		input[type='time']::-webkit-clearbutton,
		input[type='time']::-webkit-inner-spin-button {display:none;}
		input[type='time']::-webkit-calendar-picker-indicator {
			position:absolute;
			left:0;
			top:0;
			width:100%;
			height:100%;
			background:transparent;
			color:transparent;
			cursor:pointer;
		}
		
		input[type='date']::before {
		  content: attr(data-placeholder);
		  width: 100%;
		}
		
		input[type='date']:valid::before {
		  display: none;
		}
		
		#timeselect:before {
			content:'시간선택:';
			margin-right:.6em;
			color:#9d9d9d;
			}
		#timeselect:valid::before {
			display: none;
		}
		</style>
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
										<li><a href="#menu">Menu</a></li>
									</ul>
								</nav>

						</div>
					</header>

				<!-- Menu -->
					<nav id="menu">
						<!-- 로그인 -->
						<c:if test="${sessionScope.memId ne null}">
						<div style="display:flex">
							<h3 style="font-widegt:bold">${dto.userName}</h3><h4>님 안녕하세요.</h4>
						</div>
						<ul>
							<li><a href="../user/logoutPro.do">로그아웃</a></li>
							<li><a href="../reservair/myReserv.do?userId=${dto.userId}">내 예약 보기</a></li>
							<li><a href="../reservair/airmain.do">예약 하러가기</a></li>
							<li><a href="../user/usermodifyForm.do?userId=${dto.userId}">회원정보 수정</a></li>
						</ul>
						</c:if>
					</nav>

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								<h1>항공기 등록<br /></h1>
							</header>
							<section>
									<form method="post" action="airinputPro.do" name="airinputForm" onsubmit="return aircheck()">
										<input type="hidden" name="reNum" value="${reNum}">
										<div class="row gtr-uniform">
											<div class="col-6 col-12-small">
												<input type="text" name="userId" id="demo-name" placeholder="아이디" value="${dto.userId}" readonly />
											</div>
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
											

											<div class="col-6 col-12-small">
												<input type="text" name="airName" value="${dto.userInfo}" id="demo-name" readonly />
											</div>
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
											
											<div class="col-12 col-12-small" style="width:25%">
												<select name="startCountry" id="country">
													<option value="">출발 나라</option>
													<option value="국내">국내</option>
													<option value="일본">일본</option>
													<option value="동남아">동남아</option>
													<option value="유럽">유럽</option>
													<option value="미주">미주</option>
													<option value="중국">중국</option>										
												</select>
											</div>
											
											
											<div class="col-12 col-12-small" style="width:25%">
												<select name="startCity" id="korea">
													<option value="">출발 공항</option>
													<option value="김포 국제 공항">김포 국제 공항</option>
													<option value="제주 국제 공항">제주 국제 공항</option>
													<option value="부산 국제 공항">부산 국제 공항</option>	
												</select>
												
												<select name="startCity" id="japan">
													<option value="">출발 공항</option>
													<option value="오사카">오사카</option>
													<option value="도쿄(나리타)">도쿄(나리타)</option>
													<option value="도쿄(하네다)">도쿄(하네다)</option>
													<option value="삿포로">삿포로</option>
													<option value="오키나와">오키나와</option>
													<option value="후쿠오카">후쿠오카</option>
												</select>
												
												<select name="startCity" id="europ">
													<option value="">출발 공항</option>
													<option value="파리">파리</option>
													<option value="런던">런던</option>
													<option value="로마">로마</option>		
												</select>
												
												<select name="startCity" id="usa">
													<option value="">출발 공항</option>
													<option value="뉴욕">뉴욕</option>
													<option value="샌프란시스코">샌프란시스코</option>
													<option value="하와이">하와이</option>
													<option value="시카고">시카고</option>
													<option value="시애틀">시애틀</option>		
												</select>
												
												<select name="startCity" id="china">
													<option value="">출발 공항</option>
													<option value="베이징">베이징</option>
													<option value="상하이">상하이</option>	
													<option value="북경">북경</option>

												</select>									
												
												<select name="startCity" id="SoutheastAsia">
													<option value="">출발 공항</option>
													<option value="홍콩">홍콩</option>
													<option value="하노이">하노이</option>
													<option value="방콕">방콕</option>
													<option value="타이베이">타이베이</option>
													<option value="하노이">하노이</option>		
												</select>
															
											</div>
											
											
											<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
											<script type="text/javascript">
											//인원 선택
											$('#country').change(function(){
											   $("#country option:selected").each(function () {
													if($(this).val()== '국내'){ //직접입력일 경우
														$("#korea").show();
														 
														$("#japan").hide();
														$("#china").hide();
														$("#europ").hide();
														$("#usa").hide();
														$("#SoutheastAsia").hide();
															
														$("#korea").attr("disabled",false); //활성화
														$("#japan").attr("disabled",true);
														$("#china").attr("disabled",true);
														$("#europ").attr("disabled",true);
														$("#usa").attr("disabled",true);
														$("#SoutheastAsia").attr("disabled",true);
														
													} else if($(this).val()== '일본'){
														$("#japan").show();
														
														$("#korea").hide();
														$("#china").hide();
														$("#europ").hide();
														$("#usa").hide();
														$("#SoutheastAsia").hide();
														
														$("#korea").attr("disabled",true); //활성화 false true
														$("#japan").attr("disabled",false);
														$("#china").attr("disabled",true);
														$("#europ").attr("disabled",true);
														$("#usa").attr("disabled",true);
														$("#SoutheastAsia").attr("disabled",true);
														
													} else if($(this).val()== '중국'){
														$("#china").show();
														
														$("#korea").hide();
														$("#japan").hide();
														$("#europ").hide();
														$("#usa").hide();
														$("#SoutheastAsia").hide();
														
														$("#korea").attr("disabled",true); //활성화
														$("#japan").attr("disabled",true);
														$("#china").attr("disabled",false);
														$("#europ").attr("disabled",true);
														$("#usa").attr("disabled",true);
														$("#SoutheastAsia").attr("disabled",true);
														
													} else if($(this).val()== '동남아'){
														$("#SoutheastAsia").show();
													
														$("#korea").hide();
														$("#japan").hide();
														$("#china").hide();
														$("#europ").hide();
														$("#usa").hide();
														
														
														$("#korea").attr("disabled",true); //활성화
														$("#japan").attr("disabled",true);
														$("#china").attr("disabled",true);
														$("#europ").attr("disabled",true);
														$("#usa").attr("disabled",true);
														$("#SoutheastAsia").attr("disabled",false);
														
													} else if($(this).val()== '유럽'){
														$("#europ").show();
													
														$("#korea").hide();
														$("#japan").hide();
														$("#china").hide();
														$("#usa").hide();
														$("#SoutheastAsia").hide();
														
														$("#korea").attr("disabled",true); //활성화
														$("#japan").attr("disabled",true);
														$("#china").attr("disabled",true);
														$("#europ").attr("disabled",false);
														$("#usa").attr("disabled",true);
														$("#SoutheastAsia").attr("disabled",true);
														
													} else if($(this).val()== '미주'){
														$("#usa").show();
													
														$("#korea").hide();
														$("#japan").hide();
														$("#china").hide();
														$("#europ").hide();
														$("#SoutheastAsia").hide();
														
														$("#korea").attr("disabled",true); //활성화
														$("#japan").attr("disabled",true);
														$("#china").attr("disabled",true);
														$("#europ").attr("disabled",true);
														$("#usa").attr("disabled",false);
														$("#SoutheastAsia").attr("disabled",true);
														
													} else {
														$("#korea").hide();
														$("#japan").hide();
														$("#china").hide();
														$("#europ").hide();
														$("#usa").hide();
														$("#SoutheastAsia").hide();
														
														$("#korea").attr("disabled",true); //활성화
														$("#japan").attr("disabled",true);
														$("#china").attr("disabled",true);
														$("#europ").attr("disabled",true);
														$("#usa").attr("disabled",true);
														$("#SoutheastAsia").attr("disabled",true);
													}
											   });
											});
											</script>
										
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
											
											<div class="col-12 col-12-small" style="width:25%">
												<select name="finishCountry" id="country1">
													<option value="">도착 나라</option>
													<option value="국내">국내</option>
													<option value="일본">일본</option>
													<option value="동남아">동남아</option>
													<option value="유럽">유럽</option>
													<option value="미주">미주</option>
													<option value="중국">중국</option>										
												</select>
											</div>
												
												
											<div class="col-12 col-12-small" style="width:25%">
												<select name="finishCity" id="korea1">
													<option value="">도착 공항</option>
													<option value="김포 국제 공항">김포 국제 공항</option>
													<option value="제주 국제 공항">제주 국제 공항</option>
													<option value="부산 국제 공항">부산 국제 공항</option>	
												</select>
											
												<select name="finishCity" id="japan1">
													<option value="">도착 공항</option>
													<option value="오사카">오사카</option>
													<option value="도쿄(나리타)">도쿄(나리타)</option>
													<option value="도쿄(하네다)">도쿄(하네다)</option>
													<option value="삿포로">삿포로</option>
													<option value="오키나와">오키나와</option>
													<option value="후쿠오카">후쿠오카</option>
												</select>
											
												<select name="finishCity" id="europ1">
													<option value="">도착 공항</option>
													<option value="파리">파리</option>
													<option value="런던">런던</option>
													<option value="로마">로마</option>		
												</select>
											
												<select name="finishCity" id="usa1">
													<option value="">도착 공항</option>
													<option value="뉴욕">뉴욕</option>
													<option value="샌프란시스코">샌프란시스코</option>
													<option value="하와이">하와이</option>
													<option value="시카고">시카고</option>
													<option value="시애틀">시애틀</option>		
												</select>
											
												<select name="finishCity" id="china1">
													<option value="">도착 공항</option>
													<option value="베이징">베이징</option>
													<option value="상하이">상하이</option>	
													<option value="북경">북경</option>
												</select>									
											
												<select name="finishCity" id="SoutheastAsia1">
													<option value="">도착 공항</option>
													<option value="홍콩">홍콩</option>
													<option value="하노이">하노이</option>
													<option value="방콕">방콕</option>
													<option value="타이베이">타이베이</option>
													<option value="하노이">하노이</option>		
												</select>
											</div>
												
											
											
											<script type="text/javascript">
											//인원 선택
											$('#country1').change(function(){
											   $("#country1 option:selected").each(function () {
													if($(this).val()== '국내'){ //직접입력일 경우
														$("#korea1").show();
														
														$("#japan1").hide();
														$("#china1").hide();
														$("#europ1").hide();
														$("#usa1").hide();
														$("#SoutheastAsia1").hide();
														
														$("#korea1").attr("disabled",false); //활성화
														$("#japan1").attr("disabled",true);
														$("#china1").attr("disabled",true);
														$("#europ1").attr("disabled",true);
														$("#usa1").attr("disabled",true);
														$("#SoutheastAsia1").attr("disabled",true);
														
													} else if($(this).val()== '일본'){
														$("#japan1").show();
														
														$("#korea1").hide();
														$("#china1").hide();
														$("#europ1").hide();
														$("#usa1").hide();
														$("#SoutheastAsia1").hide();
														
														$("#japan1").attr("disabled",false);
														$("#korea1").attr("disabled",true);
														$("#china1").attr("disabled",true);
														$("#europ1").attr("disabled",true);
														$("#usa1").attr("disabled",true);
														$("#SoutheastAsia1").attr("disabled",true);
														
													} else if($(this).val()== '중국'){
														$("#china1").show();
														
														$("#korea1").hide();
														$("#japan1").hide();
														$("#europ1").hide();
														$("#usa1").hide();
														$("#SoutheastAsia1").hide();
														
														$("#chian1").attr("disabled",false);
														$("#korea1").attr("disabled",true);
														$("#japan1").attr("disabled",true);
														$("#europ1").attr("disabled",true);
														$("#usa1").attr("disabled",true);
														$("#SoutheastAsia1").attr("disabled",true);
														
													} else if($(this).val()== '동남아'){
														$("#SoutheastAsia1").show();
													
														$("#korea1").hide();
														$("#japan1").hide();
														$("#china1").hide();
														$("#europ1").hide();
														$("#usa1").hide();
														
														
														$("#SoutheastAsia1").attr("disabled",false);
														$("#korea1").attr("disabled",true); //활성화
														$("#japan1").attr("disabled",true);
														$("#china1").attr("disabled",true);
														$("#europ1").attr("disabled",true);
														$("#usa1").attr("disabled",true);
														
													} else if($(this).val()== '유럽'){
														$("#europ1").show();
													
														$("#korea1").hide();
														$("#japan1").hide();
														$("#china1").hide();
														$("#usa1").hide();
														$("#SoutheastAsia1").hide();
														
														$("#europ1").attr("disabled",false);
														$("#korea1").attr("disabled",true); //활성화
														$("#japan1").attr("disabled",true);
														$("#china1").attr("disabled",true);
														$("#usa1").attr("disabled",true);
														$("#SoutheastAsia1").attr("disabled",true);
														
													} else if($(this).val()== '미주'){
														$("#usa1").show();
													
														$("#korea1").hide();
														$("#japan1").hide();
														$("#china1").hide();
														$("#europ1").hide();
														$("#Southeast Asia1").hide();
														
														$("#usa1").attr("disabled",false);
														$("#korea1").attr("disabled",true); //활성화
														$("#japan1").attr("disabled",true);
														$("#china1").attr("disabled",true);
														$("#europ1").attr("disabled",true);
														$("#SoutheastAsia1").attr("disabled",true);
														
													} else {
														$("#korea1").hide();
														$("#japan1").hide();
														$("#china1").hide();
														$("#europ1").hide();
														$("#usa1").hide();
														$("#SoutheastAsia1").hide();
													}
											   });
											});
											</script>
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
											
											<div class="col-6 col-12-small">
											<label>
												<span>출발 일자 &nbsp;&nbsp;&nbsp;</span>
													<input type="date" name="startDate" id="Date" data-placeholder="&nbsp;날짜 선택" required aria-required="true">
													<input class="time" type="time" name="startTime" id="timeselect" data-placeholder="&nbsp;시간 선택" required="required">
								                        <script type="text/javascript">
								                           var now_utc = Date.now() // 자금 날짜를 밀리초로
								                           // getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 변환
								                           var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
								                           // new Date(now_utc-timeOff).toISOString()은 '2022-05-11 T18:09:38.1342'를 반환
								                           // timeoff 로 이곳기준 기준시간을 구함
								                           // T를 기준으로 split 하면 -> dkvqnqnsdl '2022-05-11' 이 됨
								                           var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
								                           // today에 저장하고 max를 주면 날짜 이후가 선택 안되고
								                           // min을 주면 이전 날짜 선택 안됨
								                           document.getElementById("Date").setAttribute("min", today);
								                        </script>
								                        <script>
													        $("#Date").datepicker();
													    </script>
							                </label> 
											</div>
											
											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
											
											<div class="col-6 col-12-small">
											<label>
												<span>도착 일자 &nbsp;&nbsp;&nbsp;</span>
													<input type="date" name="finishDate" id="Date1" data-placeholder="&nbsp;날짜 선택" required aria-required="true">
													<input class="time" type="time" name="finishTime" id="timeselect" required="required">
								                        <script type="text/javascript">
								                           var now_utc = Date.now() // 자금 날짜를 밀리초로
								                           // getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 변환
								                           var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
								                           // new Date(now_utc-timeOff).toISOString()은 '2022-05-11 T18:09:38.1342'를 반환
								                           // timeoff 로 이곳기준 기준시간을 구함
								                           // T를 기준으로 split 하면 -> dkvqnqnsdl '2022-05-11' 이 됨
								                           var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
								                           // today에 저장하고 max를 주면 날짜 이후가 선택 안되고
								                           // min을 주면 이전 날짜 선택 안됨
								                           document.getElementById("Date1").setAttribute("min", today);
								                        </script>
								                        <script>
													        $("#Date1").datepicker();
													    </script>
							                </label>
											</div>

											<div class="col-6 col-12-small">
												<!-- 공간 용임  -->
											</div>
											
											
											<div class="col-12">
												<ul class="actions">
													<li><input type="submit" value="등록하기" class="primary" /></li>
													<li><input type="button" value="취소" onclick="location='reservmain.do?userId=${dto.userId}'" /></li>
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
			<script src="../../assets/js/jquery.min.js"></script>
			<script src="../../assets/js/browser.min.js"></script>
			<script src="../../assets/js/breakpoints.min.js"></script>
			<script src="../../assets/js/util.js"></script>
			<script src="../../assets/js/main.js"></script>
			<script src="../../assets/js/script.js"></script>
			
			<script>
				$("#korea").hide();
				$("#japan").hide();
				$("#china").hide();
				$("#europ").hide();
				$("#usa").hide();
				$("#SoutheastAsia").hide();
				
				$("#korea1").hide();
				$("#japan1").hide();
				$("#china1").hide();
				$("#europ1").hide();
				$("#usa1").hide();
				$("#SoutheastAsia1").hide();
			</script>

	</body>
</html>