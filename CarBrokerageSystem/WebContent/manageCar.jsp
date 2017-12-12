<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Danh sách xe</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css">
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
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
        Danh Sách Tất Cả Xe Của Hãng <bean:write name="listCarForm" property="producerName"/>
      </h1>
      <ol class="breadcrumb">
        <li><html:link action="/manageCar"><i class="fa fa-car"></i> Danh sách xe</html:link></li>
        <li class="active"><a href="#">TOYOTA</a></li>
      </ol>
    </section>

    <section class="content">
      <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Tên xe</th>
                  <th>Nhà sản xuất</th>
                  <th>Giá thành</th>
                  <th>Xe nổi bật</th>
                  <th>Loại xe nổi bật</th>
                  <th>Sửa</th>
                  <th>Xóa</th>
                </tr>
                </thead>
                <tbody>
                <logic:iterate name="listCarForm" property="listCar" id="listCar">
                  <tr>
	                  <td><a href="#"><bean:write name="listCar" property="carName"/></a></td>
	                  <td><bean:write name="listCar" property="producerName"/></td>
	                  <td><bean:write name="listCar" property="price"/></td>
	                  <td>A</td>
	                  <td>A</td>
	                  <th style="text-align: center;">
						<a href="">
							<i class="fa fa-edit"></i>
						</a>
	                  </th>
	                  <th style="text-align: center;">
	                  	<a href="">
	                    	<i class="fa fa-trash"></i>
	                  	</a>
	                  </th>
                	</tr>
                </logic:iterate>
                </tbody>
                <tfoot>
                <tr>
                  <th>Tên xe</th>
                  <th>Nhà sản xuất</th>
                  <th>Giá thành</th>
                  <th>Xe nổi bật</th>
                  <th>Loại xe nổi bật</th>
                  <th>Sửa</th>
                  <th>Xóa</th>
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
  })
</script>
</body>
</html>