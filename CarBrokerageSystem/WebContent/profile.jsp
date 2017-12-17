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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Thông tin</title>
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
		<div class="container" style="margin-top: 10px; margin-bottom: 20px">
			<div class="row">
				
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Thông tin</h2>
						<div class="brands-name">
							<ul class="nav nav-pills nav-stacked">
								<li><html:link action="/profile">Thông tin cá nhân</html:link></li>
								<li><html:link action="/listFollowCar">Danh sách theo dõi xe</html:link></li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Thông tin cá nhân</h2>
						<html:form action="/profile" method="post">
						<div class="col-sm-9">
							<div class = "container-info table-order-car">
			            <table border="1" width="100%">
			            <bean:define id="user" name="userForm" property="user"></bean:define>
			                <tr>
			                    <td style="padding-left: 5px">Tên đăng nhập</td>
			                    <td><html:text name="user" styleId="userName" property="userName" styleClass="input-info" style="background-color: #e0e0e0" readonly="readonly"></html:text></td>
			                </tr>
			                <tr>
			                    <td style="padding-left: 5px">Tên đầy đủ</td>
			                    <td><html:text name="user" styleId="fullName" property="fullName" styleClass="input-info" ></html:text></td>
			                </tr>
			                <tr>
			                    <td style="padding-left: 5px">Số điện thoại</td>
			                    <td><html:text name="user" styleId="phoneNumber" property="phoneNumber" styleClass="input-info" ></html:text></td>
			                </tr>
			                <tr>
			                    <td style="padding-left: 5px">Email</td>
			                    <td><html:text name="user" styleId="email" property="email" styleClass="input-info" ></html:text></td>
			                </tr>
			                <tr>
			                    <td style="padding-left: 5px">Địa chỉ</td>
			                    <td><html:text name="user" styleId="address" property="address" styleClass="input-info" ></html:text></td>
			                </tr>
			            </table>
			            </div>
			            <div class = "container-info-footer" style="background-color: #FFFFFF;">
			               <button class="btn btn-default add-to-cart" style="margin: 0px 5px; width: 70px" type="submit" value="submit" name="submit" id="submit">Sửa</button>
			            </div>
						</div>
						</html:form>

					</div><!--features_items-->
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
  	  $('#hr').css({
  	    	'padding-bottom': '10px',
  	        'border-bottom': '1px solid #f5f5f5',
  	        'margin-left': '0px',
  	        'margin-right': '0px'
  	    })
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
	
	</script>
</body>
</html>