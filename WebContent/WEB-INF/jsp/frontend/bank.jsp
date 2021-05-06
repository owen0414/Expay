<%@ include file="/WEB-INF/jsp/includes.jsp"%> <%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>銀行帳戶管理</title>
        <%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
    </head>
    <body>
        <!-- Navigation -->
        <%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

        <!-- Content -->
        <div class="content_container" style="height: auto; min-height: 450px">
            <div class="row mx-auto mx-sm-auto">
                <div class="col-12 text-center">
                    <div class="mt-5">
                        <p class="h3" style="font-weight: bold">已綁定帳戶</p>
                    </div>
                </div>
                <div class="col-12">
                    <div
                        id="carouselExampleInterval"
                        class="carousel slide"
                        data-ride="carousel"
                        data-touch="true"
                        style="width: 100%"
                    >
                        <ol class="carousel-indicators">
                            <!--<li>指標</li> -->
                            <li
                                style="width: 15px; height: 15px; border-radius: 100%; background-color: black"
                                data-target="#carouselExampleInterval"
                                data-slide-to="0"
                                class="indicatorDefault2 active"
                            ></li>
                        </ol>
                        <div class="carousel-inner" style="overflow: none">
                            <div class="cardDefault carousel-item active"></div>
                        </div>
                    </div>
                </div>

                <div class="col-12 d-flex justify-content-center">
                    <div class="m-2" style="min-width: 320px; width: 30%">
                        <button
                            type="button"
                            class="btn btn-secondary btn-block"
                            data-toggle="modal"
                            id="modalBank"
                            data-target="#exampleModalScrollable"
                        >
                            新增卡片
                        </button>
                    </div>
                </div>

                <div class="col-12 d-flex justify-content-center">
                    <div class="mx-2 mb-2" style="min-width: 320px; width: 30%">
                        <button
                            type="button"
                            class="btn btn-primary btn-block"
                            data-toggle="modal"
                            id="modalEditBank"
                            data-target="#editCardModal"
                        >
                            編輯卡片
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal 新增卡片-->
        <div
            class="modal fade"
            id="exampleModalScrollable"
            tabindex="-1"
            role="dialog"
            aria-labelledby="exampleModalScrollableTitle"
            aria-hidden="true"
        >
            <div class="modal-dialog modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">選擇銀行</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form name="addBankAccountForm" id="addBankAccountForm">
                        <div class="modal-body">
                            <!-- 第一段 -->
                            <div class="col-12 d-flex justify-content-center">
                                <div class="btn-bank m-2" style="width: 90%">
                                    <button type="button" class="btn btn-secondary btn-block" style="text-align: left">
                                        808 玉山銀行
                                    </button>
                                </div>
                            </div>
                            <div class="col-12 d-flex justify-content-center">
                                <div class="btn-bank m-2" style="width: 90%">
                                    <button
                                        type="button"
                                        class="btn btn-secondary btn-block"
                                        style="text-align: left"
                                        disabled
                                    >
                                        012 台北富邦銀行(尚未開放)
                                    </button>
                                </div>
                            </div>

                            <!-- 第二段 -->
                            <div class="row content">
                                <div class="col-12 d-flex justify-content-center">
                                    <div class="m-2 text-center">
                                        <p class="h5" style="font-weight: bold">連結銀行帳戶</p>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="m-2">
                                        <p>綁定帳戶</p>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"></span>
                                        </div>
                                        <input
                                            id="bank_Id"
                                            name="bank_Id"
                                            type="text"
                                            class="form-control"
                                            placeholder="請輸入銀行帳號"
                                            maxlength="14"
                                            pattern="[0-9]{14}"
                                            aria-label="請輸入銀行帳號"
                                            aria-describedby="button-addon2"
                                        />
                                        <div class="input-group-append">
                                            <button
                                                class="change btn btn-outline-secondary"
                                                type="button"
                                                id="button-addon2"
                                            >
                                                選擇其他銀行
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="content m-2">
                                        <p>生日</p>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <input
                                        id="birthday"
                                        name="birthday"
                                        type="date"
                                        class="form-control"
                                        id="bookdate"
                                        value="1987-01-01"
                                    />
                                </div>
                                <div class="col-12">
                                    <div class="content m-2">
                                        <p>驗證碼</p>
                                    </div>
                                </div>

                                <div class="col-12 col-sm-9">
                                    <input
                                        id="captchaInput"
                                        name="captchaInput"
                                        type="text"
                                        class="form-control"
                                        maxlength="4"
                                        placeholder="請輸入驗證碼"
                                        pattern="[0-9A-Z]{4}"
                                    />
                                    <div class="mt-2" id="tishi"></div>
                                </div>
                                <div class="col-12 col-sm-3">
                                    <div>
                                        <img id="captcha" />
                                    </div>
                                    <div class="captchaLoading d-flex justify-content-center">
                                        <div id="loading_spinner" style="display: none"></div>
                                    </div>
                                    <p class="mt-1" style="font-size: 10px; font-weight: bold">點選更換驗證碼</p>
                                </div>
                            </div>

                            <!-- 第三段成功 -->
                            <div class="row successPage">
                                <div class="col-12 d-flex justify-content-center">
                                    <div class="m-2 text-center">
                                        <p class="h5" style="font-weight: bold">連結銀行帳戶</p>
                                    </div>
                                </div>
                                <div class="col-12 d-flex justify-content-center">
                                    <div class="m-2">
                                        <div class="success-checkmark">
                                            <div class="check-icon">
                                                <span class="icon-line line-tip"></span>
                                                <span class="icon-line line-long"></span>
                                                <div class="icon-circle"></div>
                                                <div class="icon-fix"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 d-flex justify-content-center">
                                    <div class="fadeIn">
                                        <p style="font-weight: bold">帳戶</p>
                                    </div>
                                </div>
                                <div class="col-12 d-flex justify-content-center">
                                    <div class="fadeIn">
                                        <p style="font-weight: bold">28881007434452</p>
                                    </div>
                                </div>
                                <div class="col-12 d-flex justify-content-center">
                                    <div class="fadeIn">
                                        <p style="font-weight: bold">綁定成功</p>
                                    </div>
                                </div>
                            </div>

                            <!-- 第四段失敗 -->
                            <div class="row errorPage">
                                <div class="col-12 d-flex justify-content-center">
                                    <div class="m-2 text-center">
                                        <p class="h5" style="font-weight: bold">連結銀行帳戶</p>
                                    </div>
                                </div>
                                <div class="col-12 d-flex justify-content-center">
                                    <div class="m-2">
                                        <div class="ui-error">
                                            <svg
                                                viewBox="0 0 87 87"
                                                version="1.1"
                                                xmlns="http://www.w3.org/2000/svg"
                                                xmlns:xlink="http://www.w3.org/1999/xlink"
                                            >
                                                <g
                                                    id="Page-1"
                                                    stroke="none"
                                                    stroke-width="1"
                                                    fill="none"
                                                    fill-rule="evenodd"
                                                >
                                                    <g id="Group-2" transform="translate(2.000000, 2.000000)">
                                                        <circle
                                                            id="Oval-2"
                                                            stroke="rgba(252, 191, 191, .5)"
                                                            stroke-width="4"
                                                            cx="41.5"
                                                            cy="41.5"
                                                            r="41.5"
                                                        ></circle>
                                                        <circle
                                                            class="ui-error-circle"
                                                            stroke="#F74444"
                                                            stroke-width="4"
                                                            cx="41.5"
                                                            cy="41.5"
                                                            r="41.5"
                                                        ></circle>
                                                        <path
                                                            class="ui-error-line1"
                                                            d="M22.244224,22 L60.4279902,60.1837662"
                                                            id="Line"
                                                            stroke="#F74444"
                                                            stroke-width="3"
                                                            stroke-linecap="square"
                                                        ></path>
                                                        <path
                                                            class="ui-error-line2"
                                                            d="M60.755776,21 L23.244224,59.8443492"
                                                            id="Line"
                                                            stroke="#F74444"
                                                            stroke-width="3"
                                                            stroke-linecap="square"
                                                        ></path>
                                                    </g>
                                                </g>
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 d-flex justify-content-center">
                                    <div class="fadeIn">
                                        <p style="font-weight: bold">帳戶</p>
                                    </div>
                                </div>
                                <div class="col-12 d-flex justify-content-center">
                                    <div class="fadeIn">
                                        <p class="responseBankAccount" style="font-weight: bold">28881007434452</p>
                                    </div>
                                </div>
                                <div class="col-12 d-flex justify-content-center">
                                    <div class="fadeIn d-flex justify-content-center">
                                        <p class="responseMessage"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <!-- 					<button type="button" class="btn" -->
                            <!-- 						data-dismiss="modal">關閉</button> -->
                            <button type="button" class="return btn btn-secondary">返回</button>
                            <button
                                type="submit"
                                id="nextBtn"
                                class="btn"
                                style="background-color: #00b386; color: white"
                            >
                                下一步
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Modal 編輯卡片-->
        <div
            class="modal fade"
            id="editCardModal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="editCardModalTitle"
            aria-hidden="true"
        >
            <div class="modal-dialog modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editCardModalTitle">編輯卡片</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form name="addBankAccountForm" id="addBankAccountForm">
                        <div id="allCards" class="modal-body row d-flex justify-content-center"></div>

                        <div class="modal-footer">
                            <button
                                type="button"
                                class="btn"
                                data-dismiss="modal"
                                style="background-color: #00b386; color: white"
                            >
                                關閉
                            </button>
                        </div>
                    </form>
                    <!-- 第三段成功 -->
                    <div class="row successUnlinkPage">
                        <div class="col-12 d-flex justify-content-center">
                            <div class="m-2 text-center">
                                <p class="h5" style="font-weight: bold">解綁銀行帳戶</p>
                            </div>
                        </div>
                        <div class="col-12 d-flex justify-content-center">
                            <div class="m-2">
                                <div class="success-checkmark">
                                    <div class="check-icon">
                                        <span class="icon-line line-tip"></span>
                                        <span class="icon-line line-long"></span>
                                        <div class="icon-circle"></div>
                                        <div class="icon-fix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 d-flex justify-content-center">
                            <div class="fadeIn">
                                <p style="font-weight: bold">帳戶</p>
                            </div>
                        </div>
                        <div class="col-12 d-flex justify-content-center">
                            <div class="fadeIn">
                                <p style="font-weight: bold">28881007434452</p>
                            </div>
                        </div>
                        <div class="col-12 d-flex justify-content-center">
                            <div class="fadeIn">
                                <p style="font-weight: bold">解綁成功</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Modal 刪除雙重確認 -->
        <!-- <div
            class="modal fade"
            id="confirm-delete"
            tabindex="-1"
            role="dialog"
            aria-labelledby="myModalLabel"
            aria-hidden="true"
        >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">
                            <b>刪除卡片</b>
                        </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>

                    <div class="h4 modal-body">
                        <p>您將刪除卡片, 此操作無法回復.</p>
                        <p>您確定要繼續嗎?</p>
                        <p class="debug-url"></p>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <a class="btn btn-danger btn-ok">刪除卡片</a>
                    </div>
                </div>
            </div>
        </div> -->

        <!-- Footer -->
        <%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>

        <!--玉山Logo -->
        <c:url var="esun_logo_url" value="/resources/img/esun.png" />
        <c:set var="imgUrl_esun" value="${esun_logo_url}" />

        <!--富邦Logo -->
        <c:url var="fubon_logo_url" value="/resources/img/fubon.png" />
        <c:set var="imgUrl_fubon" value="${fubon_logo_url}" />

        <!--masterCard -->
        <c:url var="masterCard_logo_url" value="/resources/img/masterCard.png" />
        <c:set var="imgUrl_masterCard" value="${masterCard_logo_url}" />

        <!--visa -->
        <c:url var="visa_logo_url" value="/resources/img/visa.png" />
        <c:set var="imgUrl_visa" value="${visa_logo_url}" />

        <script type="text/javascript">
            function init() {
                getLinkedBank() //取得卡片
            }

            function bankInit() {
                $('.btn-bank').fadeIn(300) //顯示銀行選擇
                $('.content').hide() //隱藏表單
                $('.successPage').hide() //隱藏成功頁面與成功字樣
                $('.errorPage').hide() //隱藏失敗頁面與失敗字樣
                $('.fadeIn').hide()
                $('.return').hide() //隱藏返回
                $('#nextBtn').hide() //隱藏下一步

                $('#tishi').html('') //reset
                $('#nextBtn').attr('disabled', 'disabled') //reset
            }

            function formInit() {
                $('.btn-bank').hide() //銀行隱藏
                $('.content').show() //顯示表單與返回
                $('.return').show()
                $('#nextBtn').show() //顯示下一步並停用之
                $('#nextBtn').attr('disabled', 'disabled')
            }

            function successInit() {
                $('.btn-bank').hide() //銀行隱藏
                $('.content').hide() //表單隱藏
                $('.return').hide()
                $('.successPage').show() //顯示成功頁面
                $('.fadeIn').fadeIn(1000)
                $('#nextBtn').hide() //隱藏下一步
            }

            function failInit() {
                $('.btn-bank').hide() //銀行隱藏
                $('.content').hide() //表單隱藏
                $('.return').hide()
                $('.errorPage').show() //顯示失敗頁面
                $('.fadeIn').fadeIn(1000)
                $('#nextBtn').hide() //隱藏下一步
            }

            //編輯卡片btn
            function modalEditBankBtnInit(status) {
                if (status) {
                    $('#modalEditBank').show()
                } else {
                    $('#modalEditBank').hide()
                }
            }
            //編輯卡片
            function unlinkInit() {
                $('#allCards').show()
                $('.successUnlinkPage').hide() //隱藏成功頁面與成功字樣
                $('.fadeIn').hide()
            }

            function successUnlinkInit() {
                $('#allCards').hide() //卡片s隱藏
                $('.successUnlinkPage').show() //顯示成功頁面
                $('.fadeIn').fadeIn(1000)
            }

            //getLinkedBank(真實所有卡片資料)
            async function getLinkedBank() {
                try {
                    //loading
                    loadingCard()
                    const currentUser = await instance.get('/api/getCurrentUser')
                    const response = await instance.get('/api/getLinkedBank')
                    console.log('response.data:' + response)
                    console.log('currentUser.data.info.name:' + currentUser.data.info.name)

                    //初始讀取卡片陣列
                    createCards(response.data.banks, currentUser.data.info.name)

                    //編輯卡片陣列
                    editCards(response.data.banks)
                } catch (error) {
                    console.log('error: ' + error)
                }
            }

            //linkBank(真實卡片綁定)
            async function linkBank(bank_code, account, birth, e_account) {
                try {
                    loadingForm()
                    const currentUser = await instance.get('/api/getCurrentUser')
                    const response = await instance.post('/api/linkBank', {
                        //測資
                        bank_code,
                        account,
                        birth,
                        e_account: currentUser.data.info.e_account,
                    })

                    console.log('linkBank綁定: ' + response.data)

                    if (response.data.status == '402') {
                        $('.responseMessage').html(response.data.message)
                        console.log('link電支端402： ' + response.data.message)
                        failInit() //顯示失敗
                    } else if (response.data.status == '401') {
                        $('.responseMessage').html(response.data.message)
                        console.log('link銀行端401： ' + response.data.message)
                        failInit() //顯示失敗
                    } else if (response.data.status == '200') {
                        successInit() //顯示成功
                    }
                } catch (error) {
                    $('.responseMessage').html(
                        '<p style="font-weight:bold">' +
                            error.response.data.status +
                            error.response.data.message +
                            '</p><p style="text-align:center">請稍後在試</p>'
                    )
                    console.log('catch error： ' + error.response.data.message)
                    failInit() //顯示失敗
                }
            }

            //unlinkBank(真實卡片解綁)
            async function unlinkBank(bank_account) {
                try {
                    const currentUser = await instance.get('/api/getCurrentUser')
                    const response = await instance.put('/api/unlinkBank', {
                        bank_account,
                        e_account: currentUser.data.info.e_account,
                    })

                    console.log('unlinkBank: ' + response.data)

                    if (response.data.status === 402) {
                        //failInit()
                        console.log('unlinkbank error: 402')
                    } else if (response.data.status === 401) {
                        //failInit()
                        console.log('unlinkbank error: 401')
                    } else if (response.data.status === 200) {
                        unlinkBankInit()
                        console.log('unlinkbank error: 200')
                    } else {
                        console.log('unlinkbank error: 非200 401 402')
                    }
                } catch (error) {
                    console.log('unlinkbank error: ' + error)
                }
            }

            //loading相關
            function loadingCard() {
                //範例檔
                var cardHtml =
                    '<div class="d-flex justify-content-center align-items-center h-100"><div class="col-12 pt-5 col-sm-12 py-sm-0 d-flex justify-content-center"style="width: 100vw"><div id="loading_spinner"></div></div></div>'

                $('.cardDefault').html(cardHtml)
                $('.carousel-indicators').html('')

                //複製前先顯示default資料
                $('.cardDefault').show()
                $('.indicatorDefault').show()
            }

            function loadingCaptcha() {
                $('#loading_spinner').fadeIn(500)
                $('#captcha').hide() //圖
            }

            function loadedCaptcha() {
                $('#captcha').fadeIn(300) //圖
                $('#loading_spinner').hide()
            }

            function loadingForm() {
                $('#bank_Id').attr('disabled', true)
                $('#birthday').attr('disabled', true)
                $('#captchaInput').attr('disabled', true)
                //按鈕loading
                $('#nextBtn').html(
                    '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>確認中...'
                )
            }

            //建立卡片s(由getLinkedBank呼叫)
            //若資料為[] 渲染假資料
            function createCards(banks, name) {
                if (banks.length == 0) {
                    console.log('no data!' + banks)

                    //範例檔
                    var cardHtml =
                        '<div class="d-flex justify-content-center align-items-center h-100"><div class="col-12 pt-5 col-sm-12 py-sm-0 d-flex justify-content-center"style="width: 100vw"><div class="card" style="border: 0; min-width: 320px; min-height: 190px; max-width: 320px; max-height: 190px; width: calc(30vw - 20px); height: calc(( 30vw - 20px)* 0.5625);"><div class="card__front add_card__part" style="width: 100%; height: 100%;"><div style="width: 100%; float: left;"><span class="h5 " style="text-align: center; color: white">新增銀行帳戶<i class="fas fa-plus"></i></span></div></div></div></div></div>'
                    var indicatorHtml =
                        '<li height: 15px; border-radius: 100%; background-color: black"data-target="#carouselExampleInterval" data-slide-to="0"class="indicatorDefault "></li>'
                    $('.cardDefault').html(cardHtml)
                    $('.carousel-indicators').html(indicatorHtml)

                    //複製前先顯示default資料
                    $('.cardDefault').show()
                    $('.indicatorDefault').show()
                    for (var i = 0; i < 1; i++) {
                        //新增n張卡片
                        $('.cardDefault')
                            .clone()
                            .removeClass('active cardDefault')
                            .addClass('card' + i)
                            .appendTo('.carousel-inner')
                        $('.indicatorDefault')
                            .clone()
                            .removeClass('active indicatorDefault')
                            .addClass('indicator' + i)
                            .appendTo('.carousel-indicators')
                        $('.indicator' + i).attr('data-slide-to', i)
                        if (i == 0) {
                            $('.card0').addClass('active')
                            $('.indicator0').addClass('active')
                        }
                        //每張卡進行詳細資訊渲染
                        cardInfo(banks[i], i, name)
                    }
                    $('.cardDefault').hide()
                    $('.indicatorDefault').hide()
                } else {
                    //有已綁定卡片時，顯示編輯卡片
                    modalEditBankBtnInit(true)

                    //範例檔

                    var cardHtml =
                        '<div class="d-flex justify-content-center align-items-center h-100"><div class="col-12 pt-5 col-sm-12 py-sm-0 d-flex justify-content-center"style="width: 100vw"><div class="card"style="border: 0; min-width: 320px; min-height: 190px; max-width: 320px; max-height: 190px; width: calc(30vw - 20px); height: calc(( 30vw - 20px)* 0.5625);"><div class="card__front card__part" style="width: 100%; height: 100%"><img class="card__front-square card__square" src="<c:url value="/resources/img/esun.png"/>"> <img class="card__front-logo card__logo" src="<c:url value="/resources/img/touch.png"/>"><p class="card_numer">******** 0000</p><div class="card__space-75"><span class="card__label">卡片持有人</span><p class="card__info">彭麟翔</p></div><div class="card__space-25"><div><img class="institution"src="<c:url value="/resources/img/masterCard.png"/>"height="50px"></div></div></div></div></div></div>'
                    var indicatorHtml =
                        '<li style="display: none; width: 15px; height: 15px; border-radius: 100%; background-color: black"data-target="#carouselExampleInterval" data-slide-to="0"class="indicatorDefault "></li>'
                    $('.cardDefault').html(cardHtml)
                    $('.carousel-indicators').html(indicatorHtml)

                    //複製前先顯示default資料
                    $('.cardDefault').show()
                    $('.indicatorDefault').show()

                    var num = banks.length
                    for (var i = 0; i < num; i++) {
                        //新增n張卡片
                        $('.cardDefault')
                            .clone()
                            .removeClass('active cardDefault')
                            .addClass('card' + i)
                            .appendTo('.carousel-inner')
                        $('.indicatorDefault')
                            .clone()
                            .removeClass('active indicatorDefault')
                            .addClass('indicator' + i)
                            .appendTo('.carousel-indicators')
                        $('.indicator' + i).attr('data-slide-to', i)
                        if (i == 0) {
                            $('.card0').addClass('active')
                            $('.indicator0').addClass('active')
                        }
                        //每張卡進行詳細資訊渲染
                        cardInfo(banks[i], i, name)
                    }
                    $('.cardDefault').hide()
                    $('.indicatorDefault').hide()
                }

                //刪除範例以正確顯示頁面
                $('.cardDefault').remove()
                $('.indicatorDefault').remove()
            }

            //卡片詳細資訊
            function cardInfo(data, new_index, name) {
                console.log('CARDINFO:' + name)
                // var local_bank = data.bank;
                // var local_card_numer = data.card_numer;
                // var local_user = data.user;
                // var local_intitution = data.intitution;

                var local_bank = data.bankCode
                var local_card_numer = data.bankAddress
                var local_user = name
                var local_intitution = 'masterCard'

                //銀行
                if (local_bank == '012') {
                    $('.card' + new_index)
                        .find('.card__front-square')
                        .attr('src', '${imgUrl_fubon}')
                } else if (local_bank == '808') {
                    $('.card' + new_index)
                        .find('.card__front-square')
                        .attr('src', '${imgUrl_esun}')
                } else {
                    $('.card' + new_index)
                        .find('.card__front-square')
                        .attr('src', '')
                }
                //卡號(去識別化)
                var trim_Id = '********' + local_card_numer.slice(10)
                $('.card' + new_index)
                    .find('.card_numer')
                    .html(trim_Id)

                //持卡人(留第一位與最後位) (by session name)
                var trim_Name = local_user.slice(0, 1) + '*' + local_user.slice(-1)
                $('.card' + new_index)
                    .find('.card__info')
                    .html(trim_Name)

                //機構(default)
                if (local_intitution == 'masterCard') {
                    $('.card' + new_index)
                        .find('.institution')
                        .attr('src', '${imgUrl_masterCard}')
                } else if (local_intitution == 'visa') {
                    $('.card' + new_index)
                        .find('.institution')
                        .attr('src', '${imgUrl_visa}')
                } else {
                    $('.card' + new_index)
                        .find('.institution')
                        .attr('src', '')
                }
            }

            //編輯卡片(由getLinkedBank呼叫)
            //若資料為[] 渲染假資料
            function editCards(data) {
                if (data.length != 0) {
                    $('#allCards').html('')

                    //範例檔
                    var cardHtml =
                        '<div id="editCardsdefault" class="unlinkBankBtn m-2 col-12 d-flex justify-content-center"> <button type="button" class="btn btn-secondary btn-block"  data-toggle="modal" data-id="#" data-target="#confirm-delete" style="text-align: left; width: 90%" > <i class="far fa-trash-alt"></i> xxxxxxxxxxxxxxxx </button> </div>'
                    $('#allCards').html(cardHtml)

                    var num = data.length
                    for (var i = 0; i < data.length; i++) {
                        //新增n張卡片
                        $('#editCardsdefault').clone().attr('id', data[i].bankAddress).appendTo('#allCards')
                        $('#' + data[i].bankAddress)
                            .children()
                            .attr('data-id', data[i].bankAddress)
                            .html('<i class="far fa-trash-alt"></i> ' + data[i].bankAddress)
                    }
                    $('#editCardsdefault').remove()
                } else {
                    console.log('你的資料是空的!' + data)
                }
            }

            //獲取驗證碼
            function getCaptcha() {
                loadingCaptcha()
                $.ajax({
                    url: 'http://172.19.35.133/api/getCode',
                    //url: 'http://172.19.35.133/exPay/api/getCode',
                    xhrFields: {
                        responseType: 'blob',
                        withCredentials: true,
                    },
                    crossDomain: true,
                    error() {
                        console.log('驗證碼載入失敗!')
                    },
                    success(data) {
                        loadedCaptcha()
                        const url = window.URL || window.webkitURL
                        const src = url.createObjectURL(data)
                        $('.captchaLoading').hide()
                        $('#captcha').attr('src', src)
                    },
                    complete() {
                        console.log('驗證碼載入結束')
                    },
                })
            }

            //驗證
            function validate() {
                var pwd1 = $('#captchaInput').val()
                if (pwd1.length == '4') {
                    $.ajax({
                        url: 'http://172.19.35.133/api/checkCode/' + pwd1,
                        //url: 'http://172.19.35.133/exPay/api/checkCode/' + pwd1,
                        xhrFields: {
                            withCredentials: true,
                        },
                        crossDomain: true,
                        error() {
                            console.log('錯誤!')
                        },
                        success(data) {
                            if (data.valid) {
                                $('#nextBtn').removeAttr('disabled')
                                $('#tishi').html('驗證碼正確')
                                $('#tishi').css('color', 'green')
                            } else {
                                $('#nextBtn').attr('disabled', 'disabled')
                                $('#tishi').html('驗證碼錯誤')
                                $('#tishi').css('color', 'red')
                            }
                        },
                    })
                } else {
                    $('#tishi').html('')
                    $('#nextBtn').attr('disabled', 'disabled')
                }
            }

            $(document).ready(function () {
                //當按下刪除卡片時
                $(document).on('click', '.unlinkBankBtn', function (event) {
                    //刪除雙重確認(modal)
                    // $('#confirm-delete').on('show.bs.modal', function (e) {
                    //     //取data-xxx的值並塞屬性給(.btn_ok)
                    //     $(this).find('.btn-ok').attr('id', $(e.relatedTarget).data('id'))
                    //     //塞文字到(.debug-url)
                    //     $('.debug-url').html('銀行卡號:  <strong>' + $(e.relatedTarget).data('id') + '</strong>')

                    //     console.log($(e.relatedTarget).data('id'))
                    // })

                    //解綁api
                    unlinkBank($(this).attr('id'))
                })

                //後端資料渲染
                init()

                //預設隱藏編輯卡片
                modalEditBankBtnInit(false)

                //啟動新增卡片modal時
                $('#modalBank').click(function () {
                    bankInit()
                })

                //啟動編輯卡片modal時
                $('#modalEditBank').click(function () {
                    unlinkInit()
                })

                //選擇任一銀行後
                $('.btn-bank').click(function () {
                    $('.input-group-text').text($(this).children('button').text()) //填入預設銀行
                    getCaptcha() //取驗證碼API
                    formInit()
                })
                //更換其他銀行
                $('.change').click(function () {
                    bankInit()
                })
                //返回上一層以更換銀行
                $('.return').click(function () {
                    bankInit()
                })

                //監測到輸入驗證碼時，進行驗證
                document.getElementById('captchaInput').onkeyup = function () {
                    validate()
                }

                //點案圖片更換驗證碼
                $('#captcha').click(function () {
                    $('#tishi').html('')
                    $('#nextBtn').attr('disabled', 'disabled')
                    getCaptcha()
                })

                //確認當前卡片張數(減去default)
                function checkCount() {
                    var count = $('.carousel-inner').children().length - 1
                    return count
                }

                $('#myModal1').on('shown.bs.modal', function () {
                    $('#textareaID1').focus()
                })
                //當form觸發時
                $('form').on('submit', function (event) {
                    event.preventDefault()
                    //console.log($(this).serialize());
                    console.log($('input[name="bank_Id"]').val())
                    console.log($('input[name="birthday"]').val())
                    console.log($('input[name="captchaInput"]').val())

                    $('.responseBankAccount').html($('input[name="bank_Id"]').val())

                    //呼叫api
                    linkBank(
                        '808',
                        '00' + $('input[name="bank_Id"]').val(),
                        $('input[name="birthday"]').val(),
                        '0210000001'
                    )

                    //重整form
                    $('#addBankAccountForm')[0].reset()
                })

                //每次關閉modal重整
                $('#exampleModalScrollable,#editCardModal').on('hidden.bs.modal', function () {
                    location.reload()
                })
            })
        </script>
    </body>
</html>
