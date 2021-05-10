<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<nav class="navbar bg-light navbar-expand-lg navbar-light smart-scroll py-3">
  <a class="navbar-brand" href="${pageContext.request.contextPath}/">EX Pay</a>
  <button
    class="navbar-toggler"
    type="button"
    data-toggle="collapse"
    data-target="#navbarNav"
    aria-controls="navbarNav"
    abtria-expanded="false"
    aria-label="Toggle navigation"
  >
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav mr-auto"></ul>
    <ul class="navbar-nav">
      <li class="nav-item">
        <a href="${pageContext.request.contextPath}/user/login" class="nav-link"
          >登入</a
        >
      </li>
      <li class="nav-item">
        <a
          href="${pageContext.request.contextPath}/user/register"
          class="nav-link"
          >註冊</a
        >
      </li>
      <li class="nav-item">
        <a
          href="${pageContext.request.contextPath}/personalPage"
          class="nav-link"
          >個人頁面</a
        >
      </li>
      <li class="nav-item">
        <a class="nav-link" style="cursor: pointer;" data-toggle="modal" data-target="#paymentNotificationModal">待收款通知</a>
      </li>
      <li class="nav-item">
        <a
          href="${pageContext.request.contextPath}/user/logout"
          class="nav-link"
          >登出</a
        >
      </li>
    </ul>
  </div>
</nav>
