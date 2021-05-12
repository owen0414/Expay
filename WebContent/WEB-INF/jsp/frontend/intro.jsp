<%@ include file="/WEB-INF/jsp/includes.jsp"%> <%@ page pageEncoding="UTF-8"
contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>介紹</title>
    <%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
  </head>
  <body>
    <!-- Navigation -->
    <%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

    <!-- Content -->
    <div class="call-to-action">
      <div class="shadow"></div>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-8 col-12">
            <h2>新時代行動支付</h2>
            <p>Expay值得您擁有</p>
            <button class="btn btn-primary">去了解</button>
          </div>
        </div>
      </div>
    </div>
    
    <div class="call-to-action cta2">
      <div class="shadow"></div>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-8 col-12">
            <h2>搭上時尚最潮的電子支付</h2>
            <p>Fintech最新時尚一手掌握</p>
            <button class="btn btn-light">去了解</button>
          </div>
        </div>
      </div>
    </div>

    <div class="advantage">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-8 col-12">
            <h2>優勢</h2>
          </div>
        </div>
        <div class="row justify-content-center text-center">
          <div class="col-md-4 col-12">
            <i class="far fa-thumbs-up fa-7x"></i>
            <h3>方便</h3>
            <p>我們的服務講求方便，讓使用者用得開心。</p>
          </div>
          <div class="col-md-4 col-12">
            <i class="fas fa-fighter-jet fa-7x"></i>
            <h3>快速</h3>
            <p>時間就是金錢，快速收付就是贏。</p>
          </div>
          <div class="col-md-4 col-12">
            <i class="fas fa-user-ninja fa-7x"></i>
            <h3>潮流</h3>
            <p>電子支付就是夯，來用我們準沒錯。</p>
          </div>
        </div>
      </div>
    </div>

    <div class="compare-table">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-8 col-12">
            <h2>比較</h2>
            <table class="table">
              <thead class="thead-dark">
                <tr>
                  <th scope="col">項目</th>
                  <th scope="col">Expay(我們)</th>
                  <th scope="col">LXNE電支</th>
                  <th scope="col">街O電支</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td scope="row">儲值、提領</td>
                  <td>V</td>
                  <td>V</td>
                  <td>V</td>
                </tr>
                <tr>
                  <td scope="row">轉帳</td>
                  <td>V</td>
                  <td>V</td>
                  <td>V</td>
                </tr>
                <tr>
                  <td scope="row">付款、收款</td>
                  <td>V</td>
                  <td>V</td>
                  <td>V</td>
                </tr>
                <tr>
                  <td scope="row">綁定銀行帳號</td>
                  <td>V</td>
                  <td>V</td>
                  <td>V</td>
                </tr>
                <tr>
                  <td scope="row">輕鬆開戶</td>
                  <td>V</td>
                  <td>X</td>
                  <td>X</td>
                </tr>
                <tr>
                  <td scope="row">銀行體系</td>
                  <td>V</td>
                  <td>X</td>
                  <td>X</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <div class="contact-us">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-8 col-12">
            <h2>聯繫我們</h2>
            <form action="" class="mybox">
              <div class="mb-2">
                <label for="fullname">姓名:</label>
                <input type="text" name="fullname" id="fullname" class="form-control" placeholder="您的大名">
              </div>
              <div class="mb-2">
                <label for="email">Email:</label>
                <input type="email" name="email" id="email" class="form-control" placeholder="user@example">
              </div>
              <div class="mb-2">
                <label for="phone">手機:</label>
                <input type="text" name="phone" id="phone" class="form-control" placeholder="09xxxxxxxx">
              </div>
              <div class="mb-2">
                <label for="description">詳細說明:</label>
                <textarea name="description" id="description" rows="10" class="form-control" placeholder="詳細填寫您的問題"></textarea>
              </div>
              <div class="mb-2 text-right">
                <button type="button" class="btn btn-primary">聯繫</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <!-- Footer -->
    <%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>
    <style>
      .call-to-action{
      	display: flex;
      	align-items: center;
        color: #fff;
        position: relative;
        margin-top: 40px;
        background: url("${pageContext.request.contextPath}/resources/img/cta-bg.jpg") #0a2279;
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        min-height: 600px;
      }
      
      .call-to-action h2{
      	font-size: 40px;
      	margin-bottom: 10px;
      }
      
      .call-to-action p{
      	font-size: 20px;
      	margin-bottom: 10px;
      }

      .shadow{
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        background: rgba(0,0,0,0.2);
        min-height: 600px;
      }
      
      .call-to-action.cta2{
        margin-top: 0;
      	background-image: url("${pageContext.request.contextPath}/resources/img/cta2-bg.jpg");
        text-align: right;
      }

      .cta2 .shadow{
        background:rgba(0,0,0,0.35);
      }

      .advantage{
        padding: 20px 0;
      }

      .advantage h2{
        font-size: 35px;
        font-weight: bold;
        margin-bottom: 30px;
      }

      .advantage i{
        margin-bottom: 10px;
      }

      .advantage h3{
        font-size: 20px;
        margin-bottom: 10px;
      }

      .compare-table{
        padding: 20px 0;
        font-size: 20px;
      }

      .compare-table h2{
        font-size: 35px;
        font-weight: bold;
        margin-bottom: 10px;
      }

      .contact-us{
        padding: 20px 0;
      }

      .contact-us h2{
        font-size: 35px;
        font-weight: bold;
        margin-bottom: 30px;
      }

      .contact-us label{
        margin-bottom: 5px;
      }
    </style>
  </body>
</html>
