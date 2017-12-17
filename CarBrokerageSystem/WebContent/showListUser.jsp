<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="vi">
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Danh sách xe</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css">
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="css/popup.css">
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,300,400italic,500,700,100">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <jsp:include page="/navigationAdmin.jsp"></jsp:include>
  <div class="content-wrapper">

    <section class="content-header">
    
      <h1>
        Danh Sách Tất Cả Người Dùng
      </h1>
      <ol class="breadcrumb">
        <li><html:link action="/listUser"><i class="fa fa-user"></i> Danh sách người dùng</html:link></li>
      </ol>
    </section>

    <section class="content">
      <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Tên đăng nhập</th>
                  <th>Tên đầy đủ</th>
                  <th>Số điện thoại</th>
                  <th>Email</th>
                </tr>
                </thead>
                <tbody>
                <logic:iterate name="userForm" property="listUser" id="listUser">
                  <tr>
	                  <td><bean:write name="listUser" property="userName"/></td>
	                  <td><bean:write name="listUser" property="fullName"/></td>
	                  <td><bean:write name="listUser" property="phoneNumber"/></td>
	                  <td><bean:write name="listUser" property="email"/></td>
                	</tr>
                </logic:iterate>
                </tbody>
                <tfoot>
                <tr>
                  <th>Tên đăng nhập</th>
                  <th>Tên đầy đủ</th>
                  <th>Số điện thoại</th>
                  <th>Email</th>
                </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
    </section>
  </div>
  
  
  
  <jsp:include page="/footerAdmin.jsp"></jsp:include>
  
  <div class="control-sidebar-bg"></div>

</div>

<script src="bower_components/jquery/dist/jquery.min.js"></script>
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<script src="dist/js/adminlte.min.js"></script>
<script src="bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="bower_components/Chart.js/Chart.js"></script>
<script src="dist/js/pages/dashboard2.js"></script>
<script src="dist/js/demo.js"></script>
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script>
  $(function () {
	  
    $('#example1').DataTable()
    $('#example2').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    })
  });
  $(function() {
	    //----- OPEN
	    $('[data-popup-open]').on('click', function(e)  {
	        var targeted_popup_class = jQuery(this).attr('data-popup-open');
	        var targeted_popup_producerID = jQuery(this).attr('data-producer-id');
	        var targeted_popup_producer_name = jQuery(this).attr('data-car-name');
	        var producerID = document.getElementById("producerID");
	        var carID = document.getElementById("carID");

	        $('#msg-delete').text('Bạn có muốn xoá xe?');

	        producerID.value = targeted_popup_producerID;
	        carID.value = jQuery(this).attr('data-car-id');

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