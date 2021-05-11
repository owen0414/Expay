<%@ include file="/WEB-INF/jsp/includes.jsp"%> <%@ page pageEncoding="UTF-8"
contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>測試</title>
    <%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
  </head>
  <body>
    <!-- Navigation -->
    <%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

    <!-- Content -->
    <div class="content_container" style="height: auto; min-height: 450px">
      <div class="row mx-5 mx-sm-auto">
        <div
          class="col-12 col-sm-3 money_container mx-sm-auto mt-5 text-center"
        >
          <p
            class="mt-5 px-5"
            onclick="location.href='${pageContext.request.contextPath}/history'"
            style="cursor: pointer"
            id="balance"
          >
            NT$500
          </p>
          <div class="mt-5">
            <button
              class="btn addmoney_btn"
              onclick="location.href='${pageContext.request.contextPath}/deposit'"
              id="deposit"
            >
              儲值
            </button>
            <button
              class="btn withdraw_btn"
              onclick="location.href='${pageContext.request.contextPath}/withdraw'"
              id="withdraw"
            >
              提領
            </button>
          </div>
        </div>
        <div class="col-12 py-5 col-sm-3 py-sm-0 mt-4 mx-auto text-center">
          <button
            class="btn payment_btn mt-5"
            onclick="location.href='${pageContext.request.contextPath}/pay'"
            id="pay"
          >
            付款給商家
          </button>
          <button
            class="btn transfer_btn mt-3"
            onclick="location.href='${pageContext.request.contextPath}/transfer'"
            id="transfer"
          >
            轉帳
          </button>
          <button
            class="btn request_btn mt-3"
            onclick="location.href='${pageContext.request.contextPath}/recieve'"
            id="receive"
          >
            收款
          </button>
        </div>
      </div>
    </div>

    <!-- Footer -->
    <%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>

    <script>
      //檢查是否登入及設定交易密碼
      instance.get("/api/getCurrentUser").then((res) => {
        if (!res.data.login) {
          //console.log(res);
          location.href = `${pageContext.request.contextPath}/user/login`;
        }
        
        const { login, info: { balance, role }, t_password } = res.data;
        if (!t_password) {
          location.href = `${pageContext.request.contextPath}/payment_password`;
        } else {
          $("#balance").text("NT$" + numberWithCommas(balance));
        }

        if(role === "S"){
          $("#deposit").attr("disabled", "disabled").css("cursor", "not-allowed");
          $("#pay").attr("disabled", "disabled").css("cursor", "not-allowed");
          $("#transfer").attr("disabled", "disabled").css("cursor", "not-allowed");
          $("#receive").attr("disabled", "disabled").css("cursor", "not-allowed");
        }
      });
    </script>
  </body>
</html>
