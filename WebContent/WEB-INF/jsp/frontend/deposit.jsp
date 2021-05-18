<%@ include file="/WEB-INF/jsp/includes.jsp"%> <%@ page pageEncoding="UTF-8"
contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>儲值</title>
    <%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
  </head>
  <body>
    <!-- Navigation -->
    <%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

    <!-- Content -->
    <div class="container py-5">
      <div class="row justify-content-center">
        <div class="col-12 col-md-5">
          <h2 class="text-center my-3">儲值</h2>
          <form class="mypanel">
            <div class="mb-3 mybox text-center">
              <label for="bank_account">銀行帳號:</label>
              <select
                class="custom-select"
                name="bank_account"
                id="bank_account"
              >
                <!--<option value="808,03113730000111">玉山銀行 00111</option>-->
              </select>
            </div>
            <div class="mb-3 mybox container">
              <div class="row">
                <ul class="col d-flex flex-row justify-content-between">
                  <li>目前餘額</li>
                  <li>NT$ <span id="current-balance">0</span></li>
                </ul>
              </div>
              <div class="row">
                <ul class="col d-flex flex-column align-items-center">
                  <li class="mb-1 align-self-start">
                    <label for="deposit_amount">儲值金額</label>
                  </li>
                  <li class="mb-1">
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text">NT$</span>
                      </div>
                      <input
                        type="number"
                        id="deposit_amount"
                        name="deposit_amount"
                        min="0"
                        max="50000"
                        value="0"
                        class="form-control"
                      />
                    </div>
                  </li>
                  <li class="mb-1">
                    <button
                      type="button"
                      value="100"
                      class="btn btn-secondary"
                      id="plus-100"
                    >
                      +100
                    </button>
                    <button
                      type="button"
                      value="1000"
                      class="btn btn-secondary"
                      id="plus-1000"
                    >
                      +1000
                    </button>
                    <button
                      type="button"
                      value="10000"
                      class="btn btn-secondary"
                      id="plus-10000"
                    >
                      +10000
                    </button>
                  </li>
                </ul>
              </div>
              <div class="row">
                <ul class="col d-flex flex-row justify-content-between">
                  <li>儲值後餘額</li>
                  <li>NT$ <span id="after-deposit-balance"></span></li>
                </ul>
              </div>
            </div>
            <div class="mb-3 mybox container text-center">
              <div class="row">
                <div class="col">
                  <img alt="玉山銀行" src="<c:url
                    value="/resources/img/esun.png"
                  />" id="bank-icon">
                  <span id="bank-name">玉山銀行</span>
                </div>
                <div class="col d-flex justify-content-center">
                  <img alt="箭頭" src="<c:url
                    value="/resources/img/arrow.png"
                  />" class="align-self-center">
                </div>
                <div class="col">
                  <img alt="您的電支帳戶" src="<c:url
                    value="/resources/img/person.jpg"
                  />">
                  <span>您的電支帳戶</span>
                </div>
              </div>
            </div>
            <div class="mb-3 d-flex justify-content-end">
              <button class="btn btn-secondary" id="deposit-btn" type="button">
                儲值
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- Footer -->
    <%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>

    <!-- ResultModal -->
    <%@ include file="/WEB-INF/jsp/frontend/resultModal.jsp"%>

    <!-- 交易密碼 -->
    <%@ include file="/WEB-INF/jsp/frontend/transactionPwModal.jsp"%>
    <script>
      initFetch();

      store.subscribe(() => {
        const state = store.getState();
        console.log(store.getState());

        if (state.e_account) {
          const {
            info: { balance },
          } = state.e_account;
          $("#current-balance").text(numberWithCommas(balance));
        }

        if (state.request) {
          $("#bank_account").empty();
          const { banks } = state.request;
          banks.forEach(({ bankCode, bankAddress }) => {
            $("#bank_account").append(
              `<option value=\${bankCode},\${bankAddress}>\${bankList[bankCode]} \${last5Address(bankAddress)}</option>`
            );
          });
        }

        if (state.response) {
          renderModalBody(
            state.response,
            ({ status, message, timestamp, bankCode, amount, balance }) => {
              return `
						儲值銀行: \${bankList[bankCode]}<br>
						儲值金額: NT\$\${numberWithCommas(amount)}<br>
						儲值後餘額: NT\$\${numberWithCommas(balance)}
					`;
            },
            () => {
              return "儲值失敗!";
            }
          );
        }
      });

      // 儲值填寫設定
      const setDepositAmount = (value) => {
        let currentBalance = parseInt(
          undoNumberWithCommas($("#current-balance").text())
        );
        let upperBound = 50000 - currentBalance;
        if (value > upperBound) {
          $("#deposit_amount").val(upperBound);
        } else {
          $("#deposit_amount").val(value);
        }
      };

      // 儲值後餘額設定
      const updateAfterDepositBalance = () => {
        let currentBalance = parseInt(
          undoNumberWithCommas($("#current-balance").text())
        );
        let amount = parseInt($("#deposit_amount").val()) + currentBalance;
        if (amount > 50000) {
          $("#after-deposit-balance").text(numberWithCommas(50000));
        } else {
          $("#after-deposit-balance").text(numberWithCommas(amount));
        }
      };

      //送出時避免input
      const loadingForm = (status) => {
        if (status) {
          $("#bank_account").attr("disabled", true);
          $("#deposit_amount").attr("disabled", true);
          $("#deposit-btn").html(
            '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>確認中...'
          );
        } else {
          $("#bank_account").attr("disabled", false);
          $("#deposit_amount").attr("disabled", false);
          $("#deposit-btn").html("儲值");
        }
      };

      //重整
      $("#resultModal").on("hidden.bs.modal", function (e) {
        location.reload();
      });

      // 按鈕
      $(document).ready(() => {
        $("#deposit_amount").change(function (e) {
          let amount = parseInt(e.target.value);
          setDepositAmount(amount);
          updateAfterDepositBalance();
        });
        $("#plus-100").click(function () {
          let amount = parseInt($("#deposit_amount").val()) + 100;
          setDepositAmount(amount);
          updateAfterDepositBalance();
        });
        $("#plus-1000").click(function () {
          let amount = parseInt($("#deposit_amount").val()) + 1000;
          setDepositAmount(amount);
          updateAfterDepositBalance();
        });
        $("#plus-10000").click(function () {
          let amount = parseInt($("#deposit_amount").val()) + 10000;
          setDepositAmount(amount);
          updateAfterDepositBalance();
        });

        // 儲值按鈕 TODO
        $("#deposit-btn").click(() => {
          let [bankCode, bankAddress] = $("#bank_account").val().split(","); //銀行代碼和帳戶
          let amount = parseInt($("#deposit_amount").val()); //儲值金額

          if (amount <= 0 || amount > 50000) {
            alert("儲值金額必須1~50000");
          } else {
            let dataJSON = {};

            dataJSON["e_account"] = store.getState().e_account
              ? store.getState().e_account.info.e_account
              : "0210000001"; //TODO 抓使用者真實的e_account
            dataJSON["bankCode"] = bankCode;
            dataJSON["bankAddress"] = bankAddress;
            dataJSON["amount"] = amount;
            dataJSON["type"] = "D";

            loadingForm(true);
            instance
              .post("/api/bank/transaction", dataJSON)
              .then((res) => {
                store.dispatch({
                  type: "SUBMIT",
                  payload: res.data,
                });

                window.setTimeout(() => loadingForm(false), 500);
                initFetch();
                updateAfterDepositBalance();
              })
              .catch((error) => {
                handleError(error.response.data);
                window.setTimeout(() => loadingForm(false), 500);
                console.log(error);
              });
          }
        });
      });

      async function initFetch() {
        try {
          //取得當前的使用者
          let res = await instance.get("/api/getCurrentUser");
          const { login } = res.data;
          if (!login) {
            location.href = `${pageContext.request.contextPath}/user/login`;
            throw new Error("尚未登入!");
          }

          const {
            info: { role },
          } = res.data;
          if (role === "S") {
            location.href = `${pageContext.request.contextPath}/`;
          }

          store.dispatch({
            type: "FETCH_USER",
            payload: res.data,
          });

          //抓取目前使用者已綁定的銀行帳號
          res = await instance.get("/api/getLinkedBank");
          if (res.data.banks.length === 0) {
            location.href = "${pageContext.request.contextPath}/bank";
          }
          store.dispatch({
            type: "FETCH",
            payload: { ...res.data },
          });

          showBankAccountIconName("${pageContext.request.contextPath}");
        } catch (error) {
          handleError(error.response.data);
          console.log(error);
        }
      }
    </script>
  </body>
</html>
