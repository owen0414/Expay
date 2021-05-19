<%@ include file="/WEB-INF/jsp/includes.jsp"%> <%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>幫助</title>
        <%@ include file="/WEB-INF/jsp/frontend/include.jsp"%> <link rel="stylesheet" href="
        <c:url value="/resources/css/index-style.css" />
        ">
        <style>
            .btn-link:hover {
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <!-- Navigation -->
        <%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

        <!-- Content -->
        <div class="call-to-action cta-blur cta-faq">
            <div class="shadow"></div>
            <div class="cta-image" style="background-attachment: fixed"></div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-12">
                        <h2>仍有問題嗎?</h2>
                        <p>立即來查看以下我們準備好的Q&A吧!</p>
                        <a href="#accordionExample" class="btn btn-secondary">立即看</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-12 col-md-5">
                    <div class="accordion my-3" id="accordionExample">
                        <div class="card">
                            <div class="card-header">
                                <h2 class="text-center">使用說明</h2>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingRegister">
                                <h2 class="mb-0">
                                    <button
                                        class="btn btn-link btn-block text-left"
                                        type="button"
                                        data-toggle="collapse"
                                        data-target="#collapseRegister"
                                        aria-expanded="true"
                                        aria-controls="collapseOne"
                                    >
                                        <i class="fas fa-chevron-down"></i> 註冊
                                    </button>
                                </h2>
                            </div>
                            <div
                                id="collapseRegister"
                                class="collapse"
                                aria-labelledby="headingRegister"
                                data-parent="#accordionExample"
                            >
                                <div class="card-body">本系統有嚴謹的kyc審核，請照著網頁註冊步驟即可完成註冊。</div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingPay">
                                <h2 class="mb-0">
                                    <button
                                        class="btn btn-link btn-block text-left"
                                        type="button"
                                        data-toggle="collapse"
                                        data-target="#collapsePay"
                                        aria-expanded="true"
                                        aria-controls="collapseOne"
                                    >
                                        <i class="fas fa-chevron-down"></i> 支付
                                    </button>
                                </h2>
                            </div>
                            <div
                                id="collapsePay"
                                class="collapse"
                                aria-labelledby="headingPay"
                                data-parent="#accordionExample"
                            >
                                <div class="card-body">打開支付頁面，輸入商家手機以及應付的金額並按下支付即可完成!</div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingDepositAndWithdraw">
                                <h2 class="mb-0">
                                    <button
                                        class="btn btn-link btn-block text-left"
                                        type="button"
                                        data-toggle="collapse"
                                        data-target="#collapseDepositAndWithdraw"
                                        aria-expanded="true"
                                        aria-controls="collapseOne"
                                    >
                                        <i class="fas fa-chevron-down"></i> 儲值&提領
                                    </button>
                                </h2>
                            </div>
                            <div
                                id="collapseDepositAndWithdraw"
                                class="collapse"
                                aria-labelledby="headingDepositAndWithdraw"
                                data-parent="#accordionExample"
                            >
                                <div class="card-body">
                                    <ol>
                                        <li>
                                            打開儲值頁面，選擇要扣款的銀行帳號，輸入想要儲值的金額並按下儲值即可完成!
                                        </li>
                                        <li>
                                            打開提領頁面，選擇要提領的銀行帳號，輸入想要提領的金額並按下提領即可完成!
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingTransfer">
                                <h2 class="mb-0">
                                    <button
                                        class="btn btn-link btn-block text-left"
                                        type="button"
                                        data-toggle="collapse"
                                        data-target="#collapseTransfer"
                                        aria-expanded="true"
                                        aria-controls="collapseOne"
                                    >
                                        <i class="fas fa-chevron-down"></i> 轉帳
                                    </button>
                                </h2>
                            </div>
                            <div
                                id="collapseTransfer"
                                class="collapse"
                                aria-labelledby="headingTransfer"
                                data-parent="#accordionExample"
                            >
                                <div class="card-body">
                                    打開轉帳頁面，輸入收款方的手機&想要轉帳的金額並按下轉帳即可完成!
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingRecieve">
                                <h2 class="mb-0">
                                    <button
                                        class="btn btn-link btn-block text-left"
                                        type="button"
                                        data-toggle="collapse"
                                        data-target="#collapseRecieve"
                                        aria-expanded="true"
                                        aria-controls="collapseOne"
                                    >
                                        <i class="fas fa-chevron-down"></i> 收款
                                    </button>
                                </h2>
                            </div>
                            <div
                                id="collapseRecieve"
                                class="collapse"
                                aria-labelledby="headingRecieve"
                                data-parent="#accordionExample"
                            >
                                <div class="card-body">
                                    收款須知
                                    <ol>
                                        <li>單筆最多限額50000元</li>
                                        <li>至少需要在備註欄留言1字</li>
                                        <li>如果後續使用者確認轉帳後會立即進入您的電支帳戶</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>
        <script>
            //點擊換icon
            const toggleDownUp = (obj) => {
                let className = obj.attr('class');
                obj.toggleClass('fa-chevron-up');
                obj.toggleClass('fa-chevron-down');
            };
            //監聽換icon的button
            $(document).ready(() => {
                $('#headingRegister').click(() => {
                    toggleDownUp($('#headingRegister i'));
                });
                $('#headingPay').click(() => {
                    toggleDownUp($('#headingPay i'));
                });
                $('#headingDepositAndWithdraw').click(() => {
                    toggleDownUp($('#headingDepositAndWithdraw i'));
                });
                $('#headingTransfer').click(() => {
                    toggleDownUp($('#headingTransfer i'));
                });
                $('#headingRecieve').click(() => {
                    toggleDownUp($('#headingRecieve i'));
                });
            });
        </script>
    </body>
</html>
