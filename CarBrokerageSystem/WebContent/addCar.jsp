<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="vi">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Thêm xe</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet"
	href="bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="bower_components/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="bower_components/Ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="plugins/iCheck/all.css">
<link rel="stylesheet"
	href="bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
	href="plugins/timepicker/bootstrap-timepicker.min.css">
<link rel="stylesheet"
	href="bower_components/select2/dist/css/select2.min.css">
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="css/popup.css">
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,300,400italic,500,700,100">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<jsp:include page="/navigationAdmin.jsp"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<section class="content-header">
			<h1>Thêm một xe hơi</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-car"></i> Quản lý xe</a></li>
				<li class="active"><a href="#">TOYOTA</a></li>
			</ol>
			</section>

			<html:form action="/addCar" method="post"
				enctype="multipart/form-data">
				<section class="content">
				<div class="box">
					<div class="box box-default">
						<div class="box-header with-border">
							<h3 class="box-title">Thông tin chung</h3>

							<div class="box-tools pull-right">
								<a class="btn btn-box-tool" data-widget="collapse"><i
									class="fa fa-minus"></i></a>
							</div>
						</div>
						<div class="box-body">
							<div class="row">

								<div class="col-md-12">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Tên xe</label>
											<html:text property="carName" styleClass="form-control"
												styleId="carName"></html:text>
										</div>
									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<label>Hãng sản xuất</label>
											<html:select property="producerID" style="width: 100%;"
												styleClass="form-control select2" styleId="producerName">
												<html:optionsCollection name="carForm"
													property="listProducer" label="producerName"
													value="producerID" />
											</html:select>
										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Dòng xe</label>
											<html:select property="styleCarID" style="width: 100%;"
												styleClass="form-control select2" styleId="styleCar">
												<html:optionsCollection name="carForm" property="listStyle"
													label="styleCar" value="styleCarID" />
											</html:select>
										</div>
									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<label>Loại xe</label>
											<html:select property="typeCarID" style="width: 100%;"
												styleClass="form-control select2" styleId="typeCar">
												<html:optionsCollection name="carForm" property="listType"
													label="typeCar" value="typeCarID" />
											</html:select>
										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Giá tiền</label>
											<html:text property="price" styleClass="form-control"
												styleId="price"></html:text>
										</div>
									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<label>Loại bảo hành xe</label>
											<html:text property="warranty" styleClass="form-control"
												styleId="warranty"></html:text>
										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Hình ảnh xe</label>
											<html:file property="carImage" accept="image/*"
												styleId="carImage" />
										</div>
									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<label>Hình ảnh nền xe</label>
											<html:file property="carBanner" accept="image/*"
												styleId="carImageBanner" />
										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="col-sm-6">
									<div class="form-group">
										<label>Màu của xe</label>
										<html:text property="color" styleClass="form-control"
											styleId="color"></html:text>
									</div>
								</div>

									<div class="col-sm-6">
										<div class="form-group">
											<label>Ngũ hành</label>
											<html:select value="0" property="fiveElement"
												style="width: 100%;" styleId="fiveElement"
												styleClass="form-control select2">
												<html:option value="0">Kim</html:option>
												<html:option value="1">Thủy</html:option>
												<html:option value="2">Hỏa</html:option>
												<html:option value="3">Thổ</html:option>
												<html:option value="4">Mộc</html:option>
											</html:select>
										</div>
									</div>
								</div>

							</div>
							<!-- /.row -->
						</div>
					</div>
				</div>

				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title">Động cơ và khung xe</h3>

						<div class="box-tools pull-right">
							<a class="btn btn-box-tool" data-widget="collapse"><i
								class="fa fa-minus"></i></a>
						</div>
					</div>
					<div class="box-body">
						<div class="row">

							<div class="col-md-12">
								<div class="col-sm-6">
									<div class="form-group">
										<label>Kích thước</label>
										<html:text property="size" styleClass="form-control"
											styleId="size"></html:text>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label>Chiều dài cơ sở</label>
										<html:text property="wheelbase" styleClass="form-control"
											styleId="wheelbase"></html:text>
									</div>
								</div>
							</div>

							<div class="col-md-12">
								<div class="col-sm-6">
									<div class="form-group">
										<label>Trọng lượng không tải</label>
										<html:text property="weight" styleClass="form-control"
											styleId="weight"></html:text>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label>Trọng lượng toàn tải</label>
										<html:text property="maxWeight" styleClass="form-control"
											styleId="maxWeight"></html:text>
									</div>
								</div>
							</div>

							<div class="col-md-12">
								<div class="col-sm-6">
									<div class="form-group">
										<label>Loại động cơ</label>
										<html:text property="engineType" styleClass="form-control"
											styleId="engineType"></html:text>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label>Công xuất tối đa</label>
										<html:text property="enginePower" styleClass="form-control"
											styleId="enginePower"></html:text>
									</div>
								</div>
							</div>

							<div class="col-md-12">
								<div class="col-sm-6">
									<div class="form-group">
										<label>Mô men xoắn tối đa</label>
										<html:text property="torque" styleClass="form-control"
											styleId="torque"></html:text>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label>Tốc độ tối đa</label>
										<html:text property="topSpeed" styleClass="form-control"
											styleId="topSpeed"></html:text>
									</div>
								</div>
							</div>

							<div class="col-md-12">
								<div class="col-sm-6">
									<div class="form-group">
										<label>Dung tích bình nhiên liệu</label>
										<html:text property="fuelTankCapacity"
											styleClass="form-control" styleId="fuelTankCapacity"></html:text>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label>Loại nhiên liệu</label>
										<html:text property="fuel" styleClass="form-control"
											styleId="fuel"></html:text>
									</div>
								</div>
							</div>

							<div class="col-md-12">
								<div class="col-sm-6">
									<div class="form-group">
										<label>Mức tiêu thụ nhiên liệu</label>
										<html:text property="fuelConsumption"
											styleClass="form-control" styleId="fuelConsumption"></html:text>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label>Tiêu chuẩn khí thải</label>
										<html:text property="emissionStandard"
											styleClass="form-control" styleId="emissionStandard"></html:text>
									</div>
								</div>
							</div>

							<div class="col-md-12">
								<div class="col-sm-6">
									<div class="form-group">
										<label>Phanh trước</label>
										<html:text property="frontBrake" styleClass="form-control"
											styleId="frontBrake"></html:text>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label>Phanh sau</label>
										<html:text property="rearBrake" styleClass="form-control"
											styleId="rearBrake"></html:text>
									</div>
								</div>
							</div>

							<div class="col-md-12">
								<div class="col-sm-6">
									<div class="form-group">
										<label>Hộp số</label>
										<html:text property="gear" styleClass="form-control"
											styleId="gear"></html:text>
									</div>
								</div>
							</div>

						</div>
						<!-- /.row -->
					</div>
				</div>

				<div class="box">
					<div class="box box-default">
						<div class="box-header with-border">
							<h3 class="box-title">Ngoại thất</h3>

							<div class="box-tools pull-right">
								<a class="btn btn-box-tool" data-widget="collapse"><i
									class="fa fa-minus"></i></a>
							</div>
						</div>
						<div class="box-body">
							<div class="row">

								<div class="col-md-12">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Đèn sương mù trước</label>
											<html:text property="frontFoglamp" styleClass="form-control"
												styleId="frontFoglamp"></html:text>
										</div>
									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<label>Đèn sương mù sau</label>
											<html:text property="rearFoglamp" styleClass="form-control"
												styleId="rearFoglamp"></html:text>
										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Gương chiếu hậu ngoài</label>
											<html:text property="rearviewMirrorOutside"
												styleClass="form-control" styleId="rearviewMirrorOutside"></html:text>
										</div>
									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<label>Gạt mưa</label>
											<html:text property="winscreenWiper"
												styleClass="form-control" styleId="winscreenWiper"></html:text>
										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Ăng ten</label>
											<html:text property="antenna" styleClass="form-control"
												styleId="antenna"></html:text>
										</div>
									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<label>Tay nắm cửa</label>
											<html:text property="doorHandle" styleClass="form-control"
												styleId="doorHandle"></html:text>
										</div>
									</div>
								</div>

							</div>
							<!-- /.row -->
						</div>
					</div>
				</div>

				<div class="box">
					<div class="box box-default">
						<div class="box-header with-border">
							<h3 class="box-title">Nội thất</h3>

							<div class="box-tools pull-right">
								<a class="btn btn-box-tool" data-widget="collapse"><i
									class="fa fa-minus"></i></a>
							</div>
						</div>
						<div class="box-body">
							<div class="row">

								<div class="col-md-12">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Máy lạnh</label>
											<html:text property="airConditioner"
												styleClass="form-control" styleId="airConditioner"></html:text>
										</div>
									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<label>Gương chiếu hậu trong</label>
											<html:text property="rearviewMirrorInside"
												styleClass="form-control" styleId="rearviewMirrorInside"></html:text>
										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Loại ghế</label>
											<html:text property="seatType" styleClass="form-control"
												styleId="seatType"></html:text>
										</div>
									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<label>Số ghế</label>
											<html:text property="seat" styleClass="form-control"
												styleId="seat"></html:text>
										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Cửa sổ trời</label>
											<html:text property="sunroof" styleClass="form-control"
												styleId="sunroof"></html:text>
										</div>
									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<label>Mảnh che nắng</label>
											<html:text property="sunshade" styleClass="form-control"
												styleId="sunshade"></html:text>
										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Hộc đựng cốc</label>
											<html:text property="cupHolder" styleClass="form-control"
												styleId="cupHolder"></html:text>
										</div>
									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<label>Loại loa</label>
											<html:text property="speakerType" styleClass="form-control"
												styleId="speakerType"></html:text>
										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Đầu đĩa</label>
											<html:text property="dics" styleClass="form-control"
												styleId="dics"></html:text>
										</div>
									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<label>Số loa</label>
											<html:text property="numberSpeaker" styleClass="form-control"
												styleId="numberSpeaker"></html:text>
										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Cổng kết nối USB</label>
											<html:text property="usb" styleClass="form-control"
												styleId="usb"></html:text>
										</div>
									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<label>Cổng kết nối Bluetooth</label>
											<html:text property="bluetooth" styleClass="form-control"
												styleId="bluetooth"></html:text>
										</div>
									</div>
								</div>

							</div>
							<!-- /.row -->
						</div>
					</div>
				</div>

				<div class="box">
					<div class="box box-default">
						<div class="box-header with-border">
							<h3 class="box-title">An toàn</h3>

							<div class="box-tools pull-right">
								<a class="btn btn-box-tool" data-widget="collapse"><i
									class="fa fa-minus"></i></a>
							</div>
						</div>
						<form>
							<div class="box-body">
								<div class="row">

									<div class="col-md-12">
										<div class="col-sm-6">
											<div class="form-group">
												<label>Hệ thống cân bằng điện tử</label>
												<html:text property="electronicStabilityControl"
													styleClass="form-control"
													styleId="electronicStabilityControl"></html:text>
											</div>
										</div>

										<div class="col-sm-6">
											<div class="form-group">
												<label>Đèn báo phanh khẩn cấp</label>
												<html:text property="brakelight" styleClass="form-control"
													styleId="brakelight"></html:text>
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="col-sm-6">
											<div class="form-group">
												<label>Khóa an toàn cho trẻ em</label>
												<html:text property="childSafetyLock"
													styleClass="form-control" styleId="childSafetyLock"></html:text>
											</div>
										</div>

										<div class="col-sm-6">
											<div class="form-group">
												<label>Dây đai an toàn</label>
												<html:text property="seatBelt" styleClass="form-control"
													styleId="seatBelt"></html:text>
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="col-sm-6">
											<div class="form-group">
												<label>Túi khí</label>
												<html:text property="airbag" styleClass="form-control"
													styleId="airbag"></html:text>
											</div>
										</div>
									</div>

								</div>
								<!-- /.row -->
							</div>
					</div>
				</div>

				<div class="box-footer footer-center">
					<button type="submit" class="btn btn-info" name="submit"
						value="submit">Thêm xe</button>
				</div>

				</section>
			</html:form>
		</div>
		<!-- /.content-wrapper -->

		<jsp:include page="/footerAdmin.jsp"></jsp:include>

		<div class="control-sidebar-bg"></div>

	</div>


	<script src="bower_components/jquery/dist/jquery.min.js"></script>
	<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="bower_components/select2/dist/js/select2.full.min.js"></script>
	<script src="plugins/input-mask/jquery.inputmask.js"></script>
	<script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script src="bower_components/moment/min/moment.min.js"></script>
	<script
		src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script
		src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<script
		src="bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
	<script src="plugins/timepicker/bootstrap-timepicker.min.js"></script>
	<script
		src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="plugins/iCheck/icheck.min.js"></script>
	<script src="bower_components/fastclick/lib/fastclick.js"></script>
	<script src="dist/js/adminlte.min.js"></script>
	<script src="dist/js/demo.js"></script>

	<script>
		$(function() {

			$('.select2').select2()

			//Colorpicker
			$('.my-colorpicker1').colorpicker()
			//color picker with addon
			$('.my-colorpicker2').colorpicker()

			$('#carName').attr({
				'placeholder' : 'Nhập tên xe',
				'required' : 'required'
			})

			$('#price').attr({
				'placeholder' : 'Nhập giá tiền',
				'required' : 'required'
			})

			$('#warranty').attr({
				'placeholder' : 'Nhập loại bảo hành của xe',
				'required' : 'required'
			})

			$('#carImage').attr({
				'required' : 'required'
			})

			$('#color').attr({
				'placeholder' : 'Nhập tên màu xe',
				'required' : 'required'
			})

			$('#size').attr({
				'placeholder' : 'Nhập kích thước xe',
				'required' : 'required'
			})

			$('#wheelbase').attr({
				'placeholder' : 'Nhập chiều dài cơ sở',
				'required' : 'required'
			})

			$('#weight').attr({
				'placeholder' : 'Nhập trọng lượng không tải',
				'required' : 'required'
			})

			$('#maxWeight').attr({
				'placeholder' : 'Nhập trọng lượng toàn tải',
				'required' : 'required'
			})

			$('#engineType').attr({
				'placeholder' : 'Nhập loại động cơ',
				'required' : 'required'
			})

			$('#enginePower').attr({
				'placeholder' : 'Nhập công xuất tối đa',
				'required' : 'required'
			})

			$('#torque').attr({
				'placeholder' : 'Nhập loại mô men xoắn tối đa',
				'required' : 'required'
			})

			$('#topSpeed').attr({
				'placeholder' : 'Nhập tốc độ tối đa',
				'required' : 'required'
			})

			$('#fuelTankCapacity').attr({
				'placeholder' : 'Nhập dung tích bình nhiên liệu',
				'required' : 'required'
			})

			$('#fuel').attr({
				'placeholder' : 'Nhập loại nhiên liệu',
				'required' : 'required'
			})

			$('#fuelConsumption').attr({
				'placeholder' : 'Nhập mức tiêu thụ nhiên liệu',
				'required' : 'required'
			})

			$('#emissionStandard').attr({
				'placeholder' : 'Nhập tiêu chuẩn khí thải',
				'required' : 'required'
			})

			$('#frontBrake').attr({
				'placeholder' : 'Nhập loại phanh trước',
				'required' : 'required'
			})

			$('#rearBrake').attr({
				'placeholder' : 'Nhập loại phanh sau',
				'required' : 'required'
			})

			$('#gear').attr({
				'placeholder' : 'Nhập loại hộp số',
				'required' : 'required'
			})

			$('#frontFoglamp').attr({
				'placeholder' : 'Nhập loại đèn sương mù trước',
				'required' : 'required'
			})

			$('#rearFoglamp').attr({
				'placeholder' : 'Nhập loại đèn sương mù sau',
				'required' : 'required'
			})

			$('#rearviewMirrorOutside').attr({
				'placeholder' : 'Nhập loại gương chiếu hậu ngoài',
				'required' : 'required'
			})

			$('#winscreenWiper').attr({
				'placeholder' : 'Nhập loại gạt mưa',
				'required' : 'required'
			})

			$('#antenna').attr({
				'placeholder' : 'Nhập loại ăng ten',
				'required' : 'required'
			})

			$('#doorHandle').attr({
				'placeholder' : 'Nhập chất liệu tay nắm cửa',
				'required' : 'required'
			})

			$('#airConditioner').attr({
				'placeholder' : 'Nhập loại máy lạnh',
				'required' : 'required'
			})

			$('#rearviewMirrorInside').attr({
				'placeholder' : 'Nhập loại gương chiếu hậu trong',
				'required' : 'required'
			})

			$('#seatType').attr({
				'placeholder' : 'Nhập loại ghế',
				'required' : 'required'
			})

			$('#seat').attr({
				'placeholder' : 'Nhập số lượng ghế',
				'required' : 'required',
				'type': 'number'
			})

			$('#sunroof').attr({
				'placeholder' : 'Nhập loại cửa sổ trời',
				'required' : 'required'
			})

			$('#sunshade').attr({
				'placeholder' : 'Nhập loại che nắng',
				'required' : 'required'
			})

			$('#cupHolder').attr({
				'placeholder' : 'Nhập loại hộc đựng cốc',
				'required' : 'required'
			})

			$('#speakerType').attr({
				'placeholder' : 'Nhập loại loa',
				'required' : 'required'
			})

			$('#dics').attr({
				'placeholder' : 'Nhập loại đầu đĩa',
				'required' : 'required'
			})

			$('#numberSpeaker').attr({
				'placeholder' : 'Nhập số lượng loa',
				'required' : 'required'
			})

			$('#airbag').attr({
				'placeholder' : 'Nhập loại túi khí',
				'required' : 'required'
			})

			$('#usb').attr({
				'placeholder' : 'Cổng kết nối USB',
				'required' : 'required'
			})

			$('#bluetooth').attr({
				'placeholder' : 'Cổng kết nối Bluetooth',
				'required' : 'required'
			})

			$('#electronicStabilityControl').attr({
				'placeholder' : 'Nhập thông tin hệ thống cân bằng điện tử',
				'required' : 'required'
			})

			$('#brakelight').attr({
				'placeholder' : 'Nhập loại đèn báo phanh khẩn cấp',
				'required' : 'required'
			})

			$('#childSafetyLock').attr({
				'placeholder' : 'Nhập Loại khoá an toàn cho trẻ em',
				'required' : 'required'
			})

			$('#seatBelt').attr({
				'placeholder' : 'Nhập loại day an toàn',
				'required' : 'required'
			})

		})
	</script>
</body>
</html>