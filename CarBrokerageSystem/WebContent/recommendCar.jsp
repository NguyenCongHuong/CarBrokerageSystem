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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Phong Thủy</title>
    <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="plugins/timepicker/bootstrap-timepicker.min.css">
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
    <script language="JavaScript" src="js/amlich-hnd.js" type="text/javascript"></script>
</head>
<body>
	<!-- menu bar -->
	<jsp:include page="/navigationUser.jsp"></jsp:include>
	<!-- menu bar end -->
	
	<section>
    <div class="container">
      <div class="row">
        <div class="col-sm-3">
          <div class="left-sidebar">
            <h2>Thông tin</h2>
            <div class="panel-group category-products" id="accordian"><!--category-productsr-->

              <html:form action="/fengShui" method="post">
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h6 class="panel-title">
                    <a data-toggle="collapse">Nhập ngày tháng năm sinh:</a>
                  </h6>
                </div>
              </div>

              <div class="panel panel-default">
                <div class="panel-heading">
                  <html:text property="birthday" style="color: #000000" styleClass="input-info" styleId="datepicker" onkeyup="javascript:viewMonth(birthday.value);"></html:text>
                </div>              
              </div>
              
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h6 class="panel-title">
                    <a data-toggle="collapse">Phong cách xe:</a>
                  </h6>
                </div>
              </div>

              <div class="panel panel-default">
                <div class="panel-heading">
                  <html:select property="styleCarID">
                  	<html:option value="0">---- Chọn phong cách xe ----</html:option>
                  	<html:optionsCollection name="fengShuiForm" property="listStyleCar" label="styleCar" value="styleCarID"/>
                  </html:select>
                </div>              
              </div>

              <div class="panel panel-default">
                <div class="panel-heading">
                  <h6 class="panel-title">
                    <a data-toggle="collapse">Loại xe:</a>
                  </h6>
                </div>
              </div>

              <div class="panel panel-default">
                <div class="panel-heading">
                  <html:select property="typeCarID">
                  	<html:option value="0">---- Chọn loại xe ----</html:option>
                  	<html:optionsCollection name="fengShuiForm" property="listTypeCar" label="typeCar" value="typeCarID"/>
                  </html:select>
                </div>              
              </div>

              <div class="panel panel-default">
                <div class="panel-heading">
                  <input type="text" id="giaTri2" name ="lunarDay" class="input-info" style="color: #000000">
                </div>              
              </div>

              <div class="panel panel-default">
                <div class="panel-heading" style="text-align: center">
                  <button class="btn btn-default add-to-cart" onclick="javascript:viewMonth(birthday.value);" onmousemove="javascript:viewMonth(birthday.value);">Xem</button>
                </div>              
              </div>
              </html:form>
            </div><!--/category-products-->

          </div>
        </div>
        <div class="col-sm-9">
          <div class="blog-post-area">
            <h2 class="title text-center">Phong Thủy xe</h2>
            <div class="single-blog-post">
            	
            	<p class="justify"><strong>I. Mệnh theo ngũ hành:</strong></p>

	            <p class="justify">
	            	&nbsp;&nbsp;&nbsp;
	                Bạn sinh vào <bean:write name="fengShuiForm" property="birthday" /> dương lịch, tức vào năm <bean:write name="fengShuiForm" property="canChi" /> âm lịch.
	                Đây là năm sinh của những người mang mệnh <bean:write name="fengShuiForm" property="element" />.
	            </p>
            	
            	<p class="justify"><strong>II. Quy luật ngũ hành:</strong></p>

              	<pclass="justify">
                	&nbsp;&nbsp;&nbsp;
                	Theo ngũ hành tương sinh thì: Hỏa sinh Thổ, Thổ sinh Kim, Kim sinh Thủy, 
                	Thủy sinh Mộc, Mộc sinh Hỏa. Theo ngũ hành tương khắc: Mộc Khắc Thổ, Thổ khắc Thủy, 
                	Thủy khắc Hỏa, Hỏa khắc Kim, Kim khắc Mộc.
              	</p>
              	<pclass="justify">
                	&nbsp;&nbsp;&nbsp;
                	Ngũ hành mạng cũng có nhiều loại, nên khi dùng màu của mệnh trùng với màu của 
                	ngũ hành thì phải cân nhắc cẩn thận vì "lưỡng" hành là con dao hai lưỡi, 
                	tùy theo mạng mà đôi khi tốt, đôi khi lại xấu. 
                	Ví dụ: Lưỡng Kim thành khí, tức là tốt chỉ cho những người mạng kim nguyên thủy 
                	chưa chế biến như: Hải Trung Kim, Sa Trung Kim, Bạch Lạp Kim. 
                	Các mạng Kim khác thì lại hóa ra "lưỡng kim, kim khuyết" tức là hai kim khí 
                	chạm nhau có thể gây sứt mẻ, hư hại cho nhau. Cho nên nếu không biết chắc chắn thì 
                	tránh mặc, đeo, mang những màu cùng Mạng của mình!
              	</p>
            	
				<h4>Một số sản phẩm phù hợp với bạn:</h4>
			
			<div class="single-blog-post" style="margin-top: 10px; margin-bottom: 20px">
                  <div class="row">
                    
                    <div class="col-sm-12">
                      <div class="features_items"><!--features_items-->
                      
                      <logic:iterate name="fengShuiForm" property="listCar" id="listCar">
						<bean:define id="carImage" name="listCar" property="carImage"></bean:define>
						<bean:define id="carName" name="listCar" property="carName"></bean:define>
						<bean:define id="carID" name="listCar" property="carID"></bean:define>
                        <div class="col-sm-4">
                          <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                  <img src="${carImage }" alt="${carName }" />
                                  <h2><bean:write name="listCar" property="price"/></h2>
								  <p><bean:write name="listCar" property="carName"/></p>
                                </div>
                                <div class="product-overlay">
                                  <div class="overlay-content">
                                    <h2><bean:write name="listCar" property="price"/></h2>
									<p><bean:write name="listCar" property="carName"/></p>
									<a href="carDetails.html" class="btn btn-default add-to-cart">Xem chi tiết</a>
                                  </div>
                                </div>
                            </div>
                          </div>
                        </div>
                        </logic:iterate>
                        
                      </div><!--features_items-->
                    </div>

                    <a  class="pull-right" href="">Xem thêm>></a>

                  </div>
                </div>
			
            </div>
            
          </div>
        </div>
      </div>
    </div>
  </section>
	
	<!-- footer -->
	<jsp:include page="/footerUser.jsp"></jsp:include>
	<!-- footer end -->
	
	<script src="bower_components/jquery/dist/jquery.min.js"></script>
  <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
  <script src="plugins/input-mask/jquery.inputmask.js"></script>
  <script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
  <script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
  <script src="bower_components/moment/min/moment.min.js"></script>
  <script src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>>
  <script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
  <script src="bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
  <script src="plugins/timepicker/bootstrap-timepicker.min.js"></script>

  <script src="js/price-range.js"></script>
  <script src="js/jquery.scrollUp.min.js"></script>

  <script src="js/jquery.prettyPhoto.js"></script>
  <script src="js/main.js"></script>

  <script language="JavaScript" src="js/amlich-hnd.js" type="text/javascript"></script>
  <script>
  $(function () {
	  $('#hr').css({
	    	'padding-bottom': '10px',
	        'border-bottom': '1px solid #f5f5f5',
	        'margin-left': '0px',
	        'margin-right': '0px'
	    })
	    
	    $('#datepicker').attr({
	    	'placeholder': 'dd/mm/yyyy',
			'required': 'required',
			'data-date-format': 'dd/mm/yyyy'
	    })

    $('#datepicker').datepicker({
      autoclose: true
    })
  })

  function viewMonth(birthday) {
    var date = birthday.split("/");
    printTable(parseInt(date[0]),parseInt(date[1]),parseInt(date[2]));
  }
  function viewYear(dd,mm, yy) {
    hamTest(dd,mm,yy);
  }

</script>
</body>
</html>