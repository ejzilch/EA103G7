<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.news.model.*"%>
<%
	NewsService newsSvc = new NewsService();
	List<NewsVO> list = newsSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>POT</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Great+Vibes&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/ionicons.min.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<!-- -------------------------简单的轮播（Carousel）插件 -->
<!--  <link rel="stylesheet" href="//cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="//cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="//cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    Bootstrap 的 CSS
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> -->
<!-- 其它 html -->
<!-- body 結束標籤之前，載入Bootstrap 的 JS 及其相依性安裝(jQuery、Popper) -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
</head>
<style type="text/css" media="screen">
#img1 {
	position: absolute;
	top: 0px;
	left: 1300px;
	width: 20%;
	height: 695px;
	background-color: #53E355;
	z-index: 1;
}
.heading-section h2 {
    font-size: 75px;
    font-weight: 900;
    line-height: 1.2;
     color: #cec2b4;
}

body {
    font-family: "Poppins", Arial, sans-serif;
    background: #fff;
    font-size: 17px;
    line-height: 2;
    font-weight: 400;
    color: #ffffff;
}
/*   #img2 {

            z-index: 2;
        } */
</style>
<script>
	$(function() {
		$('#carouselExampleIndicators').carousel({
			interval : 1000
		});
	})
</script>
<script>
	$(function() {
		$('#ExampleIndicators').carousel({
			interval : 1000

		});
	})

	// 	$(function() {
	// 		$('.carousel').carousel({
	// 			pause : "false"
	// 		});
	// 	})
</script>

<script>
	
</script>
<body>
	<div class="py-1 bg-black top">
		<div class="container">
			<div
				class="row no-gutters d-flex align-items-start align-items-center px-md-0">
				<div class="col-lg-12 d-block">
					<div class="row d-flex">
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class=""></span>
							</div>
							<span class="text"></span>
						</div>
						<div
							class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right justify-content-end">
							<p class="mb-0 register-link">
								<span class="mybb"> <a href=""><svg width="1em"
											height="1em" viewBox="0 0 16 16" class="bi bi-bell-fill"
											fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path
												d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z" /></svg></a></span>
								<span class="mybb"><a href="menu.html" class="myaa">會員中心</a></span>
								<span class="mybb"><a href="blog.html" class="myaa">註冊</a></span>
								<span class="mybb"><a href="contact.html" class="myaa">登入</a></span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html">Feliciano</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="index.html" class="nav-link">推薦菜色</a></li>
					<li class="nav-item"><a href="<%=request.getContextPath()%>/front-end/front/front_news-11.jsp" class="nav-link">最新消息</a></li>
					<li class="nav-item"><a href="<%=request.getContextPath()%>/front-end/front/front_ad_new.jsp" class="nav-link">最新活動</a></li>
					<li class="nav-item"><a href="menu.html" class="nav-link">評價總覽</a></li>
					<li class="nav-item"><a href="blog.html" class="nav-link">餐廳資訊</a></li>
					<li class="nav-item"><a href="contact.html" class="nav-link">候位狀況</a></li>
					<li class="nav-item cta"><a href="reservation.html"
						class="nav-link">我要訂餐</a></li>
					<li class="nav-item cta"><a href="reservation.html"
						class="nav-link">我要訂位</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->
	<section class="home-slider owl-carousel js-fullheight">
		<div class="slider-item js-fullheight"
			style="background-image: url(images/11111.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text js-fullheight justify-content-center align-items-center"
					data-scrollax-parent="true">
					<div class="col-md-12 col-sm-12 text-center ftco-animate">
						<span class="subheading">吃胖吧</span>
						<h1 class="mb-4">Best Restaurant</h1>
					</div>
				</div>
			</div>
		</div>
		<div class="slider-item js-fullheight"
			style="background-image: url(images/33333.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text js-fullheight justify-content-center align-items-center"
					data-scrollax-parent="true">
					<div class="col-md-12 col-sm-12 text-center ftco-animate">
						<span class="subheading">吃胖吧</span>
						<h1 class="mb-4">Nutritious &amp; Tasty</h1>
					</div>
				</div>
			</div>
		</div>
		<div class="slider-item js-fullheight"
			style="background-image: url(images/bg_3.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text js-fullheight justify-content-center align-items-center"
					data-scrollax-parent="true">
					<div class="col-md-12 col-sm-12 text-center ftco-animate">
						<span class="subheading">吃胖吧</span>
						<h1 class="mb-4">Delicious Specialties</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section ftco-no-pt ftco-no-pb">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="featured">
						<div class="row">
							<div class="col-md-3">
								<div class="featured-menus ftco-animate">
									<div class="menu-img img"
										style="background-image: url(images/wait.gif);"></div>
									<div class="text text-center">
										<h3>套餐A</h3>
										<p>
											<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>,
											<span>Tomatoe</span>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="featured-menus ftco-animate">
									<div class="menu-img img"
										style="background-image: url(images/wait.gif);"></div>
									<div class="text text-center">
										<h3>套餐B</h3>
										<p>
											<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>,
											<span>Tomatoe</span>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="featured-menus ftco-animate">
									<div class="menu-img img"
										style="background-image: url(images/wait.gif);"></div>
									<div class="text text-center">
										<h3>套餐C</h3>
										<p>
											<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>,
											<span>Tomatoe</span>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="featured-menus ftco-animate">
									<div class="menu-img img"
										style="background-image: url(images/wait.gif);"></div>
									<div class="text text-center">
										<h3>套餐D</h3>
										<p>
											<span>Meat</span>, <span>Potatoes</span>, <span>Rice</span>,
											<span>Tomatoe</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

