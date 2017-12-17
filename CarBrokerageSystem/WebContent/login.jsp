<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="vi">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Đăng nhập</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<body>
	<header style="position: relative;" id="header"><!--header-->
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row" style="padding-bottom: 10px;padding-top: 10px;">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<html:link action="/home"><img src="images/home/logo-web.png" alt="" /></html:link>
						</div>
					</div>
					
					<div class="search_box pull-right">
						<input type="text" placeholder="Search"/>
					</div>

				</div>
			</div>
		</div><!--/header-middle-->
	</header><!--/header-->

	<img src="images/login/silver-mercedes-background.jpg" alt="" style="width: 100%; height: 100%; position: fixed"/>
	
	<section id="form" style="position: relative"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h1 style="color: white">Đăng nhập tài khoản!</h1>
						<html:form action="/Login" method="post">
							<input type="text" name="userName" placeholder="Tên đăng nhập" required/>
							<input type="password" name="password" placeholder="Mật khẩu" required/>
							<span style="color: red">
								<bean:write name="userForm" property="notify"/>
							</span>
							<button type="submit" class="btn btn-default">Đăng nhập</button>
						</html:form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">HOẶC</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h1 style="color: white">Đăng ký tài khoản!</h1>
						<html:form method="post" action="/signUp">
							<html:text property="userName" styleId="userName"></html:text>
							<span style="color: red">
								<bean:write name="userForm" property="notify"/>
							</span>
							<html:text property="fullName" styleId="fullName"></html:text>
							<html:password property="password" styleId="password"></html:password>
							<html:password property="comfirmPass" styleId="comfirmPass"></html:password>
							<span style="color: red">
								<bean:write name="userForm" property="notifyPass"/>
							</span>
							<html:text property="phoneNumber" styleId="phoneNumber" ></html:text>
							<html:text property="email" styleId="email"></html:text>
							<span style="color: red">
								<bean:write name="userForm" property="success"/>
							</span>
							<button type="submit" class="btn btn-default">Đăng ký</button>
						</html:form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section>
  
    <script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
    <script>
  		$(function () {

    		$('#userName').attr({
      			'placeholder': 'Tên đăng nhập',
      			'required': 'required'
    		})
    		
    		$('#fullName').attr({
      			'placeholder': 'Tên đầy đủ',
      			'required': 'required'
    		})
    		
    		$('#password').attr({
      			'placeholder': 'Mật khẩu',
      			'required': 'required'
    		})
    		
    		$('#comfirmPass').attr({
      			'placeholder': 'Xác nhận mật khẩu',
      			'required': 'required'
    		})
    		
    		$('#phoneNumber').attr({
      			'placeholder': 'Số điện thoại',
      			'required': 'required',
      			'pattern': '^\s*\(?(020[7,8]{1}\)?[ ]?[1-9]{1}[0-9{2}[ ]?[0-9]{4})|(0[1-8]{1}[0-9]{3}\)?[ ]?[1-9]{1}[0-9]{2}[ ]?[0-9]{3})\s*$'
    		})
    		
    		$('#email').attr({
      			'placeholder': 'Email',
      			'required': 'required',
      			'type': 'email'
    		})
    		
  		});
  		
  		function checkPhoneNumber() {
  			var input = document.getElementById('phoneNumber');
    		input.oninvalid = function(event) {
    		    event.target.setCustomValidity('Số điện thoại không hợp lệ!');
    		}
		}
</script>
</body>
</html>