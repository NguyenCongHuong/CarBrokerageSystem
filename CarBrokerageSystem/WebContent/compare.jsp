<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>So sánh xe</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="stylesheet" href="bower_components/select2/dist/css/select2.min.css">
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
				
				<html:form action="/compare" method="post">
					<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">So sánh hai xe hơi</h2>
						<div class="tab-content">
								<div class = "container-info table-info-order">
									<table>
					                    <tbody>
					                    	<tr style="border-left: solid white; border-right: solid white; border-top: solid white;">
					                    		<th width="30%" colspan="2">Chọn một hãng xe:</th>
					                    		<th width="35%" style="border-left: solid white; border-right: solid white">
					                    			<html:select property="producerID" styleId="column_select1">
								                  		<option value="0" selected disabled>Chọn hãng xe</option>
								                  		<html:optionsCollection name="carForm" property="listProducer" label="producerName" value="producerID"/>
								                    </html:select>
					                    		</th>
					                    		<th width="35%">
					                    			<html:select property="producerID2" styleId="column_select2">
								                  		<option value="0" selected disabled>Chọn hãng xe</option>
								                  		<html:optionsCollection name="carForm" property="listProducer" label="producerName" value="producerID"/>
								                    </html:select>
					                    		</th>
					                    	</tr>
					                    	<tr style="border-left: solid white; border-right: solid white; border-top: solid white;">
					                    		<td colspan="2">Chọn một xe:</td>
					                    		<td style="border-left: solid white; border-right: solid white">
					                    			<html:select property="carID" styleId="layout_select1" onchange="this.form.submit()">
								                  		<option value="0" selected disabled>Chọn xe</option>
								                  		<html:optionsCollection name="carForm" property="listCar" label="carName" value="id"/>
								                    </html:select>
					                    		</td>
					                    		<td>
					                    			<html:select property="carID2" styleId="layout_select2" onchange="this.form.submit()">
								                  		<option value="0" selected disabled>Chọn xe</option>
								                  		<html:optionsCollection name="carForm" property="listCar" label="carName" value="id"/>
								                    </html:select>
					                    		</td>
					                    	</tr>
					  
					                    	<tr>
					                        	<td colspan="4" style="border-left: solid white; border-right: solid white; border-top: solid white;"><h4><strong>Thông tin chung</strong></h4></td>
					                        </tr>
					                        <tr>
					                            <td colspan="2">Tên xe</td>
					                            <td><bean:write name="carForm" property="carDetail.carName"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.carName"/></td>
					                        </tr>
					                        <tr>
					                            <td colspan="2">Giá thành</td>
					                            <td><bean:write name="carForm" property="carDetail.price"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.price"/></td>
					                        </tr>
					                        <tr>
					                            <td colspan="2">Hãng sản xuất</td>
					                            <td><bean:write name="carForm" property="carDetail.producerName"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.producerName"/></td>
					                        </tr>
					                        <tr>
					                            <td colspan="2">Thể loại</td>
					                            <td><bean:write name="carForm" property="carDetail.typeCar"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.typeCar"/></td>
					                        </tr>
					                        <tr>
					                            <td colspan="2">Kiểu dáng</td>
					                            <td><bean:write name="carForm" property="carDetail.styleCar"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.styleCar"/></td>
					                        </tr>
					                        <tr>
					                            <td colspan="2">Bảo hàng</td>
					                            <td><bean:write name="carForm" property="carDetail.warranty"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.warranty"/></td>
					                        </tr>

					                    	<tr>
					                        	<td colspan="4" colspan="4" style="border-left: solid white; border-right: solid white"><h4><strong>Động cơ và khung xe</strong></h4></td>
					                        </tr>
					                        <tr>
					                            <td rowspan="2">Kích thước</td>
					                            <td>D x R x C</td>
					                            <td><bean:write name="carForm" property="carDetail.size"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.size"/></td>
					                        </tr>
					                        <tr>
					                            <td>Chiều dài cơ sở</td>
					                            <td><bean:write name="carForm" property="carDetail.wheelbase"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.wheelbase"/></td>
					                        </tr>
					                        <tr>
					                            <td rowspan="2">Trọng lượng</td>
					                            <td>Không tải</td>
					                            <td><bean:write name="carForm" property="carDetail.weight"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.weight"/></td>
					                        </tr>
					                        <tr>
					                            <td>Toàn tải</td>
					                            <td><bean:write name="carForm" property="carDetail.maxWeight"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.maxWeight"/></td>
					                        </tr>
					                        <tr>
					                            <td rowspan="4">Động cơ</td>
					                            <td>Loại động cơ</td>
					                            <td><bean:write name="carForm" property="carDetail.engineType"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.engineType"/></td>
					                        </tr>
					                        <tr>
					                            <td>Công xuất tối đa</td>
					                            <td><bean:write name="carForm" property="carDetail.enginePower"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.enginePower"/></td>
					                        </tr>
					                        <tr>
					                            <td>Mô men xoắn tối đa</td>
					                            <td><bean:write name="carForm" property="carDetail.torque"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.torque"/></td>
					                        </tr>
					                        <tr>
					                            <td>Tốc độ tối đa</td>
					                            <td><bean:write name="carForm" property="carDetail.topSpeed"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.topSpeed"/></td>
					                        </tr>
					                        <tr>
					                            <td rowspan="3">Nhiên liệu</td>
					                            <td>Dung tích bình nhiên liệu</td>
					                            <td><bean:write name="carForm" property="carDetail.fuelTankCapacity"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.fuelTankCapacity"/></td>
					                        </tr>
					                        <tr>
					                            <td>Loại nhiên liệu</td>
					                            <td><bean:write name="carForm" property="carDetail.fuel"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.fuel"/></td>
					                        </tr>
					                        <tr>
					                            <td>Mức tiêu thụ nhiên liệu</td>
					                            <td><bean:write name="carForm" property="carDetail.fuelConsumption"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.fuelConsumption"/></td>
					                        </tr>
					                        <tr>
					                            <td>Tiêu chuẩn khí thải</td>
					                            <td></td>
					                            <td><bean:write name="carForm" property="carDetail.emissionStandard"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.emissionStandard"/></td>
					                        </tr>
					                        <tr>
					                            <td>Hộp số</td>
					                            <td></td>
					                            <td><bean:write name="carForm" property="carDetail.gear"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.gear"/></td>
					                        </tr>
					                        <tr>
					                            <td rowspan="2">Phanh</td>
					                            <td>Trước</td>
					                            <td><bean:write name="carForm" property="carDetail.frontBrake"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.frontBrake"/></td>
					                        </tr>
					                        <tr>
					                            <td>Sau</td>
					                            <td><bean:write name="carForm" property="carDetail.rearBrake"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.rearBrake"/></td>
					                        </tr>
					                        <tr>
					                        	<td colspan="4" colspan="4" style="border-left: solid white; border-right: solid white"><h4><strong>Ngoại thất</strong></h4></td>
					                        </tr>
					                        <tr>
					                            <td rowspan="2">Đèn sương mù</td>
					                            <td>Trước</td>
					                            <td><bean:write name="carForm" property="carDetail.frontFoglamp"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.frontFoglamp"/></td>
					                        </tr>
					                        <tr>
					                            <td>Sau</td>
					                            <td><bean:write name="carForm" property="carDetail.rearFoglamp"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.rearFoglamp"/></td>
					                        </tr>
					                        <tr>
					                            <td>Gương chiếu hậu ngoài</td>
					                            <td></td>
					                            <td><bean:write name="carForm" property="carDetail.rearviewMirrorOutside"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.rearviewMirrorOutside"/></td>
					                        </tr>
					                        <tr>
					                            <td>Gạt mưa</td>
					                            <td></td>
					                            <td><bean:write name="carForm" property="carDetail.winscreenWiper"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.winscreenWiper"/></td>
					                        </tr>
					                        <tr>
					                            <td>Ăng ten</td>
					                            <td></td>
					                            <td><bean:write name="carForm" property="carDetail.antenna"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.antenna"/></td>
					                        </tr>
					                        <tr>
					                            <td>Tay nắm cửa</td>
					                            <td></td>
					                            <td><bean:write name="carForm" property="carDetail.doorHandle"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.doorHandle"/></td>
					                        </tr>
					                        <tr>
					                        	<td colspan="4"style="border-left: solid white; border-right: solid white"><h4><strong>Nội thất</strong></h4></td>
					                        </tr>
					                        <tr>
					                            <td>Máy lạnh</td>
					                            <td></td>
					                            <td><bean:write name="carForm" property="carDetail.airConditioner"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.airConditioner"/></td>
					                        </tr>
					                        <tr>
					                            <td>Gương chiếu hậu trong</td>
					                            <td></td>
					                            <td><bean:write name="carForm" property="carDetail.rearviewMirrorInside"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.rearviewMirrorInside"/></td>
					                        </tr>
					                        <tr>
					                            <td>Cửa sổ trời</td>
					                            <td></td>
					                            <td><bean:write name="carForm" property="carDetail.sunroof"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.sunroof"/></td>
					                        </tr>
					                        <tr>
					                            <td rowspan="2">Ghế</td>
					                            <td>Loại ghế</td>
					                            <td><bean:write name="carForm" property="carDetail.seatType"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.seatType"/></td>
					                        </tr>
					                        <tr>
					                            <td>Số ghế</td>
					                            <td><bean:write name="carForm" property="carDetail.seat"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.seat"/></td>
					                        </tr>
					                        <tr>
					                            <td>Mảnh che nắng</td>
					                            <td></td>
					                            <td><bean:write name="carForm" property="carDetail.sunshade"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.sunshade"/></td>
					                        </tr>
					                        <tr>
					                            <td>Hộc đựng cốc</td>
					                            <td></td>
					                            <td><bean:write name="carForm" property="carDetail.cupHolder"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.cupHolder"/></td>
					                        </tr>
					                        <tr>
					                            <td rowspan="5">Hệ thống âm thanh</td>
					                            <td>Loại loa</td>
					                            <td><bean:write name="carForm" property="carDetail.speakerType"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.speakerType"/></td>
					                        </tr>
					                        <tr>
					                            <td>Đầu đĩa</td>
					                            <td><bean:write name="carForm" property="carDetail.dics"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.dics"/></td>
					                        </tr>
					                        <tr>
					                            <td>Số loa</td>
					                            <td><bean:write name="carForm" property="carDetail.numberSpeaker"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.numberSpeaker"/></td>
					                        </tr>
					                        <tr>
					                            <td>Cổng kết nối USB</td>
					                            <td><bean:write name="carForm" property="carDetail.usb"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.usb"/></td>
					                        </tr>
					                        <tr>
					                            <td>Cổng kết nối Bluetooth</td>
					                            <td><bean:write name="carForm" property="carDetail.bluetooth"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.bluetooth"/></td>
					                        </tr>
					                        <tr>
					                        	<td colspan="4" style="border-left: solid white; border-right: solid white"><h4><strong>An toàn</strong></h4></td>
					                        </tr>
					                        <tr>
					                            <td colspan="2">Hệ thống cân bằng điện tử</td>
					                            <td><bean:write name="carForm" property="carDetail.electronicStabilityControl"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.electronicStabilityControl"/></td>
					                        </tr>
					                        <tr>
					                            <td colspan="2">Đèn báo phanh khẩn cấp</td>
					                            <td><bean:write name="carForm" property="carDetail.brakelight"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.brakelight"/></td>
					                        </tr>
					                        <tr>
					                            <td colspan="2">Khóa an toàn cho trẻ em</td>
					                            <td><bean:write name="carForm" property="carDetail.childSafetyLock"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.childSafetyLock"/></td>
					                        </tr>
					                        <tr>
					                            <td colspan="2">Dây đai an toàn</td>
					                            <td><bean:write name="carForm" property="carDetail.seatBelt"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.seatBelt"/></td>
					                        </tr>
					                        <tr>
					                            <td colspan="2">Túi khí</td>
					                            <td><bean:write name="carForm" property="carDetail.airbag"/></td>
					                            <td><bean:write name="carForm" property="carDetail2.airbag"/></td>
					                        </tr>
					                    </tbody>            
					                </table>
								</div>
						</div>
					</div><!--features_items-->
				</div>
				</html:form>
				
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
    <script src="bower_components/select2/dist/js/select2.full.min.js"></script>
    <script>
    
    $(function () {
  	  $('#hr').css({
  	    	'padding-bottom': '10px',
  	        'border-bottom': '1px solid #f5f5f5',
  	        'margin-left': '0px',
  	        'margin-right': '0px'
  	    });
  	  $('.select2').select2()
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
    
    $(document).ready(function() {
	    $("#layout_select1").children('option:gt(0)').hide();
	    $("#column_select1").change(function() {
	        $("#layout_select1").children('option').hide();
	        $("#layout_select1").children("option[value^=" + $(this).val() + "]").show()
	    })
	    $("#layout_select2").children('option:gt(0)').hide();
	    $("#column_select2").change(function() {
	        $("#layout_select2").children('option').hide();
	        $("#layout_select2").children("option[value^=" + $(this).val() + "]").show()
	    })
	})
	
	</script>
</body>
</html>