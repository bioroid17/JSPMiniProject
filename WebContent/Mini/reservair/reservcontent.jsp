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
			.modal-wrapper {
			  position: fixed;
			  top: 0;
			  left: 0;
			  width: 100%;
			  height: 100%;
			  background: rgba(0, 0, 0, 0.5);
			  display: flex;
			  align-items: center;
			  justify-content: center;
			}
			
			.modal {
			  background: white;
			  padding: 24px 16px;
			  border-radius: 4px;
			  width: 80%;
			  height:800px;
			}
			
			.modal-title {
			  font-size: 24px;
			  font-weight: bold;
			}
			
			.modal p {
			  font-size: 16px;
			}
			
			.close-wrapper {
			  text-align: right;
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
							<li><a href="#">내 예약 보기</a></li>
							<li><a href="../reservair/reservmain.do?userId=${dto.userId}">예약 하러가기</a></li>
							<li><a href="../user/usermodifyForm.do?userId=${dto.userId}">회원정보 수정</a></li>
							<li><a href="../user/userdeleteForm.do?userId=${dto.userId}">회원탈퇴</a></li>
						</ul>
						</c:if>
					</nav>

				<!-- Main -->
					<div id="main">
						<div class="inner">						
							<h1>이곳은 공항</h1>
							
							<div style="display:flex; justify-content:center;">
								
								<div>
									<h4>${ato.startCountry} - ${ato.startCity}</h4>
									<h5>${ato.startDate} - ${ato.startTime}</h5>
								</div>
								
								<span style="width:100px;"></span>
								
								<div>
									<span><img src="../../images/airplane.png" alt="" /></span>
								</div>
								
								<span style="width:100px;"></span>
								
								<div>
									<h4>${ato.finishCountry} - ${ato.finishCity}</h4>
									<h5>${ato.finishDate} - ${ato.finishTime}</h5>
								</div>						
							</div>
							

							<button id="open" style="width:100%;">예약하기</button>
							
							<!-- 이 부분부터 모달 페이지  -->
						    <div class="modal-wrapper" style="display: none;">
						      <div class="modal">
						      
						        <div class="modal-title">옵션을 선택하세요</div>
						        	<div style="display:flex;">
					        			<div class="col-12 col-12-small" style="width:40%">
											<select name="startCity" id="demo-category">
												<option value="">좌석 선택</option>
	
											</select>
										</div>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<div class="col-12 col-12-small" style="width:40%">
											<select name="startCity" id="demo-category">
												<option value="">탑승 인원</option>
											</select>
										</div>
										
						        	</div>
						        	
						        <div class="close-wrapper">
						          <button id="close">닫기</button>
						        </div>
						        
						      </div>
						    </div>
							<!-- 여기까지 -->
							
							<br><br><br><br><br><br>
							<div class="col-6 col-12-medium">
								<h3>주의사항</h3>
								<ul>
									<li>1. 아무거나 </li>
									<li>2. 들어가면</li>
									<li>3. 하지만 빨랐죠?</li>
								</ul>
							</div>
							
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
			
			<script>
				const open = document.getElementById("open");
				const close = document.getElementById("close");
				const modal = document.querySelector(".modal-wrapper");
				open.onclick = () => {
				  modal.style.display = "flex";
				};
				close.onclick = () => {
				  modal.style.display = "none";
				};
			</script>
	</body>
</html>