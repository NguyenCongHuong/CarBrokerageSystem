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
	<title></title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css">
	<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
	<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
	<link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,300,400italic,500,700,100">
</head>
<body>
	<header class="main-header">

    <html:link action="/manageCar" styleClass="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Trang Quản Lý</b></span>
    </html:link>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-danger"><bean:write name="listCarForm" property="numberNewOrder"/></span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">Bạn có <bean:write name="listCarForm" property="numberNewOrder"/> đơn đặt hàng mới</li>
              
              <logic:iterate name="listCarForm" property="listNumberNewOrder" id="listNumberNewOrder">
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li><!-- start message -->
                  	<html:link action="/manageOrder">
                      <div class="pull-left">
                        <img src="dist/img/avatar.png" class="img-circle" alt="User Image">
                      </div>
                      <h4><bean:write name="listNumberNewOrder" property="orderer"/></h4>
                      <p><bean:write name="listNumberNewOrder" property="carName"/></p>
                    </html:link>
                  </li>
                  <!-- end message -->
                </ul>
              </li>
              </logic:iterate>
             
            </ul>
          </li>
			
		<bean:define id="user" name="userForm" property="user"></bean:define>
		<bean:define id="userName" name="user" property="userName"></bean:define>
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="dist/img/avatar5.png" class="user-image" alt="User Image">
              <span class="hidden-xs"><bean:write name="user" property="userName"/></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/avatar5.png" class="img-circle" alt="User Image">

                <p>
                  <bean:write name="user" property="fullName"/>
                  <small><bean:write name="user" property="email"/></small>
                </p>
              </li>
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Thông tin</a>
                </div>
                <div class="pull-right">
                  <html:link action="/logout" styleClass="btn btn-default btn-flat">Đăng Xuất</html:link>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>

    </nav>
  </header>
  
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/avatar5.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Người Quản Lý</p>
          <p><bean:write name="user" property="userName"/></p>
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">Chức Năng Chính</li>

        <!-- MAIN NAVIGATION 1 -->
        <li class="treeview">
          <a href="#">
            <i class="fa fa-car"></i> <span>Danh sách xe</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
			
			<logic:iterate name="listCarForm" property="listProducer" id="listProducer">
			<bean:define id="producerID" name="listProducer" property="producerID"></bean:define>
				<li class="">
            		<html:link action="/manageCar?producerID=${producerID }">
            			<i class="fa fa-circle-o"></i> 
            			<bean:write name="listProducer" property="producerName"/>
                		<span class="pull-right-container">
                  			<span class="label label-primary pull-right">
                  				<bean:write name="listProducer" property="numberCar"/>
                  			</span>
                		</span>
              		</html:link>
            	</li>
			</logic:iterate>

          </ul>
        </li>
        <!-- MAIN NAVIGATION 1 END -->
        <!-- MAIN NAVIGATION 2 -->
        <li>
          <html:link action="/manageProducer">
            <i class="fa fa-car"></i> <span>Danh sách hãng xe</span>
          </html:link>
        </li>
        <!-- MAIN NAVIGATION 2 END -->
        <!-- MAIN NAVIGATION 3 -->
        <li>
          <html:link action="/manageType">
            <i class="fa fa-car"></i> <span>Loại xe</span>
          </html:link>
        </li>
        <!-- MAIN NAVIGATION 3 END -->
        <!-- MAIN NAVIGATION 3.1 -->
        <li>
          <html:link action="/manageStyle">
            <i class="fa fa-car"></i> <span>Dòng xe</span>
          </html:link>
        </li>
        <!-- MAIN NAVIGATION 3.1 END -->
        <!-- MAIN NAVIGATION 3.2 -->
        <li>
          <html:link action="/addCar">
            <i class="fa fa-plus-square"></i> <span>Thêm xe</span>
          </html:link>
        </li>
        <!-- MAIN NAVIGATION 3.2 END -->
        <!-- MAIN NAVIGATION 4 -->
        <li>
          <html:link action="/manageOrder">
            <i class="fa fa-newspaper-o"></i>
            <span>Đơn đặt hàng</span>
            <span class="pull-right-container">
              <span class="label pull-right bg-red"><bean:write name="listCarForm" property="numberNewOrder"/></span>
            </span>
          </html:link>
        </li>
        <!-- MAIN NAVIGATION 4 END -->
         <!-- MAIN NAVIGATION 4 -->
        <li>
          <html:link action="/listUser">
            <i class="fa fa-user"></i>
            <span>Danh sách người dùng</span>
          </html:link>
        </li>
        <!-- MAIN NAVIGATION 4 END -->
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  
  
  
</body>
</html>