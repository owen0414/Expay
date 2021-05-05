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

                    <form>
                        <div id="first-block" class="mb-3 mybox">
                            <label for="phone" class="d-block mb-1">收款方手機號碼:</label>
                            <input
                                type="tel"
                                name="phone"
                                id="phoneInput"
                                pattern="09[0-9]{8}"
                                maxlength="10"
                                class="form-control w-75 mx-auto"
                                placeholder="09xxxxxxxx"
                            />
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

                    <form>
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
                                            <img alt="電支帳戶" src="<c:url value="/resources/img/person_1.jpg" />">
                                            <p>
                                                <span id="remitter_eAccount">xxxxxx</span>
                                            </p>
                                            <p>
                                                <span id="remitter_name">xxxxxx</span>
                                            </p>
                                        </div>
                                        <div class="col d-flex justify-content-center">
                                            <img alt="箭頭" src="<c:url value="/resources/img/arrow.png" />"
                                            class="align-self-center">
                                        </div>
                                        <div class="col" style="width: 30px; height: auto">
                                            <img alt="名字" src="<c:url value="/resources/img/person_1.jpg" />">
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

        <!-- 交易密碼 -->
        <%@ include file="/WEB-INF/jsp/frontend/transactionPwModal.jsp"%>
        <script>
            //儲存當前使用者電話
            const phone = '0931367907'

            const setTransferAmount = (value) => {
                if (value > 50000) {
                    $('#transfer_amount').val(50000)
                } else {
                    $('#transfer_amount').val(value)
                }
            }

            $(document).ready(() => {
                //按下快捷鍵
                $('#plus-100').click(function () {
                    let amount = parseInt($('#transfer_amount').val()) + 100
                    setTransferAmount(amount)
                })

                //是否完成載入
                const isCompleted = (num) => {
                    if (num) {
                        $('#second-block').show()
                        $('#loading').hide()
                    } else {
                        //尚未完成
                        $('#second-block').hide()
                        $('#loading').fadeIn(500)
                    }
                }

                //現在時間
                setInterval(() => {
                    $('#nowtime').text(new Date())
                }, 1000)

                //預先隱藏second-block與loading
                $('#second-block').hide()
                $('#loading').hide()

                //按下確定
                $('#postBtn').click(function () {
                    isCompleted(false)
                    $.cookie('receiver_phone', $('#phoneInput').val())
                    getEAccount()
                })

                //getEAccount(對方)
                async function getEAccount() {
                    //getCurrentUser balance
                    try {
                        const currentUser = await instance.get('/getCurrentUser')
                        $('#current-balance').html(currentUser.data.info.balance)
                    } catch (error) {
                        console.log(error)
                    }

                    //對方電話號碼
                    const receiver_phone = $.cookie('receiver_phone')

                    if (receiver_phone.length == '10') {
                        try {
                            const eAccount = await instance.post('/getEAccount', {
                                phone: receiver_phone,
                                role: 'M',
                            })
                            console.log(eAccount.data)
                            const timeoutID = window.setTimeout(() => isCompleted(true), 2000)

                            $('#remitter_eAccount').html('xxxx0000')
                            $('#remitter_name').html('張O凱')
                            $('#receiver_eAccount').html('xxxx' + eAccount.data.e_account.slice(-4))
                            $('#receiver_name').html(eAccount.data.name)
                        } catch (error) {}
                    } else {
                        // $('#second-block').hide()
                        // $('#postBtn').show()
                    }
                }

                async function transfer(price) {
                    try {
                        const currentUser = await instance.get('/getCurrentUser')
                        const transferRes = await instance.post('/ePay/transaction', {
                            remitter: currentUser.data.info.phone,
                            receiver: $.cookie('receiver_phone'),
                            amount: price,
                            type: 'T',
                        })
                        console.log('轉帳結果: ' + transferRes.data)
                    } catch (error) {}
                }

                //當form觸發時
                $('form').on('submit', function (event) {
                    event.preventDefault()
                    //轉帳api
                    transfer($('input[name="transfer_amount"]').val())
                })
            })
        </script>
    </body>
</html>
