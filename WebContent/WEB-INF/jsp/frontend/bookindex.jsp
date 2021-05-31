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
        <div class="col-9 col-sm-10 px-0"></div>
        <div class="col-3 col-sm-2 px-0">
          <a class="btn btn-primary" href="bookinsert"
            ><i class="fa fa-plus"></i> 新增</a
          >
        </div>
      </div>
      <div class="table-responsive text-center mx-auto">
        <table class="table table-bordered">
          <thead>
            <tr>
              <th scope="col">ISBN</th>
              <th scope="col">書名</th>
              <th scope="col">作者</th>
              <th scope="col">出版年</th>
              <th scope="col">修改</th>
              <th scope="col">刪除</th>
            </tr>
          </thead>
          <tbody id="book_area"></tbody>
        </table>
      </div>
      <div class="loading mt-5">
        <div class="loader-inner ball-spin-fade-loader">
          <div></div>
          <div></div>
          <div></div>
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
                  <tr>
                    <td>\${isbn}</td>
                    <td>\${name}</td>
                    <td>\${author}</td>
                    <td>\${publish_year}</td>
                    <td><button class="btn btn-success" onclick="location.href='bookupdate/\${isbn}'"><i class="fas fa-pencil-alt"></i></button></td>
                    <td><button class="btn btn-danger" onclick="del(\${isbn},this)"><i class="far fa-trash-alt"></i></button></td>
                  </tr>`);
            }
          },
          error: function (xhr, textStatus, thrownError) {
            console.log(xhr.status);
            console.log(thrownError);
            $("#book_area").append(`
                  <tr>
                    <td colspan="6">查無資料</td>
                  </tr>`);
          },
        });
      });

      function del(isbn, e) {
        Swal.fire({
          title: "你確定要刪除此本書籍?",
          text: "刪除後不可復原",
          icon: "warning",
          showCancelButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "YES",
        }).then((result) => {
          if (result.isConfirmed) {
            var requestURL = `http://172.19.35.31/Expay/api/book/` + isbn;
            $.ajax({
              url: requestURL,
              type: "DELETE",
              dataType: "json",
              contentType: "application/json;charset=utf-8",
              success: function (returnData) {
                if (returnData.status == 200) {
                  Swal.fire({
                    icon: "success",
                    title: "刪除成功",
                  });
                  $(e).parents("tr").remove();
                } else if (returnData.status == 400) {
                  Swal.fire({
                    icon: "error",
                    title: "刪除失敗",
                  });
                }
              },
              error: function (xhr, textStatus, thrownError) {
                console.log(xhr.status);
                console.log(thrownError);
              },
            });
          }
        });
      }
    </script>
  </body>
</html>
