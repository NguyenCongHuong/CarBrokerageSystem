<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="vi">
 	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Tìm kiếm</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<body>
	<!-- menu bar -->
	<jsp:include page="/navigationUser.jsp"></jsp:include>
	<!-- menu bar end -->

	<section>
		<div class="container" style="margin-top: 10px; margin-bottom: 20px">
			<div class="row">
				
				<!-- menu producer -->
				<jsp:include page="/navigationProducer.jsp"></jsp:include>
				<!-- menu producer end -->
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Kết quả tìm kiếm "<bean:write name="listCarForm" property="searchString"/>"</h2>
						<h4><bean:write name="listCarForm" property="nofi"/></h4>
						<logic:iterate name="listCarForm" property="listCarSearch" id="listCar">
							<bean:define id="carImage" name="listCar" property="carImage"></bean:define>
							<bean:define id="carID" name="listCar" property="carID"></bean:define>
							<bean:define id="carName" name="listCar" property="carName"></bean:define>
								<div class="col-sm-4">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="${carImage}" />
												<h2><bean:write name="listCar" property="price"/></h2>
												<p><bean:write name="listCar" property="carName"/></p>
												<html:link action="/carDetail?carID=${carID }" styleClass="btn btn-default add-to-cart">Xem chi tiết</html:link>
											</div>
										</div>
									</div>
								</div>
							</logic:iterate>
					</div><!--features_items-->
				</div>
			</div>
		</div>
	</section>
	
	<!-- footer -->
	<jsp:include page="/footerUser.jsp"></jsp:include>
	<!-- footer end -->

    <script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
    <script>
    $(function () {
  	  $('#hr').css({
  	    	'padding-bottom': '10px',
  	        'border-bottom': '1px solid #f5f5f5',
  	        'margin-left': '0px',
  	        'margin-right': '0px'
  	    })
    })
    
	function myFunction(id) {
	    var x = document.getElementById(id);
	    if (x.className.indexOf("show") == -1) {
	        x.className += " show";
	        x.previousElementSibling.className = 
	        x.previousElementSibling.className.replace("w3-black", "w3-red");
	    } else { 
	        x.className = x.className.replace(" show", "");
	        x.previousElementSibling.className = 
	        x.previousElementSibling.className.replace("w3-red", "w3-black");
	    }
	}
	
	</script>
</body>
</html>