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
                <bean:define id="carID" name="listCar" property="carID"></bean:define>
                <bean:define id="carName" name="listCar" property="carName"></bean:define>
                <bean:define id="producerID" name="listCar" property="producerID"></bean:define>
                  <tr>
	                  <td><a href="#"><bean:write name="listCar" property="carName"/></a></td>
	                  <td><bean:write name="listCar" property="producerName"/></td>
	                  <td><bean:write name="listCar" property="price"/></td>
	                  <td style="text-align: center;">
	                  	<logic:equal name="listCar" property="carHighlight" value="1">
							<html:link title="Nổi bật" action="/editCarHighlight?carID=${carID }&producerID=${producerID }">
								<i class="fa fa-star"></i>
							</html:link>
	                  	</logic:equal>
	                  	
	                  	<logic:notEqual name="listCar" property="carHighlight" value="1">
							<html:link title="Không nổi bật" action="/editCarHighlight?carID=${carID }&producerID=${producerID }">
								<i class="fa  fa-star-o"></i>
							</html:link>
	                  	</logic:notEqual>
	                  </td>
	                  <td style="text-align: center;">
	                  	<logic:equal name="listCar" property="typeHighlight" value="1">
							<html:link title="Nổi bật" action="/editTypeHighlight?carID=${carID }&producerID=${producerID }">
								<i class="fa fa-star"></i>
							</html:link>
	                  	</logic:equal>
	                  	
	                  	<logic:notEqual name="listCar" property="typeHighlight" value="1">
							<html:link title="Không nổi bật" action="/editTypeHighlight?carID=${carID }&producerID=${producerID }">
								<i class="fa  fa-star-o"></i>
							</html:link>
	                  	</logic:notEqual>
	                  </td>
	                  <th style="text-align: center;">
						<a href="">
							<i class="fa fa-edit"></i>
						</a>
	                  </th>
	                  <th style="text-align: center;">
	                  	<a href="" id="deleteProducer" data-popup-open="popup-1" data-producer-id="${producerID }" data-car-id="${carID }" data-car-name="${carName }">
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
  
  <div class="modal content-wrapper" data-popup="popup-1">
    <div class="row">
      <div class="col-md-3"></div>
      <div class="col-md-4">
        <div class="box box-danger">
        <html:form action="/deleteCar" method="post">
          <div class="box-header with-border">
            <h3 class="box-title"><p id="msg-delete"></p></h3>
          </div>
          
            <div>
            	<html:hidden property="carID" styleId="carID"/>
            	<html:hidden property="producerID" styleId="producerID"/>
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