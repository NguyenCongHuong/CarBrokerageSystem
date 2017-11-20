<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<section>
		<div class="container">
			<div class="row">
			
				<!-- menu producer -->
				<jsp:include page="/navigationProducer.jsp"></jsp:include>
				<!-- menu producer end -->
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">NỔI BẬT</h2>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<img src="images/home/altis1.png" alt="" />
											<h2>717.000.000 VND</h2>
											<p>ALTIS 1.8G</p>
										</div>
										<div class="product-overlay">
											<div class="overlay-content">
												<h2>717.000.000 VND</h2>
												<p>ALTIS 1.8G</p>
												<a href="carDetails.html" class="btn btn-default add-to-cart">Xem chi tiết</a>
											</div>
										</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="images/home/fortuner1.png" alt="" />
										<h2>1.149.000.000 VND</h2>
										<p>Fortuner 2.7V </p>
									</div>
									<div class="product-overlay">
										<div class="overlay-content">
										    <h2>1.149.000.000 VND</h2>
										    <p>Fortuner 2.7V </p>
											<a href="#" class="btn btn-default add-to-cart">Xem chi tiết</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="images/home/camry1.png" alt="" />
										<h2>1.283.000.000 VND</h2>
										<p>Camry 2.5 Q</p>
									</div>
									<div class="product-overlay">
										<div class="overlay-content">
											<h2>1.283.000.000 VND</h2>
										    <p>Camry 2.5 Q</p>
											<a href="#" class="btn btn-default add-to-cart">Xem chi tiết</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div><!--features_items-->
					
					<div class="category-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#sedan" data-toggle="tab">Sedan</a></li>
								<li><a href="#hatchback" data-toggle="tab">Hatchback</a></li>
								<li><a href="#suv" data-toggle="tab">SUV</a></li>
								<li><a href="#truck" data-toggle="tab">Truck</a></li>
								<li><a href="#van" data-toggle="tab">Van</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="Sedan" >
								<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
									<div class="carousel-inner">
										<div class="item active">
											<div class="col-sm-3">
												<div class="product-image-wrapper">
													<div class="single-products">
														<div class="productinfo text-center">
															<img src="images/home/vios1.png" alt="" />
															<h2>644.000.000 VND</h2>
															<p>Vios TRD Sportivo 2017</p>
															<a href="#" class="btn btn-default add-to-cart">Xem chi tiết</a>
														</div>
														
													</div>
												</div>
											</div>
											<div class="col-sm-3">
												<div class="product-image-wrapper">
													<div class="single-products">
														<div class="productinfo text-center">
															<img src="images/home/fortuner1.png" alt="" />
															<h2>753.000.000 VND</h2>
															<p>Innova 2.0E</p>
															<a href="#" class="btn btn-default add-to-cart">Xem chi tiết</a>
														</div>
														
													</div>
												</div>
											</div>
											<div class="col-sm-3">
												<div class="product-image-wrapper">
													<div class="single-products">
														<div class="productinfo text-center">
															<img src="images/home/fortuner1.png" alt="" />
															<h2>981.000.000 VND</h2>
															<p>Fortuner 2.4G</p>
															<a href="#" class="btn btn-default add-to-cart">Xem chi tiết</a>
														</div>
														
													</div>
												</div>
											</div>
											<div class="col-sm-3">
												<div class="product-image-wrapper">
													<div class="single-products">
														<div class="productinfo text-center">
															<img src="images/home/fortuner1.png" alt="" />
															<h2>1.018.000.000 VND</h2>
															<p>Camry 2.0 E</p>
															<a href="#" class="btn btn-default add-to-cart">Xem chi tiết</a>
														</div>
														
													</div>
												</div>
											</div>
										</div>
										<div class="item">
											<div class="col-sm-3">
												<div class="product-image-wrapper">
													<div class="single-products">
														<div class="productinfo text-center">
															<img src="images/home/vios1.png" alt="" />
															<h2>644.000.000 VND</h2>
															<p>Vios TRD Sportivo 2017</p>
															<a href="#" class="btn btn-default add-to-cart">Xem chi tiết</a>
														</div>
														
													</div>
												</div>
											</div>
											<div class="col-sm-3">
												<div class="product-image-wrapper">
													<div class="single-products">
														<div class="productinfo text-center">
															<img src="images/home/fortuner1.png" alt="" />
															<h2>753.000.000 VND</h2>
															<p>Innova 2.0E</p>
															<a href="#" class="btn btn-default add-to-cart">Xem chi tiết</a>
														</div>
														
													</div>
												</div>
											</div>
											<div class="col-sm-3">
												<div class="product-image-wrapper">
													<div class="single-products">
														<div class="productinfo text-center">
															<img src="images/home/fortuner1.png" alt="" />
															<h2>981.000.000 VND</h2>
															<p>Fortuner 2.4G</p>
															<a href="#" class="btn btn-default add-to-cart">Xem chi tiết</a>
														</div>
														
													</div>
												</div>
											</div>
											<div class="col-sm-3">
												<div class="product-image-wrapper">
													<div class="single-products">
														<div class="productinfo text-center">
															<img src="images/home/fortuner1.png" alt="" />
															<h2>1.018.000.000 VND</h2>
															<p>Camry 2.0 E</p>
															<a href="#" class="btn btn-default add-to-cart">Xem chi tiết</a>
														</div>
														
													</div>
												</div>
											</div>
										</div>
									</div>
									<a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
										<i class="fa fa-angle-left"></i>
									  </a>
									  <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
										<i class="fa fa-angle-right"></i>
									  </a>
								</div>
							</div>

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