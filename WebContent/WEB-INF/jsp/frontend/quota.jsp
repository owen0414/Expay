<%@ include file="/WEB-INF/jsp/includes.jsp"%> <%@ page pageEncoding="UTF-8"
contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>本月額度</title>
    <%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
  </head>
  <body>
    <!-- Navigation -->
    <%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

    <!-- Content -->
    <div class="content_container" style="height: auto; min-height: 450px">
      <!-- 本日支出 -->
      <div class="row mx-4 mx-md-2">
        <div class="col-12 col-md-5 quota_item mx-md-auto mt-4 px-0">
          <div class="row mx-3 mx-md-auto">
            <div class="col-12 font-weight-bold">
              <i class="fas fa-calendar-day font-blue mr-2"></i>本日支出
            </div>
            <div class="col-6">
              <p>已轉出</p>
              <p class="font-blue font-weight-bold">
                NT$ <span id="day_transfer"></span>
              </p>
            </div>
            <div class="col-6 text-right">
              <p>剩餘額度</p>
              <p>NT$ <span id="day_transfer_remain"></span></p>
            </div>
            <div class="col-12">
              <div class="progress">
                <div
                  class="progress-bar"
                  role="progressbar"
                  id="day_transfer_progress"
                ></div>
              </div>
            </div>
            <div class="col-6">
              <p>0</p>
            </div>
            <div class="col-6 text-right">
              <p id="day_transfer_limit1"></p>
            </div>
            <div class="col-12">
              <p>每日轉出金額上限 NT$ <span id="day_transfer_limit2"></span></p>
            </div>
          </div>
        </div>
        <!-- 本月支出-->
        <div class="col-12 col-md-5 quota_item mx-md-auto mt-4 px-0">
          <div class="row mx-3 mx-md-auto">
            <div class="col-12 font-weight-bold">
              <i class="far fa-calendar-alt font-blue mr-2"></i>本月支出
            </div>
            <div class="col-6">
              <p>已轉出</p>
              <p class="font-blue font-weight-bold">
                NT$ <span id="month_transfer"></span>
              </p>
            </div>
            <div class="col-6 text-right">
              <p>剩餘額度</p>
              <p>NT$ <span id="month_transfer_remain"></span></p>
            </div>
            <div class="col-12">
              <div class="progress">
                <div
                  class="progress-bar"
                  role="progressbar"
                  id="month_transfer_progress"
                ></div>
              </div>
            </div>
            <div class="col-6">
              <p>0</p>
            </div>
            <div class="col-6 text-right">
              <p id="month_transfer_limit1"></p>
            </div>
            <div class="col-12">
              <p>
                每月轉出金額上限 NT$ <span id="month_transfer_limit2"></span>
              </p>
            </div>
            <div class="col-12">
              <hr class="quota_hr" />
            </div>
            <div class="col-6">
              <p>已轉出 + 付款</p>
              <p class="font-blue font-weight-bold">
                NT$ <span id="month_transferAndpay"></span>
              </p>
            </div>
            <div class="col-6 text-right">
              <p>剩餘額度</p>
              <p>NT$ <span id="month_transferAndpay_remain"></span></p>
            </div>
            <div class="col-12">
              <div class="progress">
                <div
                  class="progress-bar"
                  role="progressbar"
                  id="month_transferAndpay_progress"
                ></div>
              </div>
            </div>
            <div class="col-6">
              <p>0</p>
            </div>
            <div class="col-6 text-right">
              <p id="month_transferAndpay_limit1"></p>
            </div>
            <div class="col-12">
              <p>
                每月轉出 + 付款金額上限 NT$
                <span id="month_transferAndpay_limit2"></span>
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="row mx-4 mx-md-2">
        <!-- 本月收入-->
        <div
          class="col-12 col-md-5 quota_item mx-md-auto mt-4 mb-auto mb-md-4 px-0"
        >
          <div class="row mx-3 mx-md-auto">
            <div class="col-12 font-weight-bold">
              <i class="fas fa-hand-holding-usd font-green mr-2"></i>本月收入
            </div>
            <div class="col-6">
              <p>已轉入 + 收款</p>
              <p class="font-green font-weight-bold">
                NT$ <span id="month_income"></span>
              </p>
            </div>
            <div class="col-6 text-right">
              <p>剩餘額度</p>
              <p>NT$ <span id="month_income_remain"></span></p>
            </div>
            <div class="col-12">
              <div class="progress">
                <div
                  class="progress-bar"
                  role="progressbar"
                  id="month_income_progress"
                ></div>
              </div>
            </div>
            <div class="col-6">
              <p>0</p>
            </div>
            <div class="col-6 text-right">
              <p id="month_income_limit1"></p>
            </div>
            <div class="col-12">
              <p>
                每月轉入 + 收款金額上限 NT$
                <span id="month_income_limit2"></span>
              </p>
            </div>
          </div>
        </div>
        <!-- 儲值-->
        <div class="col-12 col-md-5 quota_item mx-md-auto my-4 px-0">
          <div class="row mx-3 mx-md-auto">
            <div class="col-12 font-weight-bold">
              <i class="fas fa-dollar-sign font-green mr-2"></i>儲值額度
            </div>
            <div class="col-6">
              <p>已儲值</p>
              <p class="font-green font-weight-bold">
                NT$ <span id="account_balance"></span>
              </p>
            </div>
            <div class="col-6 text-right">
              <p>剩餘額度</p>
              <p>NT$ <span id="account_balance_remain"></span></p>
            </div>
            <div class="col-12">
              <div class="progress">
                <div
                  class="progress-bar"
                  role="progressbar"
                  id="account_balance_progress"
                ></div>
              </div>
            </div>
            <div class="col-6">
              <p>0</p>
            </div>
            <div class="col-6 text-right">
              <p id="account_balance_limit1"></p>
            </div>
            <div class="col-12">
              <p>儲值金額上限 NT$ <span id="account_balance_limit2"></span></p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Footer -->
    <%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>
    <script>
      instance.get("/api/getCurrentUser").then((res) => {
        if (!res.data.login) {
          //console.log(res);
          location.href = `${pageContext.request.contextPath}/user/login`;
        }
      });
      $(document).ready(function () {
        var requestURL = `${BASE_URL}/api/quota`;

        $.ajax({
          url: requestURL,
          type: "GET",
          dataType: "json",
          contentType: "application/json;charset=utf-8",
          success: function (returnData) {
            console.log(returnData);
            var month_transferAndpay =
              returnData.month_transfer + returnData.month_pay;

            $("#day_transfer").html(numberWithCommas(returnData.day_transfer)); //本日轉出
            $("#day_transfer_remain").html(
              numberWithCommas(
                returnData.day_transfer_limit - returnData.day_transfer
              )
            ); //本日轉出剩餘額度
            $("#day_transfer_progress").css(
              "width",
              (returnData.day_transfer / returnData.day_transfer_limit) * 100 +
                "%"
            ); //本日轉出進度條
            $("#day_transfer_limit1,#day_transfer_limit2").html(
              numberWithCommas(returnData.day_transfer_limit)
            ); //本日轉出額度

            $("#month_transfer").html(
              numberWithCommas(returnData.month_transfer)
            ); //本月轉出
            $("#month_transfer_remain").html(
              numberWithCommas(
                returnData.month_transfer_limit - returnData.month_transfer
              )
            ); //本月轉出剩餘額度
            $("#month_transfer_progress").css(
              "width",
              (returnData.month_transfer / returnData.month_transfer_limit) *
                100 +
                "%"
            ); //本月轉出進度條
            $("#month_transfer_limit1,#month_transfer_limit2").html(
              numberWithCommas(returnData.month_transfer_limit)
            ); //本月轉出額度

            $("#month_transferAndpay").html(
              numberWithCommas(month_transferAndpay)
            ); //本月轉出+付款
            $("#month_transferAndpay_remain").html(
              numberWithCommas(
                returnData.month_transferAndPay_limit - month_transferAndpay
              )
            ); //本月轉出+付款剩餘額度
            $("#month_transferAndpay_progress").css(
              "width",
              (month_transferAndpay / returnData.month_transferAndPay_limit) *
                100 +
                "%"
            ); //本月轉出+付款進度條
            $("#month_transferAndpay_limit1,#month_transferAndpay_limit2").html(
              numberWithCommas(returnData.month_transferAndPay_limit)
            ); //本月轉出+付款額度

            $("#month_income").html(numberWithCommas(returnData.month_income)); //本月收入
            $("#month_income_remain").html(
              numberWithCommas(
                returnData.month_income_limit - returnData.month_income
              )
            ); //本月收入剩餘額度
            $("#month_income_progress").css(
              "width",
              (returnData.month_income / returnData.month_income_limit) * 100 +
                "%"
            ); //本月收入進度條
            $("#month_income_limit1,#month_income_limit2").html(
              numberWithCommas(returnData.month_income_limit)
            ); //本月收入額度

            $("#account_balance").html(
              numberWithCommas(returnData.account_balance)
            ); // 帳戶餘額
            $("#account_balance_remain").html(
              numberWithCommas(
                returnData.wallet_maxLimit - returnData.account_balance
              )
            ); //儲值剩餘額度
            $("#account_balance_progress").css(
              "width",
              (returnData.account_balance / returnData.wallet_maxLimit) * 100 +
                "%"
            ); //儲值進度條
            $("#account_balance_limit1,#account_balance_limit2").html(
              numberWithCommas(returnData.wallet_maxLimit)
            ); //儲值額度
          },
          error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status);
            console.log(thrownError);
          },
        });
      });
    </script>
  </body>
</html>