<section class="ftco-section img"
		style="background-image: url(images/storeBg.jpg)"
		data-stellar-background-ratio="0.5">
			<div class="container">
				<div class="row">
					<div class="col-md-7 d-flex">
						<div class="img img-1 mr-md-2"
							style="background-image: url(images/HA.gif);"></div>
						<div class="img img-2 ml-md-2"
							style="background-image: url(images/HA.gif);"></div>
					</div>
					<div class="col-md-5 wrap-about pt-5 pt-md-5 pb-md-3 ftco-animate">
						<div class="heading-section mb-4 my-5 my-md-0">
							<span class="subheading">About</span>
							<h2 class="mb-4">吃胖吧PoT</h2>
						</div>
						<p>這裡可以放我們餐廳的介紹ㄎㄎ</p>
						<p class="time">
							<span>Mon - Fri <strong>8AM - 11 PM</strong></span> <span><a
								href="#">+ 1-978-123-4567</a></span>
						</p>
<!-- 					</div> -->
				</div>
			</div>
		</div>
	</section>



	<!-- 		------------------------------ -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<div id="img1">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>

			<div class="carousel-inner">
			<div class="carousel-item active ">
				<%@ include file="page1-1.file"%>
				
					<c:forEach var="newsVO" items="${list}" begin="<%=pageIndex%>"
						end="<%=pageIndex+rowsPerPage-1%>">
						<h3>${newsVO.news_cont}</h3>
						<h4>${newsVO.news_date}</h4>
					</c:forEach>
					
				</div>
				<!-- 				<div class="carousel-item active ">123</div> -->
				<!-- 				<div class="carousel-item ">456</div> -->
				<!-- 				<div class="carousel-item ">789</div> -->
				<a class="carousel-control-prev" href="<%=request.getRequestURI()%>?whichPage=<%=whichPage-1%>"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="<%=request.getRequestURI()%>?whichPage=<%=whichPage+1%>"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			
			</div>
			
		</div>
	</div>
	<!-- ----------------------------------------- -->
	<div id="ExampleIndicators" class="carousel slide" data-ride="carousel">
		<!-- 		<ol class="carousel-indicators"> -->
		<!-- 			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li> -->
		<!-- 			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li> -->
		<!-- 			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li> -->
		<!-- 		</ol> -->

		<div class="carousel-inner">

			<div class="carousel-item active">
				<img class="d-block w-100" src="images/twL_ad_20B20_m7ie5yxyhs.jpg"
					alt="twL_ad_20B20_m7ie5yxyhs.jpg">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="images/twL_ad_20B20_8n3uh8mz6a.jpg"
					alt="twL_ad_20B20_8n3uh8mz6a.jpg">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="images/twL_ad_20B20_xym5ycjdaj.jpg"
					alt="twL_ad_20B20_xym5ycjdaj.jpg">
			</div>

			<!-- 			<a class="carousel-control-prev" href="#carouselExampleIndicators" -->
			<!-- 				role="button" data-slide="prev"> <span -->
			<!-- 				class="carousel-control-prev-icon" aria-hidden="true"></span> <span -->
			<!-- 				class="sr-only">Previous</span> -->
			<!-- 			</a> <a class="carousel-control-next" href="#carouselExampleIndicators" -->
			<!-- 				role="button" data-slide="next"> <span -->
			<!-- 				class="carousel-control-next-icon" aria-hidden="true"></span> <span -->
			<!-- 				class="sr-only">Next</span> -->
			<!-- 			</a> -->
		</div>
	</div>


	<section class="ftco-section img"
		style="background-image: url(images/33333.jpg)"
		data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row d-flex">
				<div
					class="col-md-7 ftco-animate makereservation p-4 px-md-5 pb-md-5">
					<div class="heading-section ftco-animate mb-5 text-center">
						<span class="subheading">Book a table</span>
						<h2 class="mb-4">我要訂位</h2>
					</div>
					<form action="#">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="">Name</label> <input type="text"
										class="form-control" placeholder="Your Name">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="">Email</label> <input type="text"
										class="form-control" placeholder="Your Email">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="">Phone</label> <input type="text"
										class="form-control" placeholder="Phone">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="">Phone</label> <input type="text"
										class="form-control" id="book_date" placeholder="Date">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="">Time</label> <input type="text"
										class="form-control" id="book_time" placeholder="Time">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="">Person</label>
									<div class="select-wrap one-third">
										<div class="icon">
											<span class="ion-ios-arrow-down"></span>
										</div>
										<select name="" id="" class="form-control">
											<option value="">Person</option>
											<option value="">1</option>
											<option value="">2</option>
											<option value="">3</option>
											<option value="">4+</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-12 mt-3">
								<div class="form-group text-center">
									<input type="submit" value="Make a Reservation"
										class="btn btn-primary py-3 px-5">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md-6 col-lg-3">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">吃胖吧PoT</h2>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
</body>
<style type="text/css" media="screen">
.ftco-navbar-light .navbar-nav>.nav-item.cta>a {
	background: none;
}
</style>


</html>