<%@ include file="/WEB-INF/jsp/includes.jsp"%> <%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>紀錄</title>
        <%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
    </head>
    <body>
        <!-- Navigation -->
        <%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

        <!-- Content -->
        <div class="content_container">
            <div class="row mx-5 mx-sm-auto">
                <div
                    class="col-12 col-sm-3 money_container mx-sm-auto mt-5 px-0 text-center mybox"
                    style="border: none"
                >
                    <div>
                        <p class="mt-5 px-5">NT$ <span id="balance">0</span></p>
                    </div>
                </div>
            </div>
            <div class="mt-5 mx-4 mx-sm-auto">
                <div class="col-12 col-sm-6 mx-sm-auto mt-5 px-0 tab_content">
                    <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                        <a
                            class="tab_link nav-item nav-link active"
                            id="nav-transaction-tab"
                            data-toggle="tab"
                            href="#nav-transaction"
                            role="tab"
                            aria-controls="nav-transaction"
                            aria-selected="true"
                            >交易紀錄</a
                        >
                        <a
                            class="nav-item nav-link tab_link"
                            id="nav-account-tab"
                            data-toggle="tab"
                            href="#nav-account"
                            role="tab"
                            aria-controls="nav-account"
                            aria-selected="false"
                            >帳戶紀錄</a
                        >
                    </div>
                    <div class="tab-content px-5 px-sm-4" id="nav-tabContent">
                        <!-- 交易紀錄  -->
                        <div
                            class="tab-pane fade show active my-5"
                            id="nav-transaction"
                            role="tabpanel"
                            aria-labelledby="nav-transaction-tab"
                        >
                            <div class="row justify-content-start">
                                <div class="col-12 mx-auto mx-sm-5 px-0">電子帳戶</div>
                            </div>
                            <div class="row justify-content-start text-center">
                                <div class="col-12 col-sm-10 mt-3 mx-auto mx-sm-5 account_number">
                                    <span id="account"></span>
                                </div>
                            </div>
                            <div class="row justify-content-start text-center">
                                <div class="col-12 col-sm-4 mt-3 mx-sm-5 px-0">
                                    <select class="form-control">
                                        <option>最近一個月</option>
                                        <option>最近三個月</option>
                                        <option>最近一年</option>
                                    </select>
                                </div>
                            </div>
                            <div id="transaction_history_area">
                                <div class="text-center mt-3 alert alert-secondary no_trecord">
                                    <h4 class="mt-2">沒有交易紀錄</h4>
                                </div>
                            </div>
                        </div>
                        <!-- 帳戶紀錄  -->
                        <div
                            class="tab-pane fade my-5"
                            id="nav-account"
                            role="tabpanel"
                            aria-labelledby="nav-account-tab"
                        >
                            <div class="row justify-content-start text-center condition_item">
                                <div class="col-12 col-sm-4 mt-3 account_condition active" id="all_btn">全部</div>
                                <div class="col-12 col-sm-4 mt-3 account_condition" id="income_btn">收入</div>
                                <div class="col-12 col-sm-4 mt-3 account_condition" id="expenditure_btn">支出</div>
                            </div>
                            <div class="row justify-content-start text-center">
                                <div class="col-12 col-sm-4 mt-3 mx-sm-5 px-0">
                                    <select class="form-control">
                                        <option>最近一個月</option>
                                        <option>最近三個月</option>
                                        <option>最近一年</option>
                                    </select>
                                </div>
                            </div>
                            <div id="account_history_area">
                                <div class="text-center mt-3 alert alert-secondary no_brecord">
                                    <h4 class="mt-2">沒有帳戶異動紀錄</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Transaction Modal -->
        <div
            class="modal fade"
            id="transaction_modal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="transactionModalTitle"
            aria-hidden="true"
        >
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <h5 class="modal-title text-center font-weight-bold" id="transactionModalTitle">
                            交易紀錄明細
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body history_modal">
                        <div class="container-fluid">
                            <div class="col-12 font-weight-bold">
                                <h4 class="transaction_history_shopname"></h4>
                            </div>
                            <div class="col-12 mt-2">
                                <p class="transaction_history_remitter_account"></p>
                            </div>
                            <div class="col-12 mt-2">
                                <p>付款日期<span class="font-weight-bold mx-2 transaction_history_time"></span></p>
                            </div>
                            <div class="col-12 mt-2">
                                <p>
                                    交易編號<span
                                        class="font-lightblue font-weight-bold mx-2 transaction_history_code"
                                    ></span>
                                </p>
                            </div>
                            <div class="col-12 mt-2">
                                <p>
                                    訂單編號<span
                                        class="font-lightblue font-weight-bold mx-2 transaction_order_code"
                                    ></span>
                                </p>
                            </div>
                            <div class="col-12 mt-2">
                                <p>
                                    交易金額<span class="font-weight-bold mx-2"
                                        >NT$ <span class="transaction_history_amount">60</span></span
                                    >
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pay Modal -->
        <div
            class="modal fade"
            id="pay_modal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="payModalTitle"
            aria-hidden="true"
        >
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <h5 class="modal-title text-center font-weight-bold" id="payModalTitle">帳戶紀錄明細</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body pay_modal">
                        <div class="container-fluid">
                            <div class="col-12 mt-2">
                                <p>交易類別 <span class="font-weight-bold px-2">付款</span></p>
                            </div>
                            <div class="col-12 mt-2">
                                <p>交易日期 <span class="font-weight-bold px-2 pay_time"></span></p>
                            </div>
                            <div class="col-12 mt-2">
                                <p>
                                    交易編號
                                    <span class="font-lightblue font-weight-bold px-2 pay_code"></span>
                                </p>
                            </div>
                            <div class="col-12 mt-2">
                                <p>
                                    交易金額
                                    <span class="font-red font-weight-bold px-2"
                                        >NT$ <span class="pay_amount"></span
                                    ></span>
                                </p>
                            </div>
                            <hr class="transaction_hr" />
                            <div class="col-12 mt-2">
                                <p>
                                    訂單編號
                                    <span class="font-weight-bold px-2 pay_order_code"></span>
                                </p>
                            </div>
                            <div class="col-12 mt-2">
                                <p>
                                    商店名稱
                                    <span class="font-weight-bold px-2 pay_name"></span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Transfer Modal -->
        <div
            class="modal fade"
            id="transfer_modal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="transferModalTitle"
            aria-hidden="true"
        >
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <h5 class="modal-title text-center font-weight-bold" id="transferModalTitle">帳戶紀錄明細</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body transfer_modal">
                        <div class="container-fluid">
                            <div class="col-12 mt-2">
                                <p>交易類別 <span class="font-weight-bold px-2">轉帳</span></p>
                            </div>
                            <div class="col-12 mt-2">
                                <p>
                                    交易日期
                                    <span class="font-weight-bold px-2 transfer_time"></span>
                                </p>
                            </div>
                            <div class="col-12 mt-2">
                                <p>
                                    交易編號
                                    <span class="font-lightblue font-weight-bold px-2 transfer_code"></span>
                                </p>
                            </div>
                            <div class="col-12 mt-2">
                                <p>
                                    交易金額
                                    <span class="font-weight-bold px-2">NT$ <span class="transfer_amount"></span></span>
                                </p>
                            </div>
                            <hr class="transaction_hr" />
                            <div class="col-12 mt-2">
                                <p class="transfer_name"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Deposit Modal -->
        <div
            class="modal fade"
            id="account_modal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="accountModalTitle"
            aria-hidden="true"
        >
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <h5 class="modal-title text-center font-weight-bold" id="accountModalTitle">帳戶紀錄明細</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body account_modal">
                        <div class="container-fluid">
                            <div class="col-12 mt-2">
                                <p>
                                    交易類別
                                    <span class="font-weight-bold px-2 account_type"></span>
                                </p>
                            </div>
                            <div class="col-12 mt-2">
                                <p>
                                    交易日期
                                    <span class="font-weight-bold px-2 account_time"></span>
                                </p>
                            </div>
                            <div class="col-12 mt-2">
                                <p>
                                    交易編號
                                    <span class="font-lightblue font-weight-bold px-2 account_code"></span>
                                </p>
                            </div>
                            <div class="col-12 mt-2">
                                <p>
                                    交易金額
                                    <span class="font-weight-bold px-2"
                                        >NT$ <span class="account_amount">73</span></span
                                    >
                                </p>
                            </div>
                            <hr class="transaction_hr" />
                            <div class="col-12 mt-2">
                                <p>
                                    銀行名稱
                                    <span class="font-weight-bold px-2 account_bankname"></span>
                                </p>
                            </div>
                            <div class="col-12 mt-2">
                                <p>
                                    銀行帳號
                                    <span class="font-weight-bold px-2 account_bankaccount"></span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>

        <script>
            //檢查是否登入及設定交易密碼
            instance.get('/api/getCurrentUser').then((res) => {
                if (!res.data.login) {
                    //console.log(res);
                    location.href = `${pageContext.request.contextPath}/user/login`;
                }

                const {
                    login,
                    info: { e_account, balance, role, unReceiveTransaction },
                    t_password,
                } = res.data;
                if (!t_password) {
                    location.href = `${pageContext.request.contextPath}/payment_password`;
                } else {
                    $('#balance').text(numberWithCommas(balance));
                    $('#account').html(e_account);
                    $('#notification_count').text(unReceiveTransaction);
                    if (role == 'M') {
                        memberHistory();
                    } else if (role == 'S') {
                        shopHistory();
                    }
                }
            });

            $('.account_condition').click(function () {
                $(this).addClass('active');
                $(this).siblings().removeClass('active');
            });

            $('#all_btn').click(function () {
                $('#account_history_area').children('.no_brecord').hide();
                $('.account_history').show();
                if ($('.account_history:visible').length == 0) {
                    $('#account_history_area').children('.no_brecord').show();
                }
            });

            $('#income_btn').click(function () {
                $('#account_history_area').children('.no_brecord').hide();
                $('.amount').each(function (index) {
                    $('.account_history').eq(index).hide();
                    if ($(this).text().slice(0, 1) == '+') {
                        $('.account_history').eq(index).show();
                    }
                });
                if ($('.account_history:visible').length == 0) {
                    $('#account_history_area').children('.no_brecord').show();
                }
            });

            $('#expenditure_btn').click(function () {
                $('#account_history_area').children('.no_brecord').hide();
                $('.amount').each(function (index) {
                    $('.account_history').eq(index).hide();
                    if ($(this).text().slice(0, 1) == '-') {
                        $('.account_history').eq(index).show();
                    }
                });
                if ($('.account_history:visible').length == 0) {
                    $('#account_history_area').children('.no_brecord').show();
                }
            });

            //會員交易&帳戶紀錄
            function memberHistory() {
                var requestURL2 = `${BASE_URL}/api/transactionHistory`;

                $.ajax({
                    url: requestURL2,
                    type: 'GET',
                    dataType: 'json',
                    contentType: 'application/json;charset=utf-8',
                    success: function (returnData) {
                        for (var i = 0; i < returnData.length; i++) {
                            $('#transaction_history_area').children('.no_trecord').hide();
                            const { shop_name, time, amount } = returnData[i];
                            $('#transaction_history_area').append(`
             <div class="row justify-content-start" id="transaction_history_item_\${i}">
               <div class="col-12 col-sm-10 my-3 mx-auto mx-sm-5 transaction_history">
                 <div class="row">
                   <div class="col-12 col-sm-6">
                     <p>\${time}</p>
                     <p>\${shop_name}</p>
                   </div>
                   <div class="col-12 col-sm-6 text-sm-right">
                     <p>付款</p>
                     <p>NT$ <span>\${numberWithCommas(amount)}</span></p>
                   </div>
                 </div>
               </div>
             </div>`);
                            $('#transaction_history_item_' + i).click(function () {
                                $('.transaction_history_shopname').html(returnData[$(this).index() - 1].shop_name);
                                $('.transaction_history_time').html(returnData[$(this).index() - 1].time);
                                $('.transaction_history_code').html(returnData[$(this).index() - 1].transaction_code);
                                $('.transaction_order_code').html(returnData[$(this).index() - 1].order_code);
                                $('.transaction_history_amount').html(
                                    numberWithCommas(returnData[$(this).index() - 1].amount)
                                );
                                $('.transaction_history_amount').parent().removeClass('font-blue').addClass('font-red');
                                $('#transaction_modal').modal('show');
                            });
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        console.log(xhr.status);
                        console.log(thrownError);
                    },
                });

                //帳戶紀錄
                var requestURL3 = `${BASE_URL}/api/eAccountHistory`;

                $.ajax({
                    url: requestURL3,
                    type: 'GET',
                    dataType: 'json',
                    contentType: 'application/json;charset=utf-8',
                    success: async function (returnData) {
                        for (var j = 0; j < returnData.length; j++) {
                            $('#account_history_area').children('.no_brecord').hide();
                            if (returnData[j].type == 'S') {
                                returnData[j].type = '付款';
                            } else if (returnData[j].type == 'T' || returnData[j].type == 'R') {
                                returnData[j].type = '轉帳';
                                returnData[j].name = nameToStar(returnData[j].name);
                            } else if (returnData[j].type == 'D') {
                                returnData[j].type = '儲值';
                            } else if (returnData[j].type == 'W') {
                                returnData[j].type = '提領';
                            }

                            if (returnData[j].type == '轉帳' && returnData[j].amount > 0) {
                                const res = await instance.get('/api/getUserName/' + returnData[j].remitter_account);
                                returnData[j].name = nameToStar(res.data.user_name);
                            }

                            const { name, time, amount, type, transaction_code } = returnData[j];

                            $('#account_history_area').append(`
             <div class="row justify-content-start" data-transactioncode="\${transaction_code}">
               <div class="col-12 col-sm-10 my-3 mx-auto mx-sm-5 account_history">
                 <div class="row">
                   <div class="col-12 col-sm-6">
                     <p>\${time}</p>
                     <p>\${name}</p>
                   </div>
                   <div class="col-12 col-sm-6 text-sm-right">
                     <p class="type">\${type}</p>
                     <p>NT$ <span class="amount">\${numberWithCommas(amount)}</span></p>
                   </div>
                 </div>
               </div>
             </div>`);

                            if (amount < 0) {
                                $('.type').eq(j).addClass('font-red');
                                $('.amount').eq(j).parent().addClass('font-red');
                            } else {
                                $('.type').eq(j).addClass('font-blue');
                                $('.amount').eq(j).parent().addClass('font-blue');
                            }

                            if (type == '付款') {
                                $('.account_history').eq(j).parent().addClass('pay_item');
                            } else if (type == '轉帳') {
                                $('.account_history').eq(j).parent().addClass('transfer_item');
                            } else if (type == '儲值') {
                                $('.account_history').eq(j).parent().addClass('deposit_item');
                            } else if (type == '提領') {
                                $('.account_history').eq(j).parent().addClass('withdraw_item');
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        console.log(xhr.status);
                        console.log(thrownError);
                    },
                });

                $(document).on('click', '.pay_item', function () {
                    var requestURL = `${BASE_URL}/api/paymentDetail/` + $(this).data('transactioncode');

                    $.ajax({
                        url: requestURL,
                        type: 'GET',
                        dataType: 'json',
                        contentType: 'application/json;charset=utf-8',
                        success: function (returnpayData) {
                            $('.pay_time').html(returnpayData.time);
                            $('.pay_code').html(returnpayData.transaction_code);
                            $('.pay_amount').html(numberWithCommas(returnpayData.amount));
                            $('.pay_name').html(returnpayData.shop_name);
                            $('.pay_order_code').html(returnpayData.order_code);
                            $('#pay_modal').modal('show');
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            console.log(xhr.status);
                            console.log(thrownError);
                        },
                    });
                });

                $(document).on('click', '.transfer_item', function () {
                    var requestURL = `${BASE_URL}/api/transferDetail/` + $(this).data('transactioncode');

                    $.ajax({
                        url: requestURL,
                        type: 'GET',
                        dataType: 'json',
                        contentType: 'application/json;charset=utf-8',
                        success: function (returntransferData) {
                            $('.transfer_time').html(returntransferData.time);
                            $('.transfer_code').html(returntransferData.transaction_code);
                            $('.transfer_amount').html(numberWithCommas(returntransferData.amount));

                            if (returntransferData.amount < 0) {
                                $('.transfer_amount').parent().removeClass('font-blue').addClass('font-red');
                                $('.transfer_name').html(
                                    `轉入者<span class="font-weight-bold px-2">` +
                                        nameToStar(returntransferData.receiver_name) +
                                        `</span>`
                                );
                            } else if (returntransferData.amount > 0) {
                                $('.transfer_amount').parent().removeClass('font-red').addClass('font-blue');
                                $('.transfer_name').html(
                                    `轉出者<span class="font-weight-bold px-2">` +
                                        nameToStar(returntransferData.remitter_name) +
                                        `</span>`
                                );
                            }

                            $('#transfer_modal').modal('show');
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            console.log(xhr.status);
                            console.log(thrownError);
                        },
                    });
                });

                $(document).on('click', '.deposit_item,.withdraw_item', function () {
                    var requestURL = `${BASE_URL}/api/bankDetail/` + $(this).data('transactioncode');

                    $.ajax({
                        url: requestURL,
                        type: 'GET',
                        dataType: 'json',
                        contentType: 'application/json;charset=utf-8',
                        success: function (returnbankdetailData) {
                            $('.account_time').html(returnbankdetailData.time);
                            $('.account_code').html(returnbankdetailData.transaction_code);
                            $('.account_amount').html(numberWithCommas(returnbankdetailData.amount));

                            if (returnbankdetailData.type == 'D') {
                                $('.account_type').html('儲值');
                                $('.account_amount').parent().removeClass('font-red').addClass('font-blue');
                            } else if (returnbankdetailData.type == 'W') {
                                $('.account_type').html('提領');
                                $('.account_amount').parent().removeClass('font-blue').addClass('font-red');
                            }

                            $('.account_bankname').html(
                                returnbankdetailData.bank_code + '  ' + bankList[returnbankdetailData.bank_code]
                            );
                            $('.account_bankaccount').html(returnbankdetailData.bank_account);

                            $('#account_modal').modal('show');
                        },

                        error: function (xhr, ajaxOptions, thrownError) {
                            console.log(xhr.status);
                            console.log(thrownError);
                        },
                    });
                });
            }

            //商家交易&帳戶紀錄
            function shopHistory() {
                var requestURL2 = `${BASE_URL}/api/shop/transactionHistory`;

                $.ajax({
                    url: requestURL2,
                    type: 'GET',
                    dataType: 'json',
                    contentType: 'application/json;charset=utf-8',
                    success: function (returnData) {
                        for (var i = 0; i < returnData.length; i++) {
                            $('#transaction_history_area').children('.no_trecord').hide();
                            const { remitter_account, time, amount } = returnData[i];
                            $('#transaction_history_area').append(`
             <div class="row justify-content-start" id="transaction_history_item_\${i}">
               <div class="col-12 col-sm-10 my-3 mx-auto mx-sm-5 transaction_history">
                 <div class="row">
                   <div class="col-12 col-sm-6">
                     <p>\${time}</p>
                     <p>\${eAccountToStar(remitter_account)}</p>
                   </div>
                   <div class="col-12 col-sm-6 text-sm-right">
                     <p>收款</p>
                     <p>NT$ <span>\${numberWithCommas(amount)}</span></p>
                   </div>
                 </div>
               </div>
             </div>`);

                            $('#transaction_history_item_' + i).click(function () {
                                $('.transaction_history_remitter_account').html(
                                    `付款帳戶<span
                    class="font-weight-bold mx-2"
                  >` +
                                        returnData[$(this).index() - 1].remitter_account +
                                        `</span>`
                                );
                                $('.transaction_history_time').html(returnData[$(this).index() - 1].time);
                                $('.transaction_history_code').html(returnData[$(this).index() - 1].transaction_code);
                                $('.transaction_order_code').html(returnData[$(this).index() - 1].order_code);
                                $('.transaction_history_amount').html(
                                    numberWithCommas(returnData[$(this).index() - 1].amount)
                                );

                                $('.transaction_history_amount').parent().removeClass('font-red').addClass('font-blue');
                                $('#transaction_modal').modal('show');
                            });
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        console.log(xhr.status);
                        console.log(thrownError);
                    },
                });

                //帳戶紀錄
                var requestURL3 = `${BASE_URL}/api/shop/bankHistory`;

                $.ajax({
                    url: requestURL3,
                    type: 'GET',
                    dataType: 'json',
                    contentType: 'application/json;charset=utf-8',
                    success: function (returnData) {
                        for (var j = 0; j < returnData.length; j++) {
                            $('#account_history_area').children('.no_brecord').hide();
                            if (returnData[j].type == 'W') {
                                returnData[j].type = '提領';
                            }

                            const { time, amount, type, transaction_code } = returnData[j];

                            $('#account_history_area').append(`
             <div class="row justify-content-start" data-transactioncode="\${transaction_code}">
               <div class="col-12 col-sm-10 my-3 mx-auto mx-sm-5 account_history">
                 <div class="row">
                   <div class="col-12 col-sm-6">
                     <p>\${time}</p>
                   </div>
                   <div class="col-12 col-sm-6 text-sm-right">
                     <p class="type">\${type}</p>
                     <p>NT$ <span class="amount">\${numberWithCommas(amount)}</span></p>
                   </div>
                 </div>
               </div>
             </div>`);

                            if (amount < 0) {
                                $('.type').eq(j).addClass('font-red');
                                $('.amount').eq(j).parent().addClass('font-red');
                            } else {
                                $('.type').eq(j).addClass('font-blue');
                                $('.amount').eq(j).parent().addClass('font-blue');
                            }

                            if (type == '提領') {
                                $('.account_history').eq(j).parent().addClass('withdraw_item');
                            }
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        console.log(xhr.status);
                        console.log(thrownError);
                    },
                });

                $(document).on('click', '.withdraw_item', function () {
                    var requestURL = `${BASE_URL}/api/bankDetail/` + $(this).data('transactioncode');

                    $.ajax({
                        url: requestURL,
                        type: 'GET',
                        dataType: 'json',
                        contentType: 'application/json;charset=utf-8',
                        success: function (returnbankdetailData) {
                            $('.account_time').html(returnbankdetailData.time);
                            $('.account_code').html(returnbankdetailData.transaction_code);
                            $('.account_amount').html(numberWithCommas(returnbankdetailData.amount));

                            if (returnbankdetailData.type == 'W') {
                                $('.account_type').html('提領');
                                $('.account_amount').parent().removeClass('font-blue').addClass('font-red');
                            }

                            $('.account_bankname').html(
                                returnbankdetailData.bank_code + '  ' + bankList[returnbankdetailData.bank_code]
                            );
                            $('.account_bankaccount').html(returnbankdetailData.bank_account);

                            $('#account_modal').modal('show');
                        },

                        error: function (xhr, ajaxOptions, thrownError) {
                            console.log(xhr.status);
                            console.log(thrownError);
                        },
                    });
                });
            }
        </script>
    </body>
</html>
