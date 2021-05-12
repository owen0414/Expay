<%@ include file="/WEB-INF/jsp/includes.jsp"%> <%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>建立您的EX Pay帳戶</title>
        <%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
    </head>
    <body>
        <!-- Navigation -->
        <%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

        <!-- Content -->
        <div class="login_container py-5">
            <div class="row mx-5 mx-mb-auto">
                <div class="col-12 mx-mb-auto mt-5 px-0 text-center">
                    <h1 class="font-lightblue font-weight-bold">立即免費註冊EX Pay帳戶</h1>
                    <p class="mt-4">請選擇適合您的會員身份</p>
                </div>
            </div>
            <div class="row justify-content-center mx-4 mx-md-2 mb-5">
                <div class="col-12 col-md-3 register_item mx-md-4 mt-5 px-0">
                    <div class="row mx-3 mx-md-auto">
                        <div class="col-6 my-5 text-right">
                            <i class="fas fa-user fa-5x font-lightblue"></i>
                        </div>
                        <div class="col-6 my-5 py-2">
                            <h1 class="font-weight-bold">個人</h1>
                            <p>一般使用者</p>
                        </div>
                        <div class="col-12 mb-5">
                            <ul class="mem_ul">
                                <li class="px-5">可在實體通路或網路交易使用付款功能</li>
                                <li class="px-5">收錢 "免手續費"</li>
                            </ul>
                        </div>
                        <div class="col-8 mx-auto mb-5">
                            <a class="btn btn_memlogin" href="${pageContext.request.contextPath}/user/register/member"
                                >前往註冊</a
                            >
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-3 register_item mx-md-4 mt-5 px-0">
                    <div class="row mx-3 mx-md-auto">
                        <div class="col-6 my-5 text-right">
                            <i class="fas fa-store fa-5x font-lightgreen"></i>
                        </div>
                        <div class="col-6 my-5 py-2">
                            <h1 class="font-weight-bold">商家</h1>
                            <p>專業的賣家或商店</p>
                        </div>
                        <div class="col-12 mb-5">
                            <ul class="shop_ul">
                                <li class="px-5">專營線上銷售或實體店面的賣家或商店</li>
                                <li class="px-5">非個人，無付款功能</li>
                            </ul>
                        </div>
                        <div class="col-8 mx-auto mb-5">
                            <a class="btn btn_shoplogin" href="${pageContext.request.contextPath}/user/register/shop"
                                >前往註冊</a
                            >
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>
    </body>
</html>
