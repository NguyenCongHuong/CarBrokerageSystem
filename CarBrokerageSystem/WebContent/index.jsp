<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Trang chủ</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
	
	<!-- menu bar -->
	<jsp:include page="/navigationUser.jsp"></jsp:include>
	<!-- menu bar end -->
	
	<section id="slider"><!--slider-->
		<div class="container-poster">
			<div class="row" style="margin-right:0px; margin-left:0px">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							<div class="item active">
								<img src="images\home\alphard-banner.jpg" style="width: 100%">
							</div>
							<div class="item">
								<img src="images\home\fortuner-banner.png" style="width: 100%">
							</div>
							<div class="item">
								<img src="images\home\vios-banner.jpg" style="width: 100%">
							</div>
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
			</div>
		</div>
	</section><!--/slider-->
	
	<section>
		<div class="container">
			<div class="row">
			
				<!-- menu producer -->
				<jsp:include page="/navigationProducer.jsp"></jsp:include>
				<!-- menu producer end -->
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">NỔI BẬT</h2>
						
						<logic:iterate name="homeForm" property="listCarHighlight" id="listCarHighlight">
						<bean:define id="carImage" name="listCarHighlight" property="carImage"></bean:define>
						<bean:define id="carName" name="listCarHighlight" property="carName"></bean:define>
						<bean:define id="carID" name="listCarHighlight" property="carID"></bean:define>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<img src="${carImage }" title="${carName }" />
											<h2><bean:write name="listCarHighlight" property="price"/>
												<p style="color: #ff0000; font-size: 20px "><b><bean:write name="listCarHighlight" property="money"/></b></p>
											</h2>
											<p><bean:write name="listCarHighlight" property="carName"/></p>
										</div>
										<div class="product-overlay">
											<div class="overlay-content">
												<h2><bean:write name="listCarHighlight" property="price"/>
													<p style="font-size: 20px"><b><bean:write name="listCarHighlight" property="money"/></b></p>
												</h2>
												<p><bean:write name="listCarHighlight" property="carName"/></p>
												<a href="carDetails.html" class="btn btn-default add-to-cart">Xem chi tiết</a>
											</div>
										</div>
								</div>
							</div>
						</div>
						</logic:iterate>
						
					</div><!--features_items-->
					
					<div class="category-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
							<logic:iterate name="homeForm" property="listStyleHighlight" id="listStyleHighlight">
							<bean:define id="styleCarID" name="listStyleHighlight" property="styleCarID"></bean:define>
								<logic:equal name="listStyleHighlight" property="active" value="1">
									<li class="active">
										<a href="#${styleCarID }" data-toggle="tab"> 
											<bean:write name="listStyleHighlight" property="styleCar" /> 
										</a>
									</li>
								</logic:equal>
								
								<logic:notEqual name="listStyleHighlight" property="active" value="1">
									<li>
										<a href="#${styleCarID }" data-toggle="tab"> 
											<bean:write name="listStyleHighlight" property="styleCar" /> 
										</a>
									</li>
								</logic:notEqual>
								
							</logic:iterate>
							</ul>
						</div>
						<div class="tab-content">
						<logic:iterate name="homeForm" property="listStyleHighlight" id="styleHighlight">
						<bean:define id="styleCarID" name="styleHighlight" property="styleCarID"></bean:define>
						<logic:equal name="styleHighlight" property="active" value="1">
							<div class="tab-pane fade active in" id="${styleCarID }" >
							<logic:iterate name="styleHighlight" property="listCar" id="car">
							<bean:define id="carImage" name="car" property="carImage"></bean:define>
							<bean:define id="carName" name="car" property="carName"></bean:define>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="${carImage }" title="${carName }" />
												<h2><bean:write name="car" property="price"/>
													<p style="color: #ff0000; font-size: 20px "><b><bean:write name="car" property="money"/></b></p>
												</h2>
												<p><bean:write name="car" property="carName"/></p>
												<a class="btn btn-default add-to-cart">Xem chi tiết</a>
											</div>
										</div>
									</div>
								</div>
							</logic:iterate>
							</div>
						</logic:equal>
						<logic:notEqual name="styleHighlight" property="active" value="1">
							<div class="tab-pane fade" id="${styleCarID }" >
							<logic:iterate name="styleHighlight" property="listCar" id="car">
							<bean:define id="carImage" name="car" property="carImage"></bean:define>
							<bean:define id="carName" name="car" property="carName"></bean:define>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="${carImage }" title="${carName }" />
												<h2><bean:write name="car" property="price"/>
													<p style="color: #ff0000; font-size: 20px "><b><bean:write name="car" property="money"/></b></p>
												</h2>
												<p><bean:write name="car" property="carName"/></p>
												<a class="btn btn-default add-to-cart">Xem chi tiết</a>
											</div>
										</div>
									</div>
								</div>
							</logic:iterate>
							</div>
						</logic:notEqual>
							
						</logic:iterate>
						</div>
					</div><!--/category-tab-->
					
				</div>
			</div>
		</div>
	</section>
	
	<!-- footer -->
	<jsp:include page="/footerUser.jsp"></jsp:include>
	<!-- footer end -->
	
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>