// $('body').css('padding-top', $('.navbar').outerHeight() + 'px')

// detect scroll top or down
if ($('.smart-scroll').length > 0) { // check if element exists
	
	var last_scroll_top = 0;
	$(window).on(
			'scroll',
			function() {
				scroll_top = $(this).scrollTop();
				// 避免手機版往上滑消失navbar問題
				if (scroll_top > 0 || last_scroll_top > 0) {
					if (scroll_top < last_scroll_top) {
						$('.smart-scroll').removeClass('scrolled-down')
								.addClass('scrolled-up');
					} else if (scroll_top > last_scroll_top) {
						$('.smart-scroll').removeClass('scrolled-up').addClass(
								'scrolled-down');
					}
				}

				last_scroll_top = scroll_top;
			});
}

// 隱藏按下的navbar button
$('.navbar-nav>li>a').on('click', function() {
	$('.navbar-collapse').collapse('hide');
});

//Toggle .header-scrolled class to #header when page is scrolled
$(window).scroll(function() {
  if ($(this).scrollTop() > 100) {
    $('#header').addClass('header-scrolled');
    $('.back-to-top').fadeIn('slow');
  } else {
    $('#header').removeClass('header-scrolled');
    $('.back-to-top').fadeOut('slow');
  }
});


$('.back-to-top').click(function() {
  $('html, body').animate({
    scrollTop: 0
  }, 1500, 'easeInOutExpo');
  return false;
});

// base url
const BASE_URL = "http://172.19.35.31/";

//儲值 提領
//抓取銀行帳號及餘額
const last5Address = (address) => {
	return address.slice(-5);
}

//銀行列表
const bankList = {
	"700": "中華郵政",
	"808": "玉山銀行"
};

//根據銀行類型不同，顯示不一樣的銀行名稱和值
const showBankAccountIconName = base_url => {
	$("#bank_account").change((e) => {
		const [bankCode, bankAddress] = e.target.value.split(",");
		switch(bankCode){
			case "700":
				$("#bank-icon").attr("src", `${base_url}/resources/img/post.jpg`);
				$("#bank-name").text("中華郵政");
				break;
			case "808":
				$("#bank-icon").attr("src", `${base_url}/resources/img/esun.png`);
				$("#bank-name").text("玉山銀行");
				break;
		}
	});
};

//axios設定
const instance = axios.create({
	baseURL: BASE_URL,
	Headers: {
		"Content-Type": "application/json"
	}
});

// redux
const { createStore } = Redux;

// reducer
const reducer = (state = {e_account: null, request: null, response: null}, action) => {
	switch(action.type){
	case "FETCH_USER":
		return {...state, e_account: {...state.e_account, ...action.payload}};
	case "FETCH":
		return {...state, request: {...state.request, ...action.payload}};
	case "SUBMIT":
		return {...state, response: {...state.response, ...action.payload}};
	default:
		return state;
	}
};

// createStore
const store = createStore(reducer);
