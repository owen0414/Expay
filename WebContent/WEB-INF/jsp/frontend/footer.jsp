<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<div class="footer text-white">
  <div class="footer_container mb-5">
    <div class="footer_title">
      <span class="h5"
        >Copyright &copy; 2021 Expay Inc. All right reserved.</span
      >
    </div>
  </div>
  <div class="container">
    <div
      class="row justify-content-center text-center"
      style="color: rgb(219, 215, 215); font-weight: 200"
    >
      <div class="col-md-12 col-12 p-3">
        <h5>聯絡我們</h5>
        <p class="mb-2">service@expay.esunbank.com</p>
        <p>(02)12345678</p>
      </div>
      <div class="col-md-12 col-12 p-3">
        <h5>地址</h5>
        <p>新北市三重區中興北街42巷17弄10號</p>
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.5234354497466!2d121.46615421498812!3d25.050242143794183!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442a8f549eecb67%3A0x875350cf6e0e5d5e!2zMjQx5paw5YyX5biC5LiJ6YeN5Y2A5Lit6IiI5YyX6KGXNDLlt7cxN-W8hDEw6Jmf!5e0!3m2!1szh-TW!2stw!4v1621999002796!5m2!1szh-TW!2stw"
          width="450"
          height="300"
          style="border: 0"
          allowfullscreen=""
          loading="lazy"
        ></iframe>
      </div>
      <div class="col-md-12 col-12 p-3">
        <h5>技術支持</h5>
        <img src="<c:url value="/resources/img/esun2.jpg" />" width="100px" />
      </div>
    </div>
  </div>
</div>

<!-- PaymentNotification -->
<%@ include file="/WEB-INF/jsp/frontend/paymentNotificationModal.jsp"%>
<style>
  .footer h3 {
    font-size: 20px;
    margin-bottom: 10px;
  }
</style>
