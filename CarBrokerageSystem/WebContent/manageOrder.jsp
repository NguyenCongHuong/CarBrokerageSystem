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
	<meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<title>Danh sách đơn đặt hàng</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
	<link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css">
	<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
	<link rel="stylesheet" href="css/popup.css">
	<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
	<!-- DataTables -->
	<link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,300,400italic,500,700,100">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

<jsp:include page="/navigationAdmin.jsp"></jsp:include>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">

    <section class="content-header">
      <h1>
        Danh Sách Tất Cả Đơn Đặt Hàng Xe
      </h1>
      <ol class="breadcrumb">
        <li><html:link action="/manageOrder"><i class="fa fa-newspaper-o"></i> Danh sách đơn đặt hàng</html:link></li>
      </ol>
    </section>

    <section class="content">
      <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Tên người đặt hàng</th>
                  <th>Tên xe</th>
                  <th>Số điện thoại</th>
                  <th>Thời gian đặt hàng</th>
                  <th>Gửi email</th>
                  <th>Thông tin</th>
                  <th>Xóa</th>
                </tr>
                </thead>
                <tbody>
                <logic:iterate name="listOrderForm" property="listOrder" id="listOrder">
                <bean:define id="orderID" name="listOrder" property="orderID"></bean:define>
                <bean:define id="email" name="listOrder" property="email"></bean:define>
                <bean:define id="orderer" name="listOrder" property="orderer"></bean:define>
                <bean:define id="phoneNumber" name="listOrder" property="phoneNumber"></bean:define>
                <bean:define id="address" name="listOrder" property="address"></bean:define>
                <bean:define id="orderDate" name="listOrder" property="orderDate"></bean:define>
                <bean:define id="carName" name="listOrder" property="carName"></bean:define>
                  <tr>
                  <td>
                  <logic:present name="listOrder" property="userName">
                  	<logic:equal name="listOrder" property="seen" value="1">
	                  	<bean:write name="listOrder" property="orderer"/>
	                  	<span class="pull-right badge bg-red">Mới</span>
                  	</logic:equal>
                  	
                  	<logic:notEqual name="listOrder" property="seen" value="1">
                  		<bean:write name="listOrder" property="orderer"/>
                  	</logic:notEqual>
                  </logic:present>
                  
                  <logic:notPresent name="listOrder" property="userName">
                  	<logic:equal name="listOrder" property="seen" value="1">
	                  	<a href="#"><bean:write name="listOrder" property="orderer"/>
	                  	<span class="pull-right badge bg-red">Mới</span></a>
	                </logic:equal>
	                
	                <logic:notEqual name="listOrder" property="seen" value="1">
	                	<a href="#"><bean:write name="listOrder" property="orderer"/></a>
	                </logic:notEqual>
                  </logic:notPresent>
                  </td>
                  <td><a href="#"><bean:write name="listOrder" property="carName"/></a></td>
                  <td><bean:write name="listOrder" property="phoneNumber"/></td>
                  <td><bean:write name="listOrder" property="orderDate"/></td>
                  <td style="text-align: center;">
                  	<a href="https://mail.google.com/mail/?view=cm&fs=1&to=${email }" title="Gửi email" >
                  		<i class="fa fa-envelope-o"></i>
                  	</a>
				  </td>
				  
                  <td style="text-align: center;">
                  	<a href="" title="Thông tin người đặt hàng" data-id="${orderID}" data-popup-open="popup-2" data-car-name="${carName }" data-orderer="${orderer }" data-phone-number="${phoneNumber }" data-address="${address }" data-order-date="${orderDate }" data-email="${email }">
                    	<i class="fa fa-calendar-minus-o"></i>
                    </a>
                  </td>
                  <th style="text-align: center;">
                  	<a href="" title="Xóa đơn đặt hàng" data-popup-open="popup-1" data-id="${orderID}">
                  		<i class="fa fa-trash"></i>
                    </a>
                  </th>
                </tr>
                </logic:iterate>
                </tbody>
                <tfoot>
                <tr>
                  <th>Tên người đặt hàng</th>
                  <th>Tên xe</th>
                  <th>Số điện thoại</th>
                  <th>Thời gian đặt hàng</th>
                  <th>Gửi email</th>
                  <th>Thông tin</th>
                  <th>Xóa</th>
                </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
    </section>
  </div>
  <!-- /.content-wrapper -->
	<div class="modal content-wrapper" data-popup="popup-1">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-4">
				<div class="box box-danger">
				
					<div class="box-header with-border">
						<h3 class="box-title"><p id="msg-delete-producer"></p></h3>
					</div>
					
					<html:form action="/deleteOrder" method="post">
						<div>
							<html:hidden property="orderID" styleId="deleteOrder"/>
						</div>
						<div class="box-footer footer-right">
							<input type="button" class="btn btn-default" data-popup-close="popup-1" value="Hủy">
							<button type="submit" class="btn btn-danger" >Xóa</button>&nbsp;&nbsp; 
						</div>
					</html:form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal content-wrapper" data-popup="popup-2">
    	<div class="row">
	    	<div class="col-md-3"></div>
			<div class="col-md-4">
				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">Thông tin đơn đặt hàng</h3>
					</div>
					<html:form styleClass="form-horizontal" action="/editSeen" method="post">
						<div class="box-body">
							<div class="form">
								<label for="editStyleName">Tên người đặt hàng:</label>
								<input type="text" id="orderer" class="form-control" readonly>
							</div>
							<div class="form">
								<label for="editStyleName">Tên xe:</label>
								<input type="text" id="carName" class="form-control" readonly>
							</div>
							<div class="form">
								<label for="editStyleName">Số điện thoại:</label>
								<input type="text" id="phoneNumber" class="form-control" readonly>
							</div>
							<div class="form">
								<label for="editStyleName">Email:</label>
								<input type="text" id="email" class="form-control" readonly>
							</div>
							<div class="form">
								<label for="editStyleName">Địa chỉ:</label>
								<input type="text" id="address" class="form-control" readonly>
							</div>
							<div class="form">
								<label for="editStyleName">Ngày đặt:</label>
								<input type="text" id="orderDate" class="form-control" readonly>
							</div>
						</div>

						<div class="box-footer footer-center">
							<html:hidden property="orderID" styleId="orderID"/>
							<input type="submit" class="btn btn-default" value="Hủy">
						</div>
						</html:form>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/footerAdmin.jsp"></jsp:include>

  <div class="control-sidebar-bg"></div>

