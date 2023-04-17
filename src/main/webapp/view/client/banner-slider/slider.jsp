<%-- 
    Document   : slider
    Created on : May 5, 2020, 11:56:52 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/view/client/assets" var="url"/>
       <section id="aa-slider">
    <div class="aa-slider-area">
      <div id="sequence" class="seq">
        <div class="seq-screen">
          <ul class="seq-canvas">
            <!-- single slide item -->
            <li>
              <div class="seq-model">
                <img data-seq src="${url}/images/s22ultraslider.jpg" alt="S22UlTra" />
              </div>
              <div class="seq-title">
                <a data-seq href="${pageContext.request.contextPath}/view/client/product" class="aa-shop-now-btn aa-secondary-btn" 
                style = "margin-top: 300px;color: blue;padding: 12px 80px; background-color: white;">Xem Sản Phẩm</a>
              </div>
            </li>
            <!-- single slide item -->
            <li>
              <div class="seq-model">
                <img data-seq src="${url}/images/zfold4.png" alt="Wristwatch slide img" />
              </div>
              <div class="seq-title">
                <a data-seq href="${pageContext.request.contextPath}/view/client/product" class="aa-shop-now-btn aa-secondary-btn"
                style = "margin-top: 300px;color: blue;padding: 12px 80px; background-color: white;">Xem Sản Phẩm</a>
              </div>
            </li>
            <!-- single slide item -->
            <li>
              <div class="seq-model">
                <img data-seq src="${url}/images/iphone14.jpg" alt="Women Jeans slide img" />
              </div>
              <div class="seq-title">
                <a data-seq href="${pageContext.request.contextPath}/view/client/product" class="aa-shop-now-btn aa-secondary-btn" 
                style = "margin-top: 300px;color: blue;padding: 12px 80px;background-color: white;">Xem Sản Phẩm</a>
              </div>
            </li>
            <!-- single slide item -->           
            <li>
              <div class="seq-model">
                <img data-seq src="${url}/images/xiaomi12pro5g.jpg" alt="Shoes slide img" />
              </div>
              <div class="seq-title">
                <a data-seq href="${pageContext.request.contextPath}/view/client/product" class="aa-shop-now-btn aa-secondary-btn" 
                style = "margin-top: 300px;color: blue;padding: 12px 80px;background-color: white;">Xem Sản Phẩm</a>
              </div>
            </li>                   
          </ul>
        </div>
        <!-- slider navigation btn -->
        <fieldset class="seq-nav" aria-controls="sequence" aria-label="Slider buttons">
          <a type="button" class="seq-prev" aria-label="Previous" style = "color: white;background-color:blue;"><span class="fa fa-angle-left"></span></a>
          <a type="button" class="seq-next" aria-label="Next" style = "color: white;background-color:blue;"><span class="fa fa-angle-right"></span></a>
        </fieldset>
      </div>
    </div>
  </section>
