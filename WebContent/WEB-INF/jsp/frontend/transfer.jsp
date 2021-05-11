<%@ include file="/WEB-INF/jsp/includes.jsp"%> <%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>轉帳</title>
        <%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
    </head>
    <body>
        <!-- Navigation -->
        <%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

        <!-- Content -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-5">
                    <h2 class="text-center my-3">
                        <b>轉帳</b>
                    </h2>

                    <form onkeydown="return event.key != 'Enter';">
                        <div id="first-block" class="mb-3 mybox">
                            <label for="phone" class="d-block mb-1">收款方手機號碼:</label>
                            <input
                                type="tel"
                                name="phone"
                                id="phoneInput"
                                pattern="09[0-9]{8}"
                                maxlength="10"
                                class="form-control w-75 mx-auto"
                                placeholder="對方的手機號碼"
                            />
                            <div id="message" class="d-block mt-1 w-75 mx-auto" style="color: red"></div>
                        </div>
                        <div id="postBtn" class="mb-3 d-flex justify-content-end">
                            <button type="button" class="btn btn-secondary">確定</button>
                        </div>
                    </form>
                    <div id="loading" class="mb-3 mybox container">
                        <div class="row d-flex justify-content-center align-items-center" style="height: 200px">
                            <div class="col-12 d-flex justify-content-center align-items-center">
                                <div class="spinner-grow" style="width: 1.5rem; height: 1.5rem" role="status">
                                    <span class="sr-only">Loading...</span>
                                </div>
                                <div class="spinner-grow" style="width: 1.5rem; height: 1.5rem" role="status">
                                    <span class="sr-only">Loading...</span>
                                </div>
                                <div class="spinner-grow" style="width: 1.5rem; height: 1.5rem" role="status">
                                    <span class="sr-only">Loading...</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <form onkeydown="return event.key != 'Enter';">
                        <div id="second-block">
                            <div class="mb-3 mybox container">
                                <div id="transferPage">
                                    <div class="row mb-1">
                                        <ul class="col d-flex flex-row justify-content-between">
                                            <li>電子帳戶餘額</li>
                                            <li>NT$ <span id="current-balance">0</span></li>
                                        </ul>
                                    </div>
                                    <div class="row">
                                        <ul class="col d-flex flex-column align-items-center">
                                            <li class="mb-1 w-75">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">NT$</span>
                                                    </div>
                                                    <input
                                                        type="number"
                                                        id="transfer_amount"
                                                        name="transfer_amount"
                                                        min="1"
                                                        max="50000"
                                                        value="0"
                                                        class="form-control"
                                                    />
                                                </div>
                                            </li>
                                            <li class="mb-1 w-75">
                                                <button
                                                    type="button"
                                                    value="100"
                                                    class="btn btn-secondary"
                                                    id="plus-100"
                                                >
                                                    +100
                                                </button>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <hr />
                                        </div>
                                    </div>
                                    <div class="row text-center">
                                        <div class="col" style="width: 30px; height: auto">
                                            <img alt="電支帳戶" src="<c:url value="/resources/img/person.jpg" />">
                                            <p>
                                                <span id="remitter_eAccount">xxxxxx</span>
                                            </p>
                                            <p>
                                                <span id="remitter_name">xxxxxx</span>
                                            </p>
                                        </div>
                                        <div class="col d-flex justify-content-center">
                                            <i class="fas fa-angle-double-right fa-2x align-self-center"></i>
                                        </div>
                                        <div class="col" style="width: 30px; height: auto">
                                            <img alt="名字" src="<c:url value="/resources/img/person.jpg" />">
                                            <p>
                                                <span id="receiver_eAccount">xxx</span>
                                            </p>
                                            <p>
                                                <span id="receiver_name">xxxxxx</span>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <hr />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <span id="nowtime"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3 d-flex justify-content-end">
                                <button id="post2Btn" type="submit" class="btn btn-secondary">轉帳</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>

        <!-- ResultModal -->
        <%@ include file="/WEB-INF/jsp/frontend/resultModal.jsp"%>

        <!-- 交易密碼 -->
        <%@ include file="/WEB-INF/jsp/frontend/transactionPwModal.jsp"%>
        <script>
            //限制加總不超過餘額及上限
            const setTransferAmount = (value) => {
                if (value > 50000) {
                    $('#transfer_amount').val(50000)
                } else {
                    $('#transfer_amount').val(value)
                }
            }

            //清除cookie
            const cleanCookieAndContent = () => {
                $('#phoneInput').val()
                $.removeCookie('transaction_code')
                $.removeCookie('amount')
                $.removeCookie('phone')
                $.removeCookie('name')
                $.removeCookie('e_account')
            }

            const initRender = async () => {
                //預先隱藏second-block與loading
                $('#second-block').hide()
                $('#loading').hide()

                if (typeof $.cookie('transaction_code') !== 'undefined') {
                    $('#second-block').fadeIn(500)
                    $('#postBtn').children().hide()
                    try {
                        const currentUser = await instance.get('/api/getCurrentUser')
                        //dom渲染
                        $('#current-balance').html(numberWithCommas(currentUser.data.info.balance))
                        $('#remitter_eAccount').html(currentUser.data.info.e_account)
                        $('#remitter_name').html(currentUser.data.info.name)

                        $('#phoneInput').val($.cookie('phone'))
                        $('#receiver_eAccount').html($.cookie('e_account'))
                        $('#receiver_name').html($.cookie('name'))
                        $('#transfer_amount').val($.cookie('amount'))

                        //避免input
                        $('#phoneInput').attr('disabled', true)
                        $('#transfer_amount').attr('disabled', true)
                        $('#plus-100').attr('disabled', true)
                    } catch (error) {
                        console.log(error)
                    }
                } else {
                    $('#postBtn').children().show()
                }
            }

            //是否完成載入
            const isCompleted = (num) => {
                switch (num) {
                    case 0:
                        //尚未完成
                        $('#second-block').hide()
                        $('#loading').fadeIn(500)
                        break
                    case 1:
                        //已完成
                        $('#second-block').fadeIn(500)
                        $('#loading').hide()
                        break
                    case 2:
                        $('#second-block').hide()
                        $('#loading').hide()
                        break
                    default:
                        console.log('Sorry, no allowed.')
                }
            }

            //送出轉帳時防止輸入
            const loadingForm = (status) => {
                if (status) {
                    $('#phoneInput').attr('disabled', true)
                    $('#transfer_amount').attr('disabled', true)
                    $('#plus-100').attr('disabled', true)

                    $('#post2Btn').html(
                        '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>確認中...'
                    )
                } else {
                    //確認狀態(轉帳or要求轉帳)
                    initRender()

                    $('#phoneInput').attr('disabled', false)
                    $('#transfer_amount').attr('disabled', false)
                    $('#plus-100').attr('disabled', false)
                    $('#post2Btn').html('轉帳')
                }
            }

            //等待
            function sleep(sec) {
                return new Promise((resolve, reject) => {
                    setTimeout(() => resolve(), sec * 1000)
                })
            }

            //等待
            function sleepForApiRes(sec) {
                setTimeout(() => isCompleted(2), 1000)
                return new Promise((resolve, reject) => {
                    setTimeout(() => {
                        resolve()
                    }, sec * 1000)
                })
            }

            //電話格式錯誤
            function isErrorFormat(phone, success, failed) {
                if (checkPhone(phone)) {
                    $.cookie('receiver_phone', $('#phoneInput').val())
                    console.log(success(phone))
                } else {
                    $('#message').html(failed(phone))
                }
            }

            //api取回資料是否存在
            function apiRes(res, success, failed) {
                const { status } = res
                if (status === 200) {
                    console.log(success(res))
                } else {
                    //顯示錯誤信息
                    sleepForApiRes(1).then(() => {
                        $.removeCookie('receiver_phone')
                        $('#message').html(failed(res))
                    })
                }
            }

            $(document).ready(() => {
                initRender()

                // keyup event
                // $('#transfer_amount').on('keyup', function () {
                //     $(this).attr(max)
                // })

                //按下快捷鍵
                $('#plus-100').click(function () {
                    let amount = parseInt($('#transfer_amount').val()) + 100
                    setTransferAmount(amount)
                })

                //現在時間
                setInterval(() => {
                    $('#nowtime').text(new Date())
                }, 1000)

                //按下確定，獲取接收方資訊
                $('#postBtn').click(function () {
                    const local_phone = $('#phoneInput').val()
                    if (local_phone) {
                        isErrorFormat(
                            local_phone,
                            (local_phone) => {
                                // 取接收方資訊(get phone from set cookie)
                                getEAccount()
                                return `格式驗證成功`
                            },
                            (local_phone) => {
                                return `請輸入正確格式`
                            }
                        )
                    }
                })

                //getEAccount(接受方)
                async function getEAccount() {
                    //loading...
                    isCompleted(0)

                    try {
                        const currentUser = await instance.get('/api/getCurrentUser')
                        //對方電話號碼讀取
                        const receiver_phone = $.cookie('receiver_phone')

                        const receiverUser = await instance.post('/api/getEAccount', {
                            phone: receiver_phone,
                            role: 'M',
                        })

                        apiRes(
                            receiverUser.data,
                            ({ e_account, name, message, status, timestamp }) => {
                                sleep(1).then(() => {
                                    isCompleted(1)
                                })

                                //dom渲染
                                $('#current-balance').html(numberWithCommas(currentUser.data.info.balance))

                                $('#remitter_eAccount').html(eAccountToStar(currentUser.data.info.e_account))
                                $('#remitter_name').html(currentUser.data.info.name)
                                $('#receiver_eAccount').html(eAccountToStar(receiverUser.data.e_account))
                                $('#receiver_name').html(receiverUser.data.name)

                                return `getEAccount成功`
                            },
                            ({ status, message, timestamp }) => {
                                return message
                            }
                        )

                        // if (receiverUser.data.status == '200') {

                        // } else {
                        //     alert(receiverUser.data.message)
                        // }
                    } catch (error) {
                        console.log(error)
                    }
                }

                //轉帳API
                async function transfer(price) {
                    try {
                        const currentUser = await instance.get('/api/getCurrentUser')
                        const transferRes = await instance.post('/api/ePay/transaction', {
                            remitter: currentUser.data.info.phone,
                            receiver: $.cookie('receiver_phone'),
                            amount: price,
                            type: 'T',
                        })
                        if (transferRes.data) {
                            renderModalBody(
                                transferRes.data,
                                ({ amount, balance, message, name, status, timestamp }) => {
                                    return `
                                        訊息: \${message}<br>
                                        轉帳金額: NT\$\${numberWithCommas(amount)}<br>
                                        轉帳後餘額: NT\$\${numberWithCommas(balance)}
                                    `
                                },
                                ({ amount, balance, message, name, status, timestamp }) => {
                                    return `
                                        訊息: \${message}<br>
                                        轉帳失敗
                                    `
                                }
                            )
                        }
                    } catch (error) {
                    } finally {
                        cleanCookieAndContent()
                    }
                }

                //要求轉帳API
                async function transferByRequest(transaction_code) {
                    try {
                        const transferRes = await instance.post('/api/ePay/receive', {
                            transactionCode: transaction_code,
                            status: 'Y',
                        })
                        if (transferRes.data) {
                            renderModalBody(
                                transferRes.data,
                                ({ amount, balance, message, name, status, timestamp }) => {
                                    return `
                                        訊息: \${message}<br>
                                        轉帳金額: NT\$\${numberWithCommas(amount)}<br>
                                        轉帳後餘額: NT\$\${numberWithCommas(balance)}
                                    `
                                },
                                ({ amount, balance, message, name, status, timestamp }) => {
                                    return `
                                        訊息: \${message}<br>
                                        轉帳失敗
                                    `
                                }
                            )
                        }
                    } catch (error) {
                    } finally {
                        cleanCookieAndContent()
                    }
                }

                //當form觸發時送出
                $('form').on('submit', function (event) {
                    event.preventDefault()
                    loadingForm(true)

                    if (typeof $.cookie('transaction_code') !== 'undefined') {
                        //要求轉帳API
                        transferByRequest($.cookie('transaction_code')).then((res) =>
                            sleep(1).then(() => {
                                loadingForm(false)
                            })
                        )
                    } else {
                        //轉帳API
                        transfer($('input[name="transfer_amount"]').val()).then((res) =>
                            sleep(1).then(() => {
                                loadingForm(false)
                            })
                        )
                    }
                })
            })
        </script>

        <script>
            instance.get('/api/getCurrentUser').then((res) => {
                if (!res.data.login) {
                    //console.log(res);
                    location.href = `${pageContext.request.contextPath}/user/login`
                }

                const {info: {role}} = res.data;
                if(role === "S"){
                    location.href = `${pageContext.request.contextPath}/`;
                }
            })
        </script>
    </body>
</html>
