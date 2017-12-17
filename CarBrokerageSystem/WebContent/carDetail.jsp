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
    <title>Thông tin xe</title>
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
		<div class="container" style="margin-top: 10px;">
			<div class="row">
			
				<!-- menu producer -->
				<jsp:include page="/navigationProducer.jsp"></jsp:include>
				<!-- menu producer end -->
				
				<div class="col-sm-9 padding-right">
					<div class="product-details"><!--product-details-->
					<bean:define id="car" name="carForm" property="carDetail"></bean:define>
					<bean:define id="carImage" name="car" property="carImage"></bean:define>
					<bean:define id="carID" name="car" property="carID"></bean:define>
					<bean:define id="carName" name="car" property="carName"></bean:define>
					<bean:define id="price" name="car" property="price"></bean:define>
						<div class="col-sm-6">
							<div class="view-product">
								<img src="${carImage }" alt="" />
							</div>
						</div>
						<div class="col-sm-6">
							<div class="product-information"><!--/product-information-->
								<h2><bean:write name="car" property="carName"/></h2>
								<span><span><bean:write name="car" property="price"/></span></span>
								<p><b>Hãng sản xuất:</b> <bean:write name="car" property="producerName"/></p>
								<p><b>Loại xe:</b> <bean:write name="car" property="typeCar"/></p>
								<p><b>Dòng xe:</b> <bean:write name="car" property="styleCar"/></p>
								<p><b>Màu sắc:</b> 
									<logic:iterate name="car" property="listColor" id="listColor">
										<bean:write name="listColor" property="color"/>, 
									</logic:iterate>
								</p>
								<p><b>Bảo hành:</b> <bean:write name="car" property="warranty"/></p>
								<br>
								<a>
									<button type="button" class="btn btn-default add-to-cart" style="margin-bottom: 0px" onclick="document.getElementById('order').style.display='block'">Đặt hàng</button>
								</a>
								
								<logic:equal value="0" name="carForm" property="follow">
								<html:link action="/carDetail?carID=${carID }&submit=followCar">
									<button type="button" name="submit" value="followCar" class="btn btn-default add-to-cart" style="margin-bottom: 0px" >Theo dõi xe</button>
								</html:link>
								</logic:equal>
								<logic:notEqual value="0" name="carForm" property="follow">
								<html:link action="/carDetail?carID=${carID }&submit=followCar">
									<button type="button" name="submit" value="followCar" class="btn btn-default add-to-cart" style="margin-bottom: 0px" >Đã theo dõi xe</button>
								</html:link>
								</logic:notEqual>
								
							</div><!--/product-information-->
						</div>
					</div><!--/product-details-->
					
					<div class="category-tab shop-details-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#engine" data-toggle="tab">Động cơ và khung xe</a>
								</li>
								<li><a href="#exterior" data-toggle="tab">Ngoại thất</a></li>
								<li><a href="#interior" data-toggle="tab">Nội thất</a></li>
								<li><a href="#safe" data-toggle="tab">An toàn</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="engine" >
								<div class = "container-info table-info-order">
									<table>
					                    <tbody>
					                        <tr>
					                            <td rowspan="2">Kích thước</td>
					                            <td>D x R x C</td>
					                            <td><bean:write name="car" property="size"/></td>
					                        </tr>
					                        <tr>
					                            <td>Chiều dài cơ sở</td>
					                            <td><bean:write name="car" property="wheelbase"/></td>
					                        </tr>
					                        <tr>
					                            <td rowspan="2">Trọng lượng</td>
					                            <td>Không tải</td>
					                            <td><bean:write name="car" property="weight"/></td>
					                        </tr>
					                        <tr>
					                            <td>Toàn tải</td>
					                            <td><bean:write name="car" property="maxWeight"/></td>
					                        </tr>
					                        <tr>
					                            <td rowspan="4">Động cơ</td>
					                            <td>Loại động cơ</td>
					                            <td><bean:write name="car" property="engineType"/></td>
					                        </tr>
					                        <tr>
					                            <td>Công xuất tối đa</td>
					                            <td><bean:write name="car" property="enginePower"/></td>
					                        </tr>
					                        <tr>
					                            <td>Mô men xoắn tối đa</td>
					                            <td><bean:write name="car" property="torque"/></td>
					                        </tr>
					                        <tr>
					                            <td>Tốc độ tối đa</td>
					                            <td><bean:write name="car" property="topSpeed"/></td>
					                        </tr>
					                        <tr>
					                            <td rowspan="3">Nhiên liệu</td>
					                            <td>Dung tích bình nhiên liệu</td>
					                            <td><bean:write name="car" property="fuelTankCapacity"/></td>
					                        </tr>
					                        <tr>
					                            <td>Loại nhiên liệu</td>
					                            <td><bean:write name="car" property="fuel"/></td>
					                        </tr>
					                        <tr>
					                            <td>Mức tiêu thụ nhiên liệu</td>
					                            <td><bean:write name="car" property="fuelConsumption"/></td>
					                        </tr>
					                        <tr>
					                            <td>Tiêu chuẩn khí thải</td>
					                            <td></td>
					                            <td><bean:write name="car" property="emissionStandard"/></td>
					                        </tr>
					                        <tr>
					                            <td>Hộp số</td>
					                            <td></td>
					                            <td><bean:write name="car" property="gear"/></td>
					                        </tr>
					                        <tr>
					                            <td rowspan="2">Phanh</td>
					                            <td>Trước</td>
					                            <td><bean:write name="car" property="frontBrake"/></td>
					                        </tr>
					                        <tr>
					                            <td>Sau</td>
					                            <td><bean:write name="car" property="rearBrake"/></td>
					                        </tr>
					                    </tbody>            
					                </table>
								</div>
							</div>
							
							<div class="tab-pane fade" id="exterior" >
								<div class = "container-info table-info-order">
									<table>
					                    <tbody>
					                        <tr>
					                            <td rowspan="2">Đèn sương mù</td>
					                            <td>Trước</td>
					                            <td><bean:write name="car" property="frontFoglamp"/></td>
					                        </tr>
					                        <tr>
					                            <td>Sau</td>
					                            <td><bean:write name="car" property="rearFoglamp"/></td>
					                        </tr>
					                        <tr>
					                            <td>Gương chiếu hậu ngoài</td>
					                            <td></td>
					                            <td><bean:write name="car" property="rearviewMirrorOutside"/></td>
					                        </tr>
					                        <tr>
					                            <td>Gạt mưa</td>
					                            <td></td>
					                            <td><bean:write name="car" property="winscreenWiper"/></td>
					                        </tr>
					                        <tr>
					                            <td>Ăng ten</td>
					                            <td></td>
					                            <td><bean:write name="car" property="antenna"/></td>
					                        </tr>
					                        <tr>
					                            <td>Tay nắm cửa</td>
					                            <td></td>
					                            <td><bean:write name="car" property="doorHandle"/></td>
					                        </tr>
					                    </tbody>            
					                </table>
								</div>
							</div>
							
							<div class="tab-pane fade" id="interior" >
								<div class = "container-info table-info-order">
									<table>
					                    <tbody>
					                        <tr>
					                            <td>Máy lạnh</td>
					                            <td></td>
					                            <td><bean:write name="car" property="airConditioner"/></td>
					                        </tr>
					                        <tr>
					                            <td>Gương chiếu hậu trong</td>
					                            <td></td>
					                            <td><bean:write name="car" property="rearviewMirrorInside"/></td>
					                        </tr>
					                        <tr>
					                            <td>Cửa sổ trời</td>
					                            <td></td>
					                            <td><bean:write name="car" property="sunroof"/></td>
					                        </tr>
					                        <tr>
					                            <td rowspan="2">Ghế</td>
					                            <td>Loại ghế</td>
					                            <td><bean:write name="car" property="seatType"/></td>
					                        </tr>
					                        <tr>
					                            <td>Số ghế</td>
					                            <td><bean:write name="car" property="seat"/></td>
					                        </tr>
					                        <tr>
					                            <td>Mảnh che nắng</td>
					                            <td></td>
					                            <td><bean:write name="car" property="sunshade"/></td>
					                        </tr>
					                        <tr>
					                            <td>Hộc đựng cốc</td>
					                            <td></td>
					                            <td><bean:write name="car" property="cupHolder"/></td>
					                        </tr>
					                        <tr>
					                            <td rowspan="5">Hệ thống âm thanh</td>
					                            <td>Loại loa</td>
					                            <td><bean:write name="car" property="speakerType"/></td>
					                        </tr>
					                        <tr>
					                            <td>Đầu đĩa</td>
					                            <td><bean:write name="car" property="dics"/></td>
					                        </tr>
					                        <tr>
					                            <td>Số loa</td>
					                            <td><bean:write name="car" property="numberSpeaker"/></td>
					                        </tr>
					                        <tr>
					                            <td>Cổng kết nối USB</td>
					                            <td><bean:write name="car" property="usb"/></td>
					                        </tr>
					                        <tr>
					                            <td>Cổng kết nối Bluetooth</td>
					                            <td><bean:write name="car" property="bluetooth"/></td>
					                        </tr>
					                    </tbody>            
					                </table>
								</div>
							</div>

							<div class="tab-pane fade" id="safe" >
								<div class = "container-info table-info-order">
									<table>
					                    <tbody>
					                        <tr>
					                            <td>Hệ thống cân bằng điện tử</td>
					                            <td></td>
					                            <td><bean:write name="car" property="electronicStabilityControl"/></td>
					                        </tr>
					                        <tr>
					                            <td>Đèn báo phanh khẩn cấp</td>
					                            <td></td>
					                            <td><bean:write name="car" property="brakelight"/></td>
					                        </tr>
					                        <tr>
					                            <td>Khóa an toàn cho trẻ em</td>
					                            <td></td>
					                            <td><bean:write name="car" property="childSafetyLock"/></td>
					                        </tr>
					                        <tr>
					                            <td>Dây đai an toàn</td>
					                            <td></td>
					                            <td><bean:write name="car" property="seatBelt"/></td>
					                        </tr>
					                        <tr>
					                            <td>Túi khí</td>
					                            <td></td>
					                            <td><bean:write name="car" property="airbag"/></td>
					                        </tr>
					                    </tbody>            
					                </table>
								</div>
							</div>
							
						</div>
					</div><!--/category-tab-->

					<!-- <div class="recommended_items">recommended_items
						<h2 class="title text-center">Sản phẩm tương tự</h2>
						
						<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">	
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend1.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="item">	
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend1.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
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
					</div>/recommended_items -->
				</div>
			</div>
		</div>
		
		<html:form style="padding-top: 50px" styleId="order" styleClass="modal" method="post" action="/order">
		<div class = "modal-content-info animate-noti">
            <div class = "container-info-header">
                <label style = "font-size:26px">Thông tin đặt hàng</label>
                <html:hidden property="carID" name="car"/>
                <html:hidden property="userName" name="carForm"/>
            </div>
            <div class = "container-info table-order-car">
            <div>
                <img style="width: 100%; height: 100%" src="${carImage }" alt="" />
            </div>
            <table border="1" width="100%">
                <tr>
                    <td style="padding-left: 5px">Mẫu xe</td>
                    <td><input class="input-info" style="background-color: #e0e0e0" type ="text" name="carOrder" id="carOrder" maxlength="250" readonly="readonly" value="${carName }"></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">Giá</td>
                    <td>
                    <input class="input-info" style="background-color: #e0e0e0" type ="text" name="priceOrder" id="priceOrder" maxlength="250" readonly="readonly" value="${price }"></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">Tên người đặt</td>
                    <td><input class="input-info" type = "text" name="orderer" id="nameOrder" maxlength="250"></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">Số điện thoại</td>
                    <td><input class="input-info" type = "number" name="phoneNumber" id="phoneOrder" maxlength="250"></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">Email</td>
                    <td><input class="input-info" type = "email" name="email" id="emailOrder" maxlength="250"></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">Địa chỉ</td>
                    <td><input class="input-info" type = "text" name="email" id="address" maxlength="250"></td>
                </tr>
            </table>
            </div>
            <div class = "container-noti-footer">
              <button class="btn btn-default add-to-cart" style="margin: 0px 5px; width: 70px" type="submit" value="submit" name="submit" id="submit">Đặt</button>
              <input type="button" class="btn btn-default add-to-cart" style="margin: 0px 5px; width: 70px" value="Hủy" onclick="document.getElementById('order').style.display='none'">
          </div>
	</html:form>
		
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
    <script>
    $(function () {
  	  $('#hr').css({
  	    	'padding-bottom': '10px',
  	        'border-bottom': '1px solid #f5f5f5',
  	        'margin-left': '0px',
  	        'margin-right': '0px'
  	    })
    })
    </script>
</body>
</html>