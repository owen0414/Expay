<%@ include file="/WEB-INF/jsp/includes.jsp"%> <%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>付款</title>
        <%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
    </head>
    <body>
        <!-- Navigation -->
        <%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

        <!-- Content -->
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-12 col-md-5">
                    <h2 class="text-center my-3">付款</h2>
                    <form class="mypanel">
                        <div class="mb-3 mybox text-center">
                            <div class="row">
                                <ul class="col d-flex flex-row justify-content-between align-items-center">
                                    <li>
                                        <label for="store_phone">商家手機</label>
                                    </li>
                                    <li>
                                        <input
                                            type="tel"
                                            name="store_phone"
                                            id="store_phone"
                                            pattern="09[0-9]{8}"
                                            maxlength="10"
                                            class="form-control"
                                            placeholder="商家的手機號碼"
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
                            <div class="row">
                                <ul class="col d-flex flex-row justify-content-between">
                                    <li>電支帳號餘額</li>
                                    <li>NT$ <span id="current-balance">100</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="mb-3 mybox container">
                            <div class="row">
                                <ul class="col d-flex flex-column align-items-center">
                                    <li class="mb-1 align-self-start">
                                        <label for="pay_amount">付款金額</label>
                                    </li>
                                    <li class="mb-1">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">NT$</span>
                                            </div>
                                            <input
                                                type="number"
                                                id="pay_amount"
                                                name="pay_amount"
                                                min="1"
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
                                    <li class="align-self-start">請向商家洽詢</li>
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
                                    <img alt=">" src="<c:url value="/resources/img/arrow.png" />"
                                    class="align-self-center">
                                </div>
                                <div class="col">
                                    <img alt="合作商家" src="<c:url value="/resources/img/shop.png" />"
                                    id="e_account-icon">
                                    <span id="e_account-name">合作商家</span>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3 d-flex justify-content-end">
                            <button class="btn btn-secondary" id="pay-btn" type="button">付款</button>
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
            initFetch()

            store.subscribe(() => {
                const state = store.getState()
                console.log(state)

                if (state.e_account) {
                    const {
                        info: { balance },
                    } = state.e_account
                    $('#current-balance').text(numberWithCommas(balance))
                }

                if (state.request) {
                    const { name } = state.request.to
                    $('#e_account-name').text(name)
                }

                if (state.response) {
                    renderModalBody(
                        state.response,
                        ({ status, message, timestamp, name, amount, balance }) => {
                            return `
						付款商家: \${name}<br>
						付款金額: NT\$\${numberWithCommas(amount)}<br>
						付款後餘額: NT\$\${numberWithCommas(balance)}
					`
                        },
                        () => {
                            return '付款失敗!'
                        }
                    )
                }
            })

            //付款金額
            const setPayWithDrawAmount = (value) => {
                let currentBalance = parseInt(undoNumberWithCommas($('#current-balance').text()))
                if (value > currentBalance) {
                    $('#pay_amount').val(currentBalance)
                } else {
                    $('#pay_amount').val(value)
                }
            }

            //送出時避免輸入
            const loadingForm = (status) => {
                if (status) {
                    $('#store_phone').attr('disabled', true)
                    $('#pay_amount').attr('disabled', true)
                    $('#pay-btn').html(
                        '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>確認中...'
                    )
                } else {
                    $('#store_phone').attr('disabled', false)
                    $('#pay_amount').attr('disabled', false)
                    $('#pay-btn').html('付款')
                }
            }

            //按鈕
            $(document).ready(() => {
                $('#pay_amount').change(function (e) {
                    let amount = parseInt(e.target.value)
                    setPayWithDrawAmount(amount)
                })
                $('#plus-100').click(function () {
                    let amount = parseInt($('#pay_amount').val()) + 100
                    setPayWithDrawAmount(amount)
                })
                $('#plus-1000').click(function () {
                    let amount = parseInt($('#pay_amount').val()) + 1000
                    setPayWithDrawAmount(amount)
                })
                $('#plus-10000').click(function () {
                    let amount = parseInt($('#pay_amount').val()) + 10000
                    setPayWithDrawAmount(amount)
                })

                document.getElementById('store_phone').onkeyup = function () {
                    //清除錯誤訊息與資訊
                    $('#message').html('')
                    $('#e_account-name').html('合作店家')
                }

                //重整
                $('#resultModal').on('hidden.bs.modal', function (e) {
                    location.reload()
                })

                //根據輸入的手機號碼抓取對方大名
                $('#store_phone').keyup(function () {
                    let storePhone = $('#store_phone').val()
                    if (storePhone.length == 10) {
                        if (checkPhone(storePhone)) {
                            let dataJSON = {}
                            dataJSON['phone'] = storePhone
                            dataJSON['role'] = 'S'

                            instance
                                .post('/api/getEAccount', dataJSON)
                                .then((res) => {
                                    if (res.data.status === 200) {
                                        const { name } = res.data
                                        store.dispatch({
                                            type: 'FETCH',
                                            payload: { to: { name } },
                                        })
                                        $('#message').html('OK').removeClass('badge-danger').addClass('badge-success')
                                    } else {
                                        $('#message')
                                            .html('商家不存在，請確認手機是否正確')
                                            .addClass('badge-danger')
                                            .removeClass('badge-success')
                                    }
                                })
                                .catch((error) => {
                                    handleError(error.response.data)
                                    console.log(error)
                                })
                        } else {
                            $('#message').html('手機格式錯誤')
                            $('#message').addClass('badge-danger')
                            $('#message').removeClass('badge-success')
                        }
                    }
                })

                //付款
                $('#pay-btn').click(() => {
                    const phone = $('#store_phone').val()
                    const amount = parseInt($('#pay_amount').val())

                    if (!checkPhone(phone)) {
                        $('#message').html('商家手機不符格式!').addClass('badge-danger').removeClass('badge-success')
                    } else if (amount <= 0 || amount > 50000) {
                        $('#message').html('付款金額必須1~50000').addClass('badge-danger').removeClass('badge-success')
                    } else {
                        $('#message').html('OK').removeClass('badge-danger').addClass('badge-success')
                        let dataJSON = {}
                        dataJSON['remitter'] = store.getState().e_account
                            ? store.getState().e_account.info.phone
                            : '0912345678' //TODO 抓使用者真實的手機
                        dataJSON['receiver'] = phone
                        dataJSON['amount'] = amount
                        dataJSON['type'] = 'S'

                        loadingForm(true)
                        instance
                            .post('/api/ePay/transaction', dataJSON)
                            .then((res) => {
                                store.dispatch({
                                    type: 'SUBMIT',
                                    payload: res.data,
                                })
                                window.setTimeout(() => loadingForm(false), 500)
                                initFetch()
                            })
                            .catch((error) => {
                                handleError(error.response.data)
                                window.setTimeout(() => loadingForm(false), 500)
                                console.log(error)
                            })
                    }
                })
            })

            async function initFetch() {
                try {
                    let res = await instance.get('/api/getCurrentUser')
                    const { login } = res.data
                    if (!login) {
                        location.href = `${pageContext.request.contextPath}/user/login`
                        throw new Error('尚未登入!')
                    }

                    const {
                        info: { role },
                    } = res.data
                    if (role === 'S') {
                        location.href = `${pageContext.request.contextPath}/`
                    }

                    store.dispatch({
                        type: 'FETCH_USER',
                        payload: res.data,
                    })
                } catch (error) {
                    handleError(error.response.data)
                    console.log(error)
                }
            }
        </script>
    </body>
</html>
