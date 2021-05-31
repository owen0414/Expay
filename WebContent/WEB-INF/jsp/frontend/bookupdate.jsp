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
          <form id="update_form" method="post">
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
                <h4>修改資料</h4>
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
                  readonly
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

    <!-- Footer -->
    <%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>
    <script>
      $(function () {
        //取參數
        var ary = location.href.split("/");
        var result = ary[ary.length - 1];
        var requestURL = `http://172.19.35.31/Expay/api/book/` + result;

        $.ajax({
          url: requestURL,
          type: "GET",
          dataType: "json",
          contentType: "application/json;charset=utf-8",
          success: function (returnData) {
            $("#isbn").val(returnData.isbn);
            $("#bookname").val(returnData.name);
            $("#author").val(returnData.author);
            $("#publish_year").val(returnData.publish_year);
          },
          error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status);
            console.log(thrownError);
          },
        });
      });

      $("#update_form").submit(function () {
        var isbn = $("#isbn");
        var bookname = $("#bookname");
        var author = $("#author");
        var publish_year = $("#publish_year");

        event.preventDefault();

        var requestURL = `http://172.19.35.31/Expay/api/book/` + isbn.val();

        var dataJSON = {};
        dataJSON["name"] = bookname.val();
        dataJSON["author"] = author.val();
        dataJSON["publish_year"] = publish_year.val();

        $.ajax({
          url: requestURL,
          data: JSON.stringify(dataJSON),
          type: "PATCH",
          dataType: "json",
          contentType: "application/json;charset=utf-8",
          success: function (returnData) {
            if (returnData.status == 200) {
              Swal.fire({
                icon: "success",
                title: "修改成功",
              }).then(function () {
                location.href = `${pageContext.request.contextPath}/bookindex`;
              });
            } else if (returnData.status == 400) {
              Swal.fire({
                icon: "error",
                title: "修改失敗",
              });
            }
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
