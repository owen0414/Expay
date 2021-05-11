<%@ include file="/WEB-INF/jsp/includes.jsp"%> <%@ page pageEncoding="UTF-8"
contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>個人資料維護</title>
    <%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
  </head>
  <body>
    <!-- Navigation -->
    <%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

    <!-- Content -->
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-12 col-md-5">
          <form class="setting-form">
            <div class="card my-3">
              <ul class="list-group list-group-flush">
                <li class="list-group-item text-center">
                  <h2>設定</h2>
                </li>
                <li
                  class="list-group-item d-flex justify-content-between align-items-center"
                >
                  <label for="name" class="d-block">姓名</label>
                  <input
                    type="text"
                    name="name"
                    id="name"
                    class="form-control w-auto"
                    value="彭小翔"
                    readonly="readonly"
                  />
                </li>
                <li
                  class="list-group-item d-flex justify-content-between align-items-center"
                >
                  <label for="phone" class="d-block">手機</label>
                  <input
                    type="tel"
                    name="phone"
                    id="phone"
                    maxlength="10"
                    pattern="09[0-9]{8}"
                    class="form-control w-auto"
                  />
                </li>
                <li
                  class="list-group-item d-flex justify-content-between align-items-center"
                >
                  <label for="email" class="d-block">Email</label>
                  <input
                    type="email"
                    name="email"
                    id="email"
                    class="form-control w-auto"
                  />
                </li>
                <li
                  class="list-group-item d-flex justify-content-between align-items-center"
                >
                  <label for="birthday" class="d-block">生日</label>
                  <input
                    type="date"
                    name="birthday"
                    id="birthday"
                    class="form-control w-auto"
                  />
                </li>
                <li class="list-group-item">
                  <a href="${pageContext.request.contextPath}/updatePassword"
                    >變更密碼</a
                  >
                </li>
                <li class="list-group-item d-flex justify-content-end">
                  <button
                    type="button"
                    class="btn btn-secondary"
                    type="button"
                    id="setting-btn"
                  >
                    變更
                  </button>
                </li>
              </ul>
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- ResultModal -->
    <%@ include file="/WEB-INF/jsp/frontend/resultModal.jsp"%>

    <!-- Footer -->
    <%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>
    <script>
      initFetch();

      store.subscribe(() => {
        const state = store.getState();
        console.log(state);

        if (state.request) {
          const { name, phone, email, birthday } = state.request;
          $("#name").val(name);
          $("#phone").val(phone);
          $("#email").val(email);
          $("#birthday").val(birthday);
        }

        if (state.response) {
          renderModalBody(
            state.response,
            ({ status, message, timestamp }) => {
              return `\${message}<br>`;
            },
            ({ status, message, timestamp }) => {
              return `\${message}<br>`;
            }
          );
        }
      });
      $(document).ready(() => {
        //修改個人資料
        $("#setting-btn").click(() => {
          let dataJSON = {};
          dataJSON["e_account"] = store.getState().e_account.info.e_account;
          dataJSON["name"] = $("#name").val();
          dataJSON["phone"] = $("#phone").val();
          dataJSON["email"] = $("#email").val();
          dataJSON["birthday"] = $("#birthday").val();

          if (!checkPhone($("#phone").val())) {
            alert("手機不符格式!");
          } else if (!checkEmail($("#email").val())) {
            alert("Email不符格式!");
          } else {
            instance
              .put("/api/personalInfo/", dataJSON)
              .then((res) => {
                store.dispatch({
                  type: "SUBMIT",
                  payload: res.data,
                });

                initFetch();
              })
              .catch((error) => {
                handleError(error.response.data);
                console.log(error);
              });
          }
        });
      });

      async function initFetch() {
        try {
          //取得目前的使用者
          let res = await instance.get("/api/getCurrentUser");
          const { login } = res.data;
          if (!login) {
            location.href = `${pageContext.request.contextPath}/user/login`;
            throw new Error("尚未登入!");
          }

          store.dispatch({
            type: "FETCH_USER",
            payload: res.data,
          });

          //取得個人資料
          res = await instance.get("/api/personalInfo/");
          store.dispatch({
            type: "FETCH",
            payload: res.data,
          });
        } catch (error) {
          handleError(error.response.data);
          console.log(error);
        }
      }
    </script>
  </body>
</html>
