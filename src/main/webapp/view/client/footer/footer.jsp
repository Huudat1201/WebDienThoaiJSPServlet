<%-- 
    Document   : footer
    Created on : May 5, 2020, 11:25:37 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/view/client/assets" var="url" />

<!-- footer -->
<footer id="aa-footer">
	<!-- footer bottom -->
	<div class="aa-footer-top">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="aa-footer-top-area">
						<div class="row">
							<div class="col-md-4 col-sm-6">
								<div class="aa-footer-widget">
									<a href="${pageContext.request.contextPath}/">
										<h1 style="color: white;">Smartphone16</h1>
										<h4 style="color: white;">Giá rẻ-Uy Tín-Chất Lượng</h4>
									</a>
									<ul class="aa-footer-nav">
										<li><p
												style="color: #888; text-align: justify; width: 95%">Là
												nơi chuyên buôn bán tất cả các mặt hàng về điện thoại chất
												lượng. Chúng tôi luôn đặt tiêu chí về chất lượng và uy tín
												lên hàng đầu.</p></li>
									</ul>
								</div>
							</div>
							<div class="col-md-4 col-sm-0"></div>
							<div class="col-md-4 col-sm-6">
								<div class="aa-footer-widget">
									<div class="aa-footer-widget">
										<h3>LIÊN HỆ</h3>
										<address>
											<p>Trường ĐH Sư phạm Kỹ Thuật TPHCM</p>
											<p>
												<span class="fa fa-phone"></span>0842166643
											</p>
											<p>
												<span class="fa fa-envelope"></span>Nhom16WebTrung@gmail.com
											</p>
										</address>
										<div class="aa-footer-social">
											<a href="#"><span class="fab fa-facebook"></span></a> <a
												href="#"><span class="fab fa-youtube"></span></a> <a
												href="#"><span class="fab fa-instagram"></span></a> <a
												href="#"><span class="fab fa-skype"></span></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer-bottom -->
	<div class="aa-footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="aa-footer-bottom-area">
						<p>Bản quyền thuộc nhóm 16 - Lập trình web thầy Trung</p>
						<div class="aa-footer-payment">
							<span class="fab fa-cc-mastercard"></span> <span
								class="fab fa-cc-visa"></span> <span class="fab fa-paypal"></span>
							<span class="fab fa-cc-discover"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- / footer -->

</body>
<jsp:include page="script.jsp" flush="true" />

</html>
