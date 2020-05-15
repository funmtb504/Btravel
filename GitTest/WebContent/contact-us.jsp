<%@page import="java.sql.Timestamp"%>
<%@page import="event.EventDTO"%>
<%@page import="event.EventDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | Corlate</title>

    <!-- core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/owl.carousel.min.css" rel="stylesheet">
    <link href="css/icomoon.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">

<!-- 이벤트 css, js -->
<link href="css/event.css" rel="stylesheet">
<link rel="stylesheet" href="assets/countdown/jquery.countdown.css" />

<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="assets/countdown/jquery.countdown.js"></script>
<script src="<c:url value="/js/event.js" />"></script>
<script src="<c:url value="/js/eventPop.js" />"></script>

<!-- /이벤트 css, js -->

    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<!--/head-->

<body>
    <%
    EventDAO edao = new EventDAO();
    
    Timestamp date = edao.getDate(1);
    %>
    <header id="header">
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-12">
                        <div class="top-number">
                            <p><i class="fa fa-phone-square"></i> +0123 456 70 90 </p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xs-12">
                        <div class="social">
                            <ul class="social-share">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                <li><a href="#"><i class="fa fa-skype"></i></a></li>
                            </ul>
                            <div class="search">
                                <form role="form">
                                    <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                                    <i class="fa fa-search"></i>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<!--             /.container -->
        </div>
<!--         /.top-bar -->

        <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt="logo"></a>
                </div>
                
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="about-us.html">About Us</a></li>
                        <li><a href="services.html">Services</a></li>
                        <li><a href="portfolio.html">Portfolio</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages <i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="blog-item.html">Blog Single</a></li>
                                <li><a href="pricing.html">Pricing</a></li>
                                <li><a href="404.html">404</a></li>
                            </ul>
                        </li>
                        <li><a href="blog.html">Blog</a></li> 
                        <li class="active"><a href="contact-us.html">이벤트</a></li>                        
                    </ul>
                </div>
           </div> 
<!--            /.container -->
        </nav>
<!--         /nav -->
    </header>
<!--     /header -->


    <div class="page-title" style="background-image: url(images/page-title.png)">
        <h1>무료 이벤트</h1>
    </div>

    <section id="contact-page">
    
    <div id="countdown" style="margin-top: 50px;"></div>
    	<ul class="ul">
		<li class="li">Day</li>
		<li class="li">Hour</li>
		<li class="li">Minute</li>
		<li class="li">Second</li>
		</ul><br>
    
    	<div class="event">
    	<input type="hidden" id="hid" value="<%=date%>">
			<p>나의 포인트  <em><i id="myCoupon">9999999</i>점</em></p>
			<a href="javascript:void(0);" class="getCoupon" onclick="return eventPop()">당첨내역</a>
			<a href="javascript:void(0);" class="getCoupon" onclick="return adminPop()">관리자</a>
		</div>
		<p class="description">* 매일 하루 <b>한번</b> 씩 최대 <b>5번</b> 뽑기 가능하며, 1회당 <b>100포인트</b>가 차감됩니다.</p>
				
		<h2 id="sample02"></h2>
		
		<p class="p1"><img src="images/box.png" id="img"></p>
		<div id="eventBox">
		<input type="button" value="지금 뽑기" id="btn" width="100" height="100"><br>
		</div>
		
		<p class="p2">남은횟수: ... </p>
		<p class="p3">develop by EDJ ver1.0</p>
		
				<div class="couponArea" id="cpArea">
				<h3>이벤트 포인트 획득 방법</h3>
				<div class="cpStatus ">
					<ul>
						<li class="attend  emth1">
							<a onclick="GetEventCoupon(1,'F')" class="">
								<i class="ico"></i>
								<strong>출석 체크 응모권</strong>
								<p>1일 <em>1</em>장</p>
								<span>응모권 받기</span>
							</a>
						</li>
						<li class="review  emth5">
							<a onclick="GetEventCoupon(5,'F')" class="">
								<i class="ico"></i>
								<strong>여행지 리뷰 응모권</strong>
								<p>1일 <em>2</em>장</p>
								<span>응모권 받기</span>
							</a>
						</li>
						<li class="ad  emth8">
							 <a onclick="GetEventCoupon(8,'F')" class="">
								<i class="ico"></i>
								<strong>광고 확인 응모권</strong>
								<p>1일 <em>1</em>장</p>
								<span>응모권 받기</span>
							</a>
						</li>
					</ul>
				</div>

			</div>
			
					<div class="warning">
				<h3>이벤트 응모 시 유의사항</h3>
				<ul class="first">
					<li>비정상적으로 참여하거나 상업적 용도로 참여하는 경우 당첨에 제외되며, 취소될 수 있습니다. </li>
					<li>경품은 이벤트 종료 후 일괄배송됩니다.</li>		
					<li>이벤트 당첨 시 경품 배송을 위해 본명, 전화번호, 주소 등의 개인정보가 수집됩니다.</li>
					<li>본 이벤트는 부득이한 사정에 의해 조기종료 될 수 있습니다.</li>
				</ul>
							</div>

    </section>
    <!--/#bottom-->
    <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    &copy; 2013 <a target="_blank" href="http://shapebootstrap.net/" title="Free Twitter Bootstrap WordPress Themes and HTML templates">ShapeBootstrap</a>. All Rights Reserved.
                </div>
                <div class="col-sm-6">
                    <ul class="pull-right">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Faq</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <!--/#footer-->

<!--     <script src="js/jquery.js"></script> -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>

</body>
</html>