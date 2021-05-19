<%@ include file="/WEB-INF/jsp/includes.jsp"%> <%@ page pageEncoding="UTF-8"
contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>登入</title>
    <%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
  </head>
  <body>
    <!-- Navigation -->
    <%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

    <!-- Content -->
    <div class="login_container py-5">
      <div class="row mx-4 mx-md-2">
        <div
          class="
            col-12 col-md-5
            mx-md-auto
            mt-4
            px-md-0
            font-weight-bold
            text-center
          "
        >
          <h4>登入</h4>
        </div>
      </div>
      <div class="row mx-4 mx-md-2 mb-5">
        <div class="col-12 col-md-5 login_item mx-md-auto mt-4 px-0">
          <!-- 個人登入 -->
          <div id="mem_item">
            <form id="mem_login_form" method="post" autocomplete="off">
              <div class="shop_lg text-center">切換商家</div>
              <div class="row justify-content-start mt-4 mx-auto mx-md-5">
                <div class="col-12 mx-3 mx-md-5 px-md-0">身分證字號</div>
              </div>
              <div class="row justify-content-start">
                <div class="col-10 col-md-8 mt-2 mx-auto">
                  <input
                    type="text"
                    class="form-control"
                    id="identity"
                    name="identity"
                    maxlength="10"
                    placeholder="請輸入身分證字號"
                  />
                  <p class="is_error">
                    <i class="fas fa-exclamation mr-1"></i>身分證不能為空白
                  </p>
                </div>
              </div>
              <div class="row justify-content-start mt-4 mx-auto mx-md-5">
                <div class="col-12 mx-3 mx-md-5 px-md-0">密碼</div>
              </div>
              <div class="row">
                <div class="col-10 col-md-8 mt-2 mx-auto">
                  <input
                    type="password"
                    class="form-control input_password"
                    id="mem_pwd"
                    name="mem_pwd"
                    maxlength="16"
                    placeholder="請輸入密碼"
                  />
                  <i class="far fa-eye toggle_password"></i>
                  <p class="is_error">
                    <i class="fas fa-exclamation mr-1"></i>密碼不能為空白
                  </p>
                </div>
              </div>
              <div class="row justify-content-start mt-4 mx-auto mx-md-5">
                <div class="col-12 mx-3 mx-md-5 px-md-0">驗證碼</div>
              </div>
              <div class="row justify-content-start">
                <div class="col-10 col-md-8 mt-2 mx-auto">
                  <div class="row">
                    <div class="col-12 col-md-8">
                      <input
                        id="mem_captchaInput"
                        name="mem_captchaInput"
                        type="text"
                        type="text"
                        class="form-control"
                        maxlength="4"
                        placeholder="請輸入驗證碼"
                        pattern="[0-9A-Z]{4}"
                      />
                      <p class="is_error">
                        <i class="fas fa-exclamation mr-1"></i>驗證碼不能為空白
                      </p>
                      <p class="is_error">
                        <i class="fas fa-exclamation mr-1"></i>驗證碼錯誤
                      </p>
                    </div>
                    <div class="col-12 col-md-4">
                      <div>
                        <img class="captcha" />
                      </div>
                      <div class="captchaLoading d-flex justify-content-center">
                        <div
                          class="loading_spinner"
                          style="display: none"
                        ></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-center mt-2">
                <div class="col-10 col-md-8">
                  <div class="form-check form-check-inline">
                    <input
                      class="form-check-input"
                      type="checkbox"
                      id="mem_remember"
                      name="mem_remember"
                    />
                    <label class="form-check-label" for="mem_remember"
                      >保持登入狀態</label
                    >
                  </div>
                </div>
              </div>
              <div class="row justify-content-start mt-4 mx-auto mx-md-5">
                <div class="col-6 col-md-4 mx-3 mx-md-5 px-md-0">
                  <a href="#" class="forget_password">忘記密碼？</a>
                </div>
              </div>
              <div class="row justify-content-start mx-auto mb-3">
                <div class="col-10 col-md-8 mx-auto text-center">
                  <button class="btn btn_memlogin">登入</button>
                </div>
                <div class="col-10 col-md-8 mx-auto">
                  <hr class="login_hr" />
                </div>
                <div class="col-10 col-md-8 mx-auto text-center">
                  <a
                    class="btn btn_register"
                    href="${pageContext.request.contextPath}/user/register"
                    >註冊</a
                  >
                </div>
              </div>
            </form>
          </div>
          <!-- 商家登入 -->
          <div id="shop_item" style="display: none">
            <form id="shop_login_form" method="POST" autocomplete="off">
              <div class="mem_lg text-center">切換個人</div>
              <div class="row justify-content-start mt-4 mx-auto mx-md-5">
                <div class="col-12 mx-3 mx-md-5 px-md-0">帳號</div>
              </div>
              <div class="row justify-content-start">
                <div class="col-10 col-md-8 mt-2 mx-auto">
                  <input
                    type="text"
                    class="form-control"
                    id="id"
                    name="id"
                    placeholder="請輸入帳號"
                  />
                  <p class="is_error">
                    <i class="fas fa-exclamation mr-1"></i>帳號不能為空白
                  </p>
                </div>
              </div>
              <div class="row justify-content-start mt-4 mx-auto mx-md-5">
                <div class="col-12 mx-3 mx-md-5 px-md-0">密碼</div>
              </div>
              <div class="row">
                <div class="col-10 col-md-8 mt-2 mx-auto">
                  <input
                    type="password"
                    class="form-control input_password"
                    id="shop_pwd"
                    name="shop_pwd"
                    maxlength="16"
                    placeholder="請輸入密碼"
                  />
                  <i class="far fa-eye toggle_password"></i>
                  <p class="is_error">
                    <i class="fas fa-exclamation mr-1"></i>密碼不能為空白
                  </p>
                </div>
              </div>
              <div class="row justify-content-start mt-4 mx-auto mx-md-5">
                <div class="col-12 mx-3 mx-md-5 px-md-0">驗證碼</div>
              </div>
              <div class="row justify-content-start">
                <div class="col-10 col-md-8 mt-2 mx-auto">
                  <div class="row">
                    <div class="col-12 col-md-8">
                      <input
                        id="shop_captchaInput"
                        name="shop_captchaInput"
                        type="text"
                        type="text"
                        class="form-control"
                        maxlength="4"
                        placeholder="請輸入驗證碼"
                        pattern="[0-9A-Z]{4}"
                      />
                      <p class="is_error">
                        <i class="fas fa-exclamation mr-1"></i>驗證碼不能為空白
                      </p>
                      <p class="is_error">
                        <i class="fas fa-exclamation mr-1"></i>驗證碼錯誤
                      </p>
                    </div>
                    <div class="col-12 col-md-4">
                      <div>
                        <img class="captcha" />
                      </div>
                      <div class="captchaLoading d-flex justify-content-center">
                        <div
                          class="loading_spinner"
                          style="display: none"
                        ></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-center mt-2">
                <div class="col-10 col-md-8">
                  <div class="form-check form-check-inline">
                    <input
                      class="form-check-input"
                      type="checkbox"
                      id="shop_remember"
                      name="shop_remember"
                    />
                    <label class="form-check-label" for="shop_remember"
                      >保持登入狀態</label
                    >
                  </div>
                </div>
              </div>
              <div class="row justify-content-start mt-4 mx-auto mx-md-5">
                <div class="col-6 col-md-4 mx-3 mx-md-5 px-md-0">
                  <a href="#" class="forget_password">忘記密碼？</a>
                </div>
              </div>
              <div class="row justify-content-start mx-auto mb-3">
                <div class="col-10 col-md-8 mx-auto text-center">
                  <button class="btn btn_shoplogin" type="submit">登入</button>
                </div>
                <div class="col-10 col-md-8 mx-auto">
                  <hr class="login_hr" />
                </div>
                <div class="col-10 col-md-8 mx-auto text-center">
                  <a
                    class="btn btn_register"
                    href="${pageContext.request.contextPath}/user/register"
                    >註冊</a
                  >
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <!--Error Modal -->
    <div
      class="modal fade"
      id="errorModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalScrollableTitle"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalScrollableTitle">錯誤</h5>
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="row errorPage">
              <div class="col-12 d-flex justify-content-center">
                <div class="m-2 text-center">
                  <p class="h5 responseMessage" style="font-weight: bold"></p>
                </div>
              </div>
              <div class="col-12 d-flex justify-content-center">
                <div class="m-2">
                  <div class="ui-error">
                    <svg
                      viewBox="0 0 87 87"
                      version="1.1"
                      xmlns="http://www.w3.org/2000/svg"
                      xmlns:xlink="http://www.w3.org/1999/xlink"
                    >
                      <g
                        id="Page-1"
                        stroke="none"
                        stroke-width="1"
                        fill="none"
                        fill-rule="evenodd"
                      >
                        <g
                          id="Group-2"
                          transform="translate(2.000000, 2.000000)"
                        >
                          <circle
                            id="Oval-2"
                            stroke="rgba(252, 191, 191, .5)"
                            stroke-width="4"
                            cx="41.5"
                            cy="41.5"
                            r="41.5"
                          ></circle>
                          <circle
                            class="ui-error-circle"
                            stroke="#F74444"
                            stroke-width="4"
                            cx="41.5"
                            cy="41.5"
                            r="41.5"
                          ></circle>
                          <path
                            class="ui-error-line1"
                            d="M22.244224,22 L60.4279902,60.1837662"
                            id="Line"
                            stroke="#F74444"
                            stroke-width="3"
                            stroke-linecap="square"
                          ></path>
                          <path
                            class="ui-error-line2"
                            d="M60.755776,21 L23.244224,59.8443492"
                            id="Line"
                            stroke="#F74444"
                            stroke-width="3"
                            stroke-linecap="square"
                          ></path>
                        </g>
                      </g>
                    </svg>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer"></div>
        </div>
      </div>
    </div>

    <!-- Footer -->
    <%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>
    <script>
      //查看密碼
      $(".toggle_password").click(function () {
        $(this).toggleClass("fa-eye-slash");
        var input = $(".input_password");
        if (input.attr("type") == "password") {
          input.attr("type", "text");
        } else {
          input.attr("type", "password");
        }
      });

      //切換商家
      $(".shop_lg").click(function () {
        $("#mem_item").hide();
        $("#shop_item").show();
        $(".toggle_password").removeClass("fa-eye-slash");
        $(".input_password").attr("type", "password");
        $("#mem_login_form")[0].reset();
      });

      //切換會員
      $(".mem_lg").click(function () {
        $("#shop_item").hide();
        $("#mem_item").show();
        $(".toggle_password").removeClass("fa-eye-slash");
        $(".input_password").attr("type", "password");
        $("#shop_login_form")[0].reset();
      });

      //登入失敗的提示

      function failInit() {
        $("#errorModal").modal("show");
        $(".fadeIn").fadeIn(1000);
      }

      //會員登入

      $("#mem_login_form").submit(async function (e) {
        e.preventDefault();
        var identity = $("#identity");
        var password = $("#mem_pwd");
        var captcha = $("#mem_captchaInput");
        var result = true;

        //檢查身分證有沒有填

        if (identity.val().length < 1) {
          identity.next(".is_error").show();
          result = result && false;
        } else {
          identity.next(".is_error").hide();
          result = result && true;
        }

        //檢查密碼有沒有填

        if (password.val().length < 1) {
          password.siblings(".is_error").show();
          result = result && false;
        } else {
          password.siblings(".is_error").hide();
          result = result && true;
        }

        //檢查驗證碼

        captcha.siblings(".is_error").hide();

        if (captcha.val().length < 1) {
          captcha.siblings(".is_error").eq(0).show();
          result = result && false;
        } else if (captcha.val().length == 4) {
          const valid = await checkCode(captcha.val());
          if (!valid) {
            captcha.siblings(".is_error").eq(1).show();

            result = result && false;
          } else {
            captcha.siblings(".is_error").hide();
            result = result && true;
          }
        }

        if (result) {
          var requestURL = `\${BASE_URL}/api/user/login`;
          var dataJSON = {};
          dataJSON["identity"] = identity.val();
          dataJSON["password"] = password.val();
          dataJSON["remember"] = $("#mem_remember").prop("checked");

          $.ajax({
            url: requestURL,
            data: JSON.stringify(dataJSON),
            type: "POST",
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            success: function (returnData) {
              if (returnData.status == 200) {
                instance.get("/api/getCurrentUser").then((res) => {
                  if (!res.data.t_password) {
                    location.href = `${pageContext.request.contextPath}/payment_password`;
                  } else {
                    location.href = `${pageContext.request.contextPath}/`;
                  }
                });
              } else if (returnData.status == 400) {
                $(".responseMessage").html(returnData.message);
                console.log(returnData.message);
                getCaptcha();
                failInit(); //顯示失敗
              }
            },
            error: function (xhr, ajaxOptions, thrownError) {
              console.log(xhr.status);
              console.log(thrownError);
            },
          });
        }

        return false;
      });

      //商家登入

      $("#shop_login_form").submit(async function (e) {
        e.preventDefault();
        var id = $("#id");
        var password = $("#shop_pwd");
        var captcha = $("#shop_captchaInput");
        var result = true;

        //檢查帳號有沒有填

        if (id.val().length < 1) {
          id.next(".is_error").show();
          result = result && false;
        } else {
          id.next(".is_error").hide();
          result = result && true;
        }

        //檢查密碼有沒有填

        if (password.val().length < 1) {
          password.siblings(".is_error").show();
          result = result && false;
        } else {
          password.siblings(".is_error").hide();
          result = result && true;
        }

        //檢查驗證碼

        captcha.siblings(".is_error").hide();

        if (captcha.val().length < 1) {
          captcha.siblings(".is_error").eq(0).show();
          result = result && false;
        } else if (captcha.val().length == 4) {
          const valid = await checkCode(captcha.val());
          if (!valid) {
            captcha.siblings(".is_error").eq(1).show();
            result = result && false;
          } else {
            captcha.siblings(".is_error").hide();
            result = result && true;
          }
        }

        if (result) {
          var requestURL = `\${BASE_URL}/api/shop/login`;
          var dataJSON = {};
          dataJSON["identity"] = id.val();
          dataJSON["password"] = password.val();
          dataJSON["remember"] = $("#shop_remember").prop("checked");

          $.ajax({
            url: requestURL,
            data: JSON.stringify(dataJSON),
            type: "POST",
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            success: function (returnData) {
              if (returnData.status == 200) {
                instance.get("/api/getCurrentUser").then((res) => {
                  if (!res.data.t_password) {
                    location.href = `${pageContext.request.contextPath}/payment_password`;
                  } else {
                    location.href = `${pageContext.request.contextPath}/`;
                  }
                });
              } else if (returnData.status == 400) {
                $(".responseMessage").html(returnData.message);
                console.log(returnData.message);
                getCaptcha();
                failInit(); //顯示失敗
              }
            },
            error: function (xhr, ajaxOptions, thrownError) {
              console.log(xhr.status);
              console.log(thrownError);
            },
          });
        }

        return false;
      });

      //點案圖片更換驗證碼
      $(".captcha").click(function () {
        getCaptcha();
      });

      function loadingCaptcha() {
        $(".loading_spinner").fadeIn(500);
        $(".captcha").hide(); //圖
      }

      function loadedCaptcha() {
        $(".captcha").fadeIn(300); //圖
        $(".loading_spinner").hide();
      }

      //獲取驗證碼
      function getCaptcha() {
        loadingCaptcha();
        $.ajax({
          url: BASE_URL + "api/getCode",
          xhrFields: {
            responseType: "blob",
            withCredentials: true,
          },
          crossDomain: true,
          error() {},
          success(data) {
            loadedCaptcha();
            const url = window.URL || window.webkitURL;
            const src = url.createObjectURL(data);
            $(".captchaLoading").hide();
            $(".captcha").attr("src", src);
          },
          complete() {},
        });
      }

      async function checkCode(captcha) {
        try {
          const res = await instance.get("api/checkCode/" + captcha, {
            withCredentials: true,
          });
          return res.data.valid;
        } catch (error) {
          return false;
        }
      }

      $(document).ready(function () {
        getCaptcha();
      });
    </script>
  </body>
</html>
