<%@ include file="/WEB-INF/jsp/includes.jsp"%> <%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>收款</title>
        <%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
    </head>
    <body>
        <!-- Navigation -->
        <%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

        <!-- Content -->
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-12 col-md-5">
                    <h2 class="text-center my-3">收款</h2>
                    <form class="mypanel">
                        <div class="mb-3 mybox container">
                            <div class="row">
                                <ul class="col d-flex justify-content-between align-items-center">
                                    <li><label for="from_phone">對方手機:</label></li>
                                    <li>
                                        <input
                                            type="tel"
                                            name="from_phone"
                                            id="from_phone"
                                            pattern="09[0-9]{8}"
                                            maxlength="10"
                                            placeholder="對方的手機號碼"
                                            class="form-control"
                                            onkeyup="validation(0)"
                                        />
                                    </li>
                                </ul>
                            </div>
                            <div class="row">
                                <div class="col-12 d-flex justify-content-end">
                                    <span id="message" style="color: white" class="mt-2 badge"></span>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3 mybox container">
                            <div class="row mb-3">
                                <ul class="col d-flex flex-column align-items-center">
                                    <li class="mb-1 align-self-start">
                                        <label for="recieve_amount">收款金額</label>
                                    </li>
                                    <li class="mb-1">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">NT$</span>
                                            </div>
                                            <input
                                                type="number"
                                                id="recieve_amount"
                                                name="recieve_amount"
                                                min="1"
                                                max="50000"
                                                value="0"
                                                class="form-control"
                                                onkeyup="validation(1)"
                                            />
                                        </div>
                                    </li>
                                    <li class="mb-1">
                                        <button type="button" value="100" class="btn btn-secondary" id="plus-100">
                                            +100
                                        </button>
                                        <button type="button" value="1000" class="btn btn-secondary" id="plus-1000">
                                            +1000
                                        </button>
                                        <button type="button" value="10000" class="btn btn-secondary" id="plus-10000">
                                            +10000
                                        </button>
                                    </li>
                                </ul>
                            </div>
                            <div class="row mb-3">
                                <div class="col">
                                    <textarea
                                        id="note"
                                        class="form-control"
                                        rows="3"
                                        placeholder="收款備註"
                                        maxlength="50"
                                        onkeyup="validation(1)"
                                    ></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">這會寄送收款通知給對方</div>
                                <div class="col d-flex justify-content-end">
                                    <span id="form-message" style="color: white" class="badge"></span>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3 mybox container text-center">
                            <div class="row">
                                <div class="col">
                                    <img alt="對方電支帳戶" src="<c:url value="/resources/img/person.jpg" />"
                                    id="e_account-icon">
                                    <span id="e_account-name">對方電支帳戶</span>
                                </div>
                                <div class="col d-flex justify-content-center">
                                    <img alt="箭頭" src="<c:url value="/resources/img/arrow.png" />"
                                    class="align-self-center">
                                </div>
                                <div class="col">
                                    <img alt="您的電支帳戶" src="<c:url value="/resources/img/person.jpg" />">
                                    <span>您的電支帳戶</span>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3 d-flex justify-content-end">
                            <button class="btn btn-secondary" id="recieve-btn" type="button">收款通知</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>

        <!-- ResultModal -->
        <%@ include file="/WEB-INF/jsp/frontend/resultModal.jsp"%>

        <!--交易密碼-->
        <%@ include file="/WEB-INF/jsp/frontend/transactionPwModal.jsp"%>
        <script>
            initFetch();

            store.subscribe(() => {
                const state = store.getState();
                console.log(state);

                //如果redux request有值
                if (state.request) {
                    const { name } = state.request.from;
                    $('#e_account-name').text(name);
                }

                //如果redux response有值
                if (state.response) {
                    const {
                        from: { name },
                    } = state.request;
                    const {
                        info: { balance },
                    } = state.e_account;
                    const amount = parseInt($('#recieve_amount').val());
                    const afterBalance = amount + balance;

                    renderModalBody(
                        state.response,
                        ({ status, message, timestamp }) => {
                            return `
            						付款者大名: \${name}<br>
            						收款金額: NT\$\${numberWithCommas(amount)}<br>
            						預計收款後餘額: NT\$\${numberWithCommas(afterBalance)}
            					`;
                        },
                        ({ status, message, timestamp }) => {
                            return `
                                    收款通知失敗!<br>
            					`;
                        }
                    );
                }
            });

            //收款金額
            const setRecieveAmount = (value) => {
                if (value > 50000) {
                    $('#recieve_amount').val(50000);
                } else {
                    $('#recieve_amount').val(value);
                }
            };

            //送出時避免input
            const loadingForm = (status) => {
                if (status) {
                    $('#from_phone').attr('disabled', true);
                    $('#recieve_amount').attr('disabled', true);
                    $('#note').attr('disabled', true);
                    $('#plus-100').attr('disabled', true);
                    $('#plus-1000').attr('disabled', true);
                    $('#plus-10000').attr('disabled', true);
                    $('#recieve-btn').html(
                        '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>確認中...'
                    );
                } else {
                    $('#from_phone').attr('disabled', false);
                    $('#recieve_amount').attr('disabled', false);
                    $('#note').attr('disabled', false);
                    $('#plus-100').attr('disabled', false);
                    $('#plus-1000').attr('disabled', false);
                    $('#plus-10000').attr('disabled', false);
                    $('#recieve-btn').html('收款通知');
                }
            };

            const validation = (num) => {
                if (num == 0) {
                    //清除電話錯誤訊息
                    $('#message').html('');
                } else {
                    //清除其他
                    $('#form-message').html('');
                }
            };

            //按鈕
            $(document).ready(() => {
                $('#recieve_amount').change(function (e) {
                    let amount = parseInt(e.target.value);
                    setRecieveAmount(amount);
                });
                $('#plus-100').click(function () {
                    let amount = parseInt($('#recieve_amount').val()) + 100;
                    setRecieveAmount(amount);
                });
                $('#plus-1000').click(function () {
                    let amount = parseInt($('#recieve_amount').val()) + 1000;
                    setRecieveAmount(amount);
                });
                $('#plus-10000').click(function () {
                    let amount = parseInt($('#recieve_amount').val()) + 10000;
                    setRecieveAmount(amount);
                });

                //重整
                $('#resultModal').on('hidden.bs.modal', function (e) {
                    location.reload();
                });

                //根據輸入的手機號碼抓取對方大名
                $('#from_phone').keyup(function () {
                    let fromPhone = $('#from_phone').val();
                    if (fromPhone.length == 10) {
                        if (checkPhone(fromPhone)) {
                            let dataJSON = {};
                            dataJSON['phone'] = fromPhone;
                            dataJSON['role'] = 'M';

                            instance
                                .post('/api/getEAccount', dataJSON)
                                .then((res) => {
                                    if (res.data.status === 200) {
                                        const { name } = res.data;
                                        store.dispatch({
                                            type: 'FETCH',
                                            payload: { from: { name } },
                                        });

                                        $('#message').html('OK').removeClass('badge-danger').addClass('badge-success');
                                    } else {
                                        $('#message')
                                            .html(res.data.message)
                                            .addClass('badge-danger')
                                            .removeClass('badge-success');
                                    }
                                })
                                .catch((error) => {
                                    handleError(error.response.data);
                                    console.log(error);
                                });
                        } else {
                            $('#message').html('手機格式錯誤');
                            $('#message').addClass('badge-danger');
                            $('#message').removeClass('badge-success');
                        }
                    }
                });

                //收款
                $('#recieve-btn').click(() => {
                    const remitter = $('#from_phone').val();
                    const amount = parseInt($('#recieve_amount').val());
                    const note = $('#note').val();

                    //前端欄位檢核
                    if (!checkPhone(remitter)) {
                        $('#form-message')
                            .html('付款方手機不符格式!')
                            .addClass('badge-danger')
                            .removeClass('badge-success');
                    } else if (amount <= 0 || amount > 50000 || isNaN(amount)) {
                        $('#form-message')
                            .html('收款金額須介於1~50000新台幣')
                            .addClass('badge-danger')
                            .removeClass('badge-success');
                        // } else if (note.length == 0 || note.length > 50) {
                        //     $('#form-message')
                        //         .html('收款備註字元需介於1~50字之間!')
                        //         .addClass('badge-danger')
                        //         .removeClass('badge-success')
                    } else {
                        let dataJSON = {};
                        dataJSON['remitter'] = remitter;
                        dataJSON['receiver'] = store.getState().e_account
                            ? store.getState().e_account.info.phone
                            : '0912345678'; //TODO 抓使用者真實的手機
                        dataJSON['amount'] = amount;
                        dataJSON['note'] = note;
                        dataJSON['type'] = 'R';

                        loadingForm(true);
                        //執行收款
                        instance
                            .post('/api/ePay/transaction', dataJSON)
                            .then((res) => {
                                store.dispatch({
                                    type: 'SUBMIT',
                                    payload: res.data,
                                });

                                window.setTimeout(() => loadingForm(false), 500);
                            })
                            .catch((error) => {
                                handleError(error.response.data);
                                window.setTimeout(() => loadingForm(false), 500);
                                console.log(error);
                            });
                    }
                });
            });
            async function initFetch() {
                try {
                    //抓取當前使用者
                    let res = await instance.get('/api/getCurrentUser');
                    const { login } = res.data;
                    if (!login) {
                        location.href = `${pageContext.request.contextPath}/user/login`;
                        throw new Error('尚未登入!');
                    }

                    //如果是商店會員就跳轉至首頁
                    const {
                        info: { role },
                    } = res.data;
                    if (role === 'S') {
                        location.href = `${pageContext.request.contextPath}/`;
                    }

                    store.dispatch({
                        type: 'FETCH_USER',
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
