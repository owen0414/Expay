<%@ include file="/WEB-INF/jsp/includes.jsp"%> <%@ page pageEncoding="UTF-8"
contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>首頁</title>
    <%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
  </head>
  <body>
    <!-- Navigation -->
    <%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

    <!-- Content -->
    <div class="content_container py-5" style="height: auto; min-height: 450px">
      <div class="row mx-4 mx-md-2 mb-5">
        <div class="col-12 col-md-5 register_item mx-md-auto mt-4 px-0">
          <form id="insert_form" method="post">
            <div
              class="
                row
                justify-content-start
                mt-3
                text-center
                font-weight-bold
              "
            >
              <div class="col-12">
                <h4>輸入資料</h4>
              </div>
            </div>
            <div class="row justify-content-start mt-3 mx-auto mx-md-5">
              <div
                class="
                  col-12 col-md-3
                  px-md-0
                  text-center text-md-right
                  font-weight-bold
                "
              >
                <label for="isbn">ISBN：</label>
              </div>
              <div class="col-10 col-md-8 px-md-0 mx-auto mx-md-2">
                <input
                  type="text"
                  class="form-control"
                  id="isbn"
                  name="isbn"
                  maxlength="13"
                  placeholder="請輸入ISBN"
                />
              </div>
            </div>
            <div class="row justify-content-start mt-3 mx-auto mx-md-5">
              <div
                class="
                  col-12 col-md-3
                  px-md-0
                  text-center text-md-right
                  font-weight-bold
                "
              >
                <label for="bookname">書名：</label>
              </div>
              <div class="col-10 col-md-8 px-md-0 mx-auto mx-md-2">
                <input
                  type="text"
                  class="form-control"
                  id="bookname"
                  name="bookname"
                  placeholder="請輸入書名"
                />
              </div>
            </div>
            <div class="row justify-content-start mt-3 mx-auto mx-md-5">
              <div
                class="
                  col-12 col-md-3
                  px-md-0
                  text-center text-md-right
                  font-weight-bold
                "
              >
                <label for="author">作者：</label>
              </div>
              <div class="col-10 col-md-8 px-md-0 mx-auto mx-md-2">
                <input
                  type="text"
                  class="form-control"
                  id="author"
                  name="author"
                  placeholder="請輸入作者"
                />
              </div>
            </div>
            <div class="row justify-content-start mt-3 mx-auto mx-md-5">
              <div
                class="
                  col-12 col-md-3
                  px-md-0
                  text-center text-md-right
                  font-weight-bold
                "
              >
                <label for="publish_year">出版年：</label>
              </div>
              <div class="col-10 col-md-8 px-md-0 mx-auto mx-md-2">
                <input
                  type="text"
                  class="form-control"
                  id="publish_year"
                  name="publish_year"
                  placeholder="請輸入出版年"
                />
              </div>
            </div>
            <div class="row justify-content-start my-4 mx-auto mx-md-5">
              <div class="col-10 col-md-8 mx-auto text-center">
                <button class="btn btn_memlogin">完成</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- Error Modal -->
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
            <h5 class="modal-title" id="exampleModalScrollableTitle">提示</h5>
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

    <!-- Success Modal -->
    <div
      class="modal fade"
      id="successModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalScrollableTitle"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalScrollableTitle">提示</h5>
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
            <div class="row successPage">
              <div class="col-12 d-flex justify-content-center">
                <div class="m-2 text-center">
                  <p class="h5" style="font-weight: bold">新增成功</p>
                </div>
              </div>
              <div class="col-12 d-flex justify-content-center">
                <div class="m-2">
                  <div class="success-checkmark">
                    <div class="check-icon">
                      <span class="icon-line line-tip"></span>
                      <span class="icon-line line-long"></span>
                      <div class="icon-circle"></div>
                      <div class="icon-fix"></div>
                    </div>
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
      $("#insert_form").submit(function () {
        var isbn = $("#isbn");
        var bookname = $("#bookname");
        var author = $("#author");
        var publish_year = $("#publish_year");

        event.preventDefault();

        var requestURL = `http://172.19.35.31/Expay/api/book`;

        var dataJSON = {};
        dataJSON["isbn"] = isbn.val();
        dataJSON["name"] = bookname.val();
        dataJSON["author"] = author.val();
        dataJSON["publish_year"] = publish_year.val();

        $.ajax({
          url: requestURL,
          data: JSON.stringify(dataJSON),
          type: "POST",
          dataType: "json",
          contentType: "application/json;charset=utf-8",
          success: function (returnData) {
            if (returnData.status == 200) {
              $("#successModal").modal("show"); //顯示成功
            } else if (returnData.status == 400) {
              $(".responseMessage").text(returnData.message);
              $("#errorModal").modal("show"); //顯示失敗
            }
          },
          error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status);
            console.log(thrownError);
          },
        });
      });

      $("#successModal").on("hidden.bs.modal", function (e) {
        location.href = `${pageContext.request.contextPath}/bookindex`;
      });
    </script>
  </body>
</html>
