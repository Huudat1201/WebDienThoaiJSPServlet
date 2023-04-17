<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/view/client/assets" var="url"/>
  <!-- Start header section -->
  <jsp:include page = "./header/mainHeader.jsp" flush = "true" />
  
  
  <section id="aa-catg-head-banner">
   <img src="${pageContext.request.contextPath}/view/client/assets/images/list.jpg" alt="banner sản phẩm"
   style = "height: 305px;width: 1686px">
   <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Giới thiệu</h2>
        <ol class="breadcrumb">
          <li><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>      
          <li style="color:#fff">Giới thiệu</li>   
        </ol>
      </div>
     </div>
   </div>
  </section>
  <section id="aa-product-category">
    <div class="container">
      <div class="row">
      	<div>
      		<h1 style ="text-align: center; color: red;">Smartphone16</h1>
      		<p>Chúng tôi hi vọng tất cả người tiêu dùng Việt nam sẽ được sử dụng những sản phẩm chất lượng, uy tín, giá cả phải chăng tại cửa hàng cung
      		 cấp Điê thoại thông minh<strong>Smartphone16</strong>.Với sứ mệnh trở thành một trong những nhà cung cấp sản phẩm hàng đầu tại
      		 Việt Nam đưa đến người tiêu dùng loại đồ công nghệ tốt nhất của các vùng miền trên toàn quốc với mục đích là 
      		<strong>“Mang uy tín về với căn nhà của bạn”</strong>. Với quy trình lựa chọn và kiểm soát nghiêm ngặt Smartphone16 đã tạo nên quỹ đầu tư chuyên thu mua 
      		và cung cấp phân phối những sản phẩm đồ công nghệ phân phối chính hãng đến tay người tiêu dùng giúp họ có những sự trải nghiệm đáng nhớ
      		nhất trong từng khoảnh khắc.</p>
      		
      		
      	</div>
      </div>
     </div>
    </section>
    
<!--  footer-->
 <jsp:include page = "./footer/footer.jsp" flush = "true" />
<!-- end footer-->
      