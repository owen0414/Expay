//使用axios前請先設定
// BASE_URL
// const BASE_URL = 'http://172.19.35.133/'
const BASE_URL = "http://172.19.35.97/";
// const BASE_URL = "http://172.19.35.31/";

// $('body').css('padding-top', $('.navbar').outerHeight() + 'px')

// detect scroll top or down
if ($('.smart-scroll').length > 0) {
    // check if element exists

    var last_scroll_top = 0
    $(window).on('scroll', function () {
        scroll_top = $(this).scrollTop()
        // 避免手機版往上滑消失navbar問題
        if (scroll_top > 0 || last_scroll_top > 0) {
            if (scroll_top < last_scroll_top) {
                $('.smart-scroll').removeClass('scrolled-down').addClass('scrolled-up')
            } else if (scroll_top > last_scroll_top) {
                $('.smart-scroll').removeClass('scrolled-up').addClass('scrolled-down')
            }
        }

        last_scroll_top = scroll_top
    })
}

// 隱藏按下的navbar button
$('.navbar-nav>li>a').on('click', function () {
    $('.navbar-collapse').collapse('hide')
})

//Toggle .header-scrolled class to #header when page is scrolled
$(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
        $('.back-to-top').fadeIn('slow')
    } else {
        $('.back-to-top').fadeOut('slow')
    }
})

$('.back-to-top').click(function () {
    $('html, body').animate(
        {
            scrollTop: 0,
        },
        1500,
        'easeInOutExpo'
    )
    return false
})

//儲值 提領
//抓取銀行帳號及餘額
const last5Address = (address) => {
    return address.slice(-5)
}

//銀行列表
const bankList = {
    700: '中華郵政',
    808: '玉山銀行',
}

//根據銀行類型不同，顯示不一樣的銀行名稱和值
const showBankAccountIconName = (base_url) => {
    $('#bank_account').change((e) => {
        const [bankCode, bankAddress] = e.target.value.split(',')
        switch (bankCode) {
            case '700':
                $('#bank-icon').attr('src', `${base_url}/resources/img/post.jpg`)
                $('#bank-name').text('中華郵政')
                break
            case '808':
                $('#bank-icon').attr('src', `${base_url}/resources/img/esun.png`)
                $('#bank-name').text('玉山銀行')
                break
        }
    })
}

//axios設定
const instance = axios.create({
    baseURL: BASE_URL,
    Headers: {
        'Content-Type': 'application/json',
    },
})

// redux
const { createStore } = Redux

// reducer
const reducer = (state = { e_account: null, request: null, response: null }, action) => {
    switch (action.type) {
        case 'FETCH_USER':
            return { ...state, e_account: { ...state.e_account, ...action.payload } }
        case 'FETCH':
            return { ...state, request: { ...state.request, ...action.payload } }
        case 'SUBMIT':
            return { ...state, response: { ...state.response, ...action.payload } }
        default:
            return state
    }
}

// createStore
const store = createStore(reducer)

//手機、email正則表達
const phoneRegExp = /09[0-9]{8}/
const emailRegExp =
    /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

const checkPhone = (value) => phoneRegExp.test(value)
const checkEmail = (value) => emailRegExp.test(value)

//將數字加上千分位

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
}

function undoNumberWithCommas(value) {
    return value.toString().replace(',', '')
}

//將重要資訊加上*字號
function nameToStar(name) {
    var Newname = ''

    var length = name.length

    Newname = name.slice(0, 1)

    for (var i = 1; i < length - 1; i++) {
        Newname += '＊'
    }

    Newname += name.slice(length - 1)

    return Newname
}

// 手機號碼打星星
const phoneToStar = (phone) => {
    let tempPhone = phone + ''

    if (!checkPhone(tempPhone)) {
        throw new Error('手機不符格式!')
    }

    //中間三碼打星星
    return tempPhone.slice(0, 4) + '***' + tempPhone.slice(7)
}

//將電支碼加上*字
function eAccountToStar(eAccount) {
    var NeweAccount = ''

    var length = eAccount.length

    NeweAccount = '****' + eAccount.slice(length - 3)

    return NeweAccount
}

// 錯誤處理
const handleError = (errRes) =>
    renderModalBody(
        errRes,
        () => {},
        ({ status, message, timestamp }) => {
            return `${message}`
        }
    )
