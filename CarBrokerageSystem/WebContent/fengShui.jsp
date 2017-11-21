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
                  <input type="text" name="birthday" class="input-info" onkeyup="javascript:viewMonth(birthday.value);" style="color: #000000" id="datepicker" data-date-format="dd/mm/yyyy" required>
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
                  	<html:option value="0">-- Chọn phong cách xe --</html:option>
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
                  	<html:option value="0">-- Chọn loại xe --</html:option>
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
              <h3>Ngũ hành và màu sắc</h3>
     
              <p><img src="images/PhongThuy.png" alt=""></p>

              <p><strong>I. Phong thủy:</strong></p>

              <p style="text-align: justify;">&nbsp;&nbsp;&nbsp;Phong thủy (chữ Hán:風水) là học thuyết chuyên nghiên cứu sự ảnh hưởng của hướng gió, hướng khí, mạch nước đến đời sống hoạ phúc của con người. Phong thủy không phải là yếu tố đơn lẻ mà là tổng hợp hàng loạt yếu tố về địa hình địa thế xung quanh nhà ở, thôn xóm, thành phố hoặc mồ mả, hướng gió, dòng nước cùng tọa hướng, hình dạng, bố cục mặt bằng không gian xây dựng. Phong thủy liên quan đến cát hung, họa phúc, thọ yểu, sự cùng thông của nhân sự. Cát ắt là phong thủy hợp, hung ắt là phong thủy không hợp. Sách Táng thư viết: "Mai táng phải chọn nơi có sinh khí. Kinh viết: Khí gặp gió (phong) ắt tán, gặp nước (thủy) ngăn thì dừng. Cổ nhân làm sao cho khí tụ chứ không tán, nước chảy có chỗ dừng". Do vậy mà có tên là "phong thủy". Hai chữ phong thủy còn chỉ phương pháp tìm kiếm và chọn lựa nơi trú ngụ hoặc mai táng cát tường phú quý, phúc thọ bình yên, tức là thuật Phong thủy. Giống như mọi ngành khoa học kĩ thuật cổ truyền khác ở Á Đông, thuật phong thủy cũng dựa vào dịch lí, thuyết âm dương, ngũ hành.</p>

              <p><strong>II. Ngũ hành:</strong></p>

              <p style="text-align: justify;">&nbsp;&nbsp;&nbsp;Đã từ lâu việc cưới hỏi, xây nhà, sơn nhà hay mua sắm đồ đạc dựa vào ngũ hành trở thành một việc quen thuộc. Về mặt tâm linh, những màu sắc hợp với mệnh của chủ nhân sẽ khiến bạn cảm thấy may mắn hơn, tự tin hơn và có tâm lý thoải mái hơn.Khi chọn màu sắc xe bạn cũng nên chọn những mà phù hợp với bản mệnh của bạn để đảm bảo may mắn và tài lộc sẽ đến với mình.</p>

              <p style="text-align: justify;">&nbsp;&nbsp;&nbsp;Chọn màu tương sinh với mệnh sẽ khiến bạn cảm thấy tự tin, may mắn, thoải mái thanh thản. Bản thân màu tương sinh cũng khiến bạn cảm thấy rất phù hợp.Chọn màu mà mệnh của bạn tương sinh cũng hợp lý, khiến chiếc xe bền hơn và hợp với chủ nhân.</p>

              <p style="text-align: justify;">&nbsp;&nbsp;&nbsp;&nbsp;Bạn có thể chọn màu cùng mệnh, nhưng đừng quá lạm dụng. Màu cũng mệnh sẽ khiến bạn yên ổn và an toàn nhưng nếu nhiều màu cùng mệnh quá sẽ sinh ra dư thừa, phản tác dụng.</p>

              <p style="text-align: justify;">&nbsp;&nbsp;&nbsp;Cần tránh những màu tương khắc với mệnh của bạn. Những màu tương khắc sẽ khiến sức khỏe của bạn bị ảnh hưởng, tâm trí bất định, mất tập trung, hay bực bội nóng giận, dễ gặp tai nạn hơn nếu lái xe, có thể bị thương tật.</p>

              <p><strong>III. Chọn màu xe theo quy luật ngũ hành:</strong></p>
              <p><strong>&nbsp;&nbsp;&nbsp;Mệnh Kim</strong></p>
              <p style="text-align: justify;">&nbsp;&nbsp;&nbsp;&nbsp;Những người mệnh Kim nên chọn xe màu nâu, vàng đậm. Bạn cũng có thể mua xe màu trắng, vàng nhạt, xanh nước biển. Cần cân nhắc khi mua xe màu xanh lá cây và thận trọng với màu đỏ, da cam, hồng.</p>
              <p style="text-align: justify;">&nbsp;&nbsp;&nbsp;&nbsp;Mệnh Kim gồm có các tuổi: Nhâm Thân 1932;Quý Dậu 1933;Canh Thìn 1940;Tân Tỵ 1941; Giáp Ngọ 1954; Ất Mùi 1955; Nhâm Dần 1962; Quý Mão 1963; Canh Tuất 1970; Tân Hợi 1971; Giáp Tý 1984; Ất Sửu 1985.</p>

              <p><strong>&nbsp;&nbsp;&nbsp;Mệnh Mộc</strong></p>
              <p style="text-align: justify;">&nbsp;&nbsp;&nbsp;&nbsp;Nếu bạn mệnh Mộc,bạn nên sử dụng xe có màu xanh nước biển, đen, tím. Có thể sử dụng màu xanh lá cây, nâu, đỏ, hồng, da cam và cần tránh các màu kim như bạc, trắng, vàng ánh kim.</p>
              <p style="text-align: justify;">&nbsp;&nbsp;&nbsp;&nbsp;Mệnh Mộc gồm có các tuổi: Nhâm Ngọ 194; Quý Mùi 1943; Canh Dần 1950; Tân Mão 1951; Mậu Tuất 1958 ; Kỷ Hợi 1959; Nhâm Tý 1972; Quý Sửu 1973; Canh Thân 1980 ; Tân Dậu 1981; Mậu Thìn 1988; Kỷ Tỵ 1989.</p>

              <p><strong>&nbsp;&nbsp;&nbsp;Mệnh Thủy</strong></p>
              <p style="text-align: justify;">&nbsp;&nbsp;&nbsp;&nbsp;Người mệnh Thủy nên chọn xe màu trắng, vàng nhạt. Có thể sử dụng màu cùng mệnh như xanh nước biển, đen hay màu xanh lá cây. Bạn cần tránh những màu như nâu, vàng sẫm. Màu đỏ, da cam là màu khắc xuất cũng nên thận trọng khi lựa chọn.</p>
              <p style="text-align: justify;">&nbsp;&nbsp;&nbsp;&nbsp;Mệnh Thủy có các tuổi: Bính Tý 1936; Đinh Sửu 1937;Giáp Thân 1944; Ất Dậu 1945; Nhâm Thìn 1952; Quý Tỵ 1953; Bính Ngọ 1966; Đinh Mùi 1967; Giáp Dần 1974; Ất Mão 1975;Nhâm Tuất 1982; Quý Hợi 1983.</p>

              <p><strong>&nbsp;&nbsp;&nbsp;Mệnh Hỏa</strong></p>
              <p style="text-align: justify;">&nbsp;&nbsp;&nbsp;&nbsp;Nếu bạn mệnh Hỏa nên chọn xe màu xanh lá cây. Có thể chọn xe màu da cam, đỏ, hồng cùng mệnh. Nếu bạn cảm thấy một chiếc xe màu xanh lá cây đôi khi quá nổi bật và không phù hơp, hãy chọn các màu như nâu, vàng đậm, trắng, bạc, vàng sáng. Cần tránh xe màu xanh nước biển, đen.Bạn cũng  không nên lạm dụng những màu mà mệnh của bạn khắc, hay còn gọi là khắc xuất. Những màu ấy tuy không ảnh hưởng đến bạn nhưng sẽ khiến chiếc xe của bạn không ổn định, hay hỏng hóc khó sửa chữa và khó giữ chiếc xe lâu dài.</p>
              <p style="text-align: justify;">&nbsp;&nbsp;&nbsp;&nbsp;Mệnh hỏa gồm các tuổi:Giáp Tuất 1934, Ất Hợi 1935;Mậu Tý1948,Kỷ Sửu 1949;Bính Thân 1956, Đinh Dậu 1957,Giáp Thìn 1964,Ất Tỵ 1965;Mậu Ngọ 1978, Kỷ Mùi 1979;Bính Dần 1986, Đinh Mão 1987.</p>

              <p><strong>&nbsp;&nbsp;&nbsp;Mệnh Thổ</strong></p>
              <p style="text-align: justify;">&nbsp;&nbsp;&nbsp;&nbsp;Bạn có thể chọn xe màu đỏ, da cam, hồng, hoặc xe  màu nâu, vàng đậm, vàng nhạt, bạc, trắng. Nên tránh màu xanh lá cây và nhớ đừng lạm dụng màu xanh da trời, đen.</p>
              <p style="text-align: justify;">&nbsp;&nbsp;&nbsp;&nbsp;Mệnh Thổ gồm có các tuổi:Mậu Dần 1938; Kỷ Mão 1939;Bính Tuất 1946; Đinh Hợi 1947; Canh Tý 1960; Tân Sửu 1961; Mậu Thân 1968; Kỷ Dậu 1969; Bính Thìn 1976; Đinh Tỵ 1977; Canh Ngọ 1990;Tân Mùi 1991.</p>

              <p style="text-align: justify;">&nbsp;&nbsp;&nbsp;&nbsp;Bạn nên rất trận trọng khi sử dụng các màu tương khắc với mệnh của bạn để có thể an tâm khi sử dụng xe. Dù sao, quan trọng hơn vẫn là việc tập trung khi lái xe, không sử dụng rượu bia và lái xe đúng luật, còn nếu không thì dù có sử dụng xe có màu phù hợp đến mấy bạn cũng phải nhận những hậu quả đáng tiếc.</p>

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
    $("#hr").css({
      "padding-bottom": "10px",
      "border-bottom": "1px solid #f5f5f5",
      "margin-left": "0px",
      "margin-right": "0px"
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