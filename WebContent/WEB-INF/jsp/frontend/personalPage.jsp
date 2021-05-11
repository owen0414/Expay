<%@ include file="/WEB-INF/jsp/includes.jsp"%> <%@ page pageEncoding="UTF-8"
contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>個人頁面</title>
    <%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
  </head>
  <body>
    <!-- Navigation -->
    <%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

    <!-- Content -->
    <div class="container my-3">
      <div class="row justify-content-center">
        <div class="col-12 col-md-8 d-flex justify-content-center">
          <div class="mybox text-center mr-3">
            <img src="<c:url value="/resources/img/person.jpg" />" alt="彭小翔"
            style="width: 50%;"/>
            <p id="name">彭小翔</p>
          </div>
          <div
            class="mybox d-flex flex-column justify-content-center w-25 text-center"
          >
            <p id="balance">NT$ 500</p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <hr />
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-12 col-md-8 d-flex justify-content-center">
          <ul style="list-style: disc; font-size: 28px; line-height: 1.1">
            <li>
              <a href="${pageContext.request.contextPath}/setting" id="setting">個人資料維護</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/bank">銀行帳戶管理</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/quota">本月額度</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/help">幫助</a></li>
          </ul>
        </div>
      </div>
    </div>
    <!-- Footer -->
    <%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>
    <script>
      instance.get("/api/getCurrentUser").then((res) => {
        if(!res.data.login){
            //console.log(res);
            location.href=`${pageContext.request.contextPath}/user/login`;
        } else{
          if(res.data.info.role === "M"){
            const {info: { balance, name }} = res.data;
            $("#balance").text("NT$" + balance);
            $("#name").text(name);
          } else {
            const {info: { balance, shop_name }} = res.data;
            $("#balance").text("NT$" + balance);
            $("#name").text(shop_name);
            $("#setting").attr("href", "${pageContext.request.contextPath}/shopSetting").html("商店資料維護");
          }
        }
      });
    </script>
  </body>
</html>
