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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Loại xe</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
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

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">

    <section class="content-header">
      <h1>
        Danh Sách Tất Cả Loại Xe
      </h1>
      <ol class="breadcrumb">
        <li><html:link action="/manageType"><i class="fa fa-car"></i> Loại xe</html:link></li>
      </ol>
    </section>

    <section class="content">
      <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
              <div class="row">
                <div class="col-sm-6">
                </div>
                <div class="col-sm-6">
                  <html:form action="/addType" method="post">
                  
                    <div class="input-group margin">
                    <html:text property="typeCar" styleClass="form-control" styleId="styleName"></html:text>
                    <span class="input-group-btn">
                      <button type="submit" class="btn btn-info btn-flat">Thêm</button>
                    </span>
                  </div>
                  
                  <div class="margin">
                  	<p style="color: blue"><bean:write name="typeForm" property="notify"/></p>
                  </div>
                  <div class="margin">
                  	<p style="color: red"><bean:write name="typeForm" property="notifyFail"/></p>
                  </div>
                  
                  </html:form>
                </div>
              </div>
              <table id="example2" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Tên loại xe</th>
                  <th>Sửa</th>
                  <th>Xoá</th>
                </tr>
                </thead>
                <tbody>
                
                <logic:iterate name="listTypeForm" property="listTypeCar" id="listTypeCar">
                <bean:define id="typeCarID" name="listTypeCar" property="typeCarID"></bean:define>
                <bean:define id="typeCar" name="listTypeCar" property="typeCar"></bean:define>
                  <tr>
                  <td><bean:write name="listTypeCar" property="typeCar"/></td>
                  
                  <th style="text-align: center;">
                    <div class="btn-group ">
                      <a href="" title="Sửa tên loại xe" data-popup-open="popup-2" data-id="${typeCarID }" data-name="${typeCar }">
                        <i class="fa fa-edit"></i>
                      </a>
                    </div>
                  </th>
                  
                  <th style="text-align: center;">
                  	<div class="btn-group">
                      <a href="" title="Xóa loại xe" data-popup-open="popup-1" data-id="${typeCarID }" data-name="${typeCar }">
                        <i class="fa fa-trash"></i>
                      </a>
                    </div>
                  </th>
                </tr>
                </logic:iterate>
                
                </tbody>
                <tfoot>
                <tr>
                  <th>Tên loại xe</th>
                  <th>Sửa</th>
                  <th>Xoá</th>
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
						<h3 class="box-title"><p id="msg-delete"></p></h3>
					</div>
					
					<html:form action="/deleteType" method="post">
						<div>
							<html:hidden property="typeCarID" styleId="deleteStyleID"/>
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
						<h3 class="box-title">Sửa tên loại xe</h3>
					</div>

					<html:form styleClass="form-horizontal" action="/editType" method="post">
						<div class="box-body">
							<div class="form">
								<label for="editStyleName">Nhập tên loại xe:</label>
								<html:hidden property="typeCarID" styleId="editStyleCarID"/>
								<html:text property="typeCar" styleId="editStyleName" styleClass="form-control"></html:text>
							</div>
						</div>

						<div class="box-footer footer-right">
							<input type="button" class="btn btn-default" data-popup-close="popup-2" value="Hủy">
							<button type="submit" class="btn btn-info">Sửa</button>&nbsp;&nbsp; 
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
  
  $('#styleName').attr({
	  'placeholder': 'Nhập tên loại xe',
	  'required': 'required'
  });
  
  $('#editStyleName').attr({
	  'placeholder': 'Nhập tên loại xe',
	  'required': 'required'
  });
  
  $(function() {
	    //----- OPEN
	    $('[data-popup-open]').on('click', function(e)  {
	        var targeted_popup_class = jQuery(this).attr('data-popup-open');
	        var targeted_popup_data_ID = jQuery(this).attr('data-id');
	        var targeted_popup_data_name = jQuery(this).attr('data-name');
	        var deleteStyleID = document.getElementById("deleteStyleID");
	        var editStyleCarID = document.getElementById("editStyleCarID");
	        var editStyleName = document.getElementById("editStyleName");

	        $('#msg-delete').text('Bạn có muốn xóa loại xe '+targeted_popup_data_name.toUpperCase() +'?');

	        deleteStyleID.value = targeted_popup_data_ID;
	        editStyleCarID.value = targeted_popup_data_ID;
	        editStyleName.value = targeted_popup_data_name;
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