</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- Sparkline -->
<script src="bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap  -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS -->
<script src="bower_components/Chart.js/Chart.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- DataTables -->
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script>

$(function () {
    $('#example1').DataTable({
      'paging'      : true,
      'lengthChange': true,
      'searching'   : true,
      'ordering'    : false,
      'info'        : true,
      'autoWidth'   : false
    })
  });
  
$(function() {
    //----- OPEN
    $('[data-popup-open]').on('click', function(e)  {
        var targeted_popup_class = jQuery(this).attr('data-popup-open');
        var targeted_popup_orderID = jQuery(this).attr('data-id');
        var deleteOrder = document.getElementById("deleteOrder");
        
        var orderer = document.getElementById("orderer");
       	var carName = document.getElementById("carName");
       	var phoneNumber = document.getElementById("phoneNumber");
       	var email = document.getElementById("email");
       	var address = document.getElementById("address");
       	var orderDate = document.getElementById("orderDate");
       	var orderID = document.getElementById("orderID");

        $('#msg-delete-producer').text('Bạn có muốn xóa đơn đặt hàng?');

        deleteOrder.value = targeted_popup_orderID;
        
        orderer.value = jQuery(this).attr('data-orderer');
        carName.value = jQuery(this).attr('data-car-name');
        phoneNumber.value = jQuery(this).attr('data-phone-number');
        email.value = jQuery(this).attr('data-email');
        address.value = jQuery(this).attr('data-address');
        orderDate.value = jQuery(this).attr('data-order-date');
        orderID.value = jQuery(this).attr('data-id');
        
        $('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);
        
        e.preventDefault();
    });
 
    //----- CLOSE
    $('[data-popup-close]').on('click', function(e)  {
        var targeted_popup_class = jQuery(this).attr('data-popup-close');
        $('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
 
        e.preventDefault();
    });
  });
  
</script>
</body>
</html>