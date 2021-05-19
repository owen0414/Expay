<%@ include file="/WEB-INF/jsp/includes.jsp"%> <%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>提領</title>
        <%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
    </head>
    <body>
        <!-- Navigation -->
        <%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

        <!-- Content -->
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-12 col-md-5">
                    <h2 class="text-center my-3">提領</h2>
                    <form class="mypanel">
                        <div class="mb-3 mybox text-center">
                            <label for="bank_account">銀行帳號:</label>
                            <select class="custom-select" name="bank_account" id="bank_account">
                                <!--<option value="1">玉山銀行 116688</option>-->
                            </select>
                        </div>
                        <div class="mb-3 mybox container">
                            <div class="row">
                                <ul class="col d-flex flex-row justify-content-between">
                                    <li>目前餘額</li>
                                    <li>NT$ <span id="current-balance">0</span></li>
                                </ul>
                            </div>
                            <div class="row">
                                <ul class="col d-flex flex-column align-items-center">
                                    <li class="mb-1 align-self-start">
                                        <label for="withdraw_amount">提領金額</label>
                                    </li>
                                    <li class="mb-1">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">NT$</span>
                                            </div>
                                            <input
                                                type="number"
                                                id="withdraw_amount"
                                                name="withdraw_amount"
                                                min="0"
                                                max="50000"
                                                value="0"
                                                class="form-control"
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
                            <div class="row">
                                <ul class="col d-flex flex-row justify-content-between">
                                    <li>提領後餘額</li>
                                    <li>NT$ <span id="after-withdraw-balance"></span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="mb-3 mybox container text-center">
                            <div class="row">
                                <div class="col">
                                    <img alt="您的電支帳戶" src="<c:url value="/resources/img/person.jpg" />">
                                    <span>您的電支帳戶</span>
                                </div>
                                <div class="col d-flex justify-content-center">
                                    <img alt="箭頭" src="<c:url value="/resources/img/arrow.png" />"
                                    class="align-self-center">
                                </div>
                                <div class="col">
                                    <img alt="玉山銀行" src="<c:url value="/resources/img/esun.png" />" id="bank-icon">
                                    <span id="bank-name">玉山銀行</span>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3 d-flex justify-content-end">
                            <button class="btn btn-secondary" id="withdraw-btn" type="button">提領</button>
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

                //redux e_account有值
                if (state.e_account) {
                    const {
                        info: { balance },
                    } = state.e_account;
                    $('#current-balance').text(numberWithCommas(balance));
                }

                //redux request有值
                if (state.request) {
                    $('#bank_account').empty();
                    const { banks } = state.request;
                    banks.forEach(({ bankCode, bankAddress }) => {
                        $('#bank_account').append(
                            `<option value=\${bankCode},\${bankAddress}>\${bankList[bankCode]} \${last5Address(bankAddress)}</option>`
                        );
                    });
                }

                //redux response有值
                if (state.response) {
                    renderModalBody(
                        state.response,
                        ({ status, message, timestamp, bankCode, amount, balance }) => {
                            return `
						提領銀行: \${bankList[bankCode]}<br>
						提領金額: NT\$\${numberWithCommas(amount)}<br>
						提領後餘額: NT\$\${numberWithCommas(balance)}
					`;
                        },
                        () => {
                            return '提領失敗!';
                        }
                    );
                }
            });

            //提領值設定
            const setWithDrawAmount = (value) => {
                let currentBalance = parseInt(undoNumberWithCommas($('#current-balance').text()));
                if (value > currentBalance) {
                    $('#withdraw_amount').val(currentBalance);
                } else {
                    $('#withdraw_amount').val(value);
                }
            };
            //提領後餘額欄位
            const updateAfterWithDrawBalance = () => {
                let currentBalance = parseInt(undoNumberWithCommas($('#current-balance').text()));
                let amount = currentBalance - parseInt($('#withdraw_amount').val());
                if (amount < 0) {
                    $('#after-withdraw-balance').text(numberWithCommas(0));
                } else {
                    $('#after-withdraw-balance').text(numberWithCommas(amount));
                }
            };

            //送出時避免input
            const loadingForm = (status) => {
                if (status) {
                    $('#bank_account').attr('disabled', true);
                    $('#withdraw_amount').attr('disabled', true);
                    $('#withdraw-btn').html(
                        '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>確認中...'
                    );
                } else {
                    $('#bank_account').attr('disabled', false);
                    $('#withdraw_amount').attr('disabled', false);
                    $('#withdraw-btn').html('提領');
                }
            };

            //重整
            $('#resultModal').on('hidden.bs.modal', function (e) {
                location.reload();
            });

            //按鈕
            $(document).ready(() => {
                $('#withdraw_amount').change(function (e) {
                    let amount = parseInt(e.target.value);
                    setWithDrawAmount(amount);
                    updateAfterWithDrawBalance();
                });
                $('#plus-100').click(function () {
                    let amount = parseInt($('#withdraw_amount').val()) + 100;
                    setWithDrawAmount(amount);
                    updateAfterWithDrawBalance();
                });
                $('#plus-1000').click(function () {
                    let amount = parseInt($('#withdraw_amount').val()) + 1000;
                    setWithDrawAmount(amount);
                    updateAfterWithDrawBalance();
                });
                $('#plus-10000').click(function () {
                    let amount = parseInt($('#withdraw_amount').val()) + 10000;
                    setWithDrawAmount(amount);
                    updateAfterWithDrawBalance();
                });

                // 提領按鈕 TODO
                $('#withdraw-btn').click(() => {
                    let [bankCode, bankAddress] = $('#bank_account').val().split(','); //銀行代碼和帳戶
                    let amount = parseInt($('#withdraw_amount').val()); //提領金額

                    //前端檢核
                    if (amount <= 0) {
                        alert('提款金額必須1元以上');
                    } else {
                        let dataJSON = {};

                        dataJSON['e_account'] = store.getState().e_account
                            ? store.getState().e_account.info.e_account
                            : '0210000001'; //TODO 抓使用者真實的e_account
                        dataJSON['bankCode'] = bankCode;
                        dataJSON['bankAddress'] = bankAddress;
                        dataJSON['amount'] = amount;
                        dataJSON['type'] = 'W';

                        loadingForm(true);
                        //執行提領
                        instance
                            .post('/api/bank/transaction', dataJSON)
                            .then((res) => {
                                store.dispatch({
                                    type: 'SUBMIT',
                                    payload: res.data,
                                });

                                window.setTimeout(() => loadingForm(false), 500);
                                initFetch();
                                updateAfterWithDrawBalance();
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
                    //取得當前的使用者
                    let res = await instance.get('/api/getCurrentUser');
                    const { login } = res.data;
                    if (!login) {
                        location.href = `${pageContext.request.contextPath}/user/login`;
                        throw new Error('尚未登入!');
                    }

                    store.dispatch({
                        type: 'FETCH_USER',
                        payload: res.data,
                    });

                    //抓取目前使用者已綁定的銀行帳號
                    res = await instance.get('/api/getLinkedBank');
                    if (res.data.banks.length === 0) {
                        location.href = '${pageContext.request.contextPath}/bank';
                    }
                    store.dispatch({
                        type: 'FETCH',
                        payload: { ...res.data },
                    });

                    showBankAccountIconName('${pageContext.request.contextPath}');
                } catch (error) {
                    handleError(error.response.data);
                    console.log(error);
                }
            }
        </script>
    </body>
</html>
