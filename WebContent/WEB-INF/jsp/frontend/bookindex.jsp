<%@ include file="/WEB-INF/jsp/includes.jsp"%> <%@ page pageEncoding="UTF-8"
contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>首頁</title>
    <%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
  </head>
  <style>
    .ball-spin-fade-loader > div {
      background-color: rgb(88, 71, 71);
    }

    .loading {
      position: relative;
    }

    .ball-spin-fade-loader {
      position: absolute;
      top: 50%;
      left: 50%;
    }
  </style>
  <body>
    <!-- Navigation -->
    <%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

    <!-- Content -->
    <div class="content_container py-5" style="height: auto; min-height: 450px">
      <div class="row mx-0 my-3">
        <div class="col-11 px-0"></div>
        <div class="col-1 px-0">
          <a class="btn btn-primary" href="bookinsert"
            ><i class="fa fa-plus"></i> 新增</a
          >
        </div>
      </div>
      <div class="row mx-0 my-3 text-center">
        <div class="col-2 px-0">ISBN</div>
        <div class="col-2 px-0">書名</div>
        <div class="col-2 px-0">作者</div>
        <div class="col-2 px-0">出版年</div>
        <div class="col-2 px-0">修改</div>
        <div class="col-2 px-0">刪除</div>
      </div>
      <div id="book_area"></div>
      <div class="loading">
        <div class="loader-inner ball-spin-fade-loader">
          <div></div>
          <div></div>
          <div></div>
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
                  <p class="h5" style="font-weight: bold">刪除成功</p>
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
      $(document)
        .ajaxStart(function () {
          $(".loader-inner").loaders();
        })
        .ajaxStop(function () {
          $(".loader-inner").hide();
        });

      $(function () {
        var requestURL = `http://172.19.35.31/Expay/api/book`;

        $.ajax({
          url: requestURL,
          type: "GET",
          dataType: "json",
          contentType: "application/json;charset=utf-8",
          success: function (returnData) {
            for (var i = 0; i < returnData.length; i++) {
              const { isbn, name, author, publish_year } = returnData[i];
              $("#book_area").append(`
				<div class="row mx-0 my-3 text-center book_item">
					<div class="col-2 px-0">\${isbn}</div>
					<div class="col-2 px-0">\${name}</div>
					<div class="col-2 px-0">\${author}</div>
					<div class="col-2 px-0">\${publish_year}</div>
					<div class="col-2 px-0">
						<button class="btn btn-warning" onclick="location.href='bookupdate/\${isbn}'"><i class="fas fa-pencil-alt"></i></button>
					</div>
					<div class="col-2 px-0">
						<button class="btn btn-danger" onclick="del(\${isbn},this)"><i class="far fa-trash-alt"></i></button>
					</div>
				</div>`);
            }
          },
          error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status);
            console.log(thrownError);
          },
        });
      });

      function del(isbn, e) {
        if (confirm("確定要刪除此本書籍？")) {
          var requestURL = `http://172.19.35.31/Expay/api/book/` + isbn;
          $.ajax({
            url: requestURL,
            type: "DELETE",
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            success: function (returnData) {
              if (returnData.status == 200) {
                $("#successModal").modal("show"); //顯示成功
                $(e).parents(".book_item").remove();
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
        }
      }
    </script>
  </body>
</html>
