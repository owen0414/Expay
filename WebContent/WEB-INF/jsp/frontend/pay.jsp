<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
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
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-5">
				<h2 class="text-center my-3">付款</h2>
				<form>
					<div class="mb-3 mybox text-center">
						<div class="row">
							<ul class="col d-flex flex-row justify-content-between align-items-center">
								<li>
									<label for="store_phone">商家手機</label>
								</li>
								<li>
									<input type="tel" name="store_phone" id="store_phone" pattern="09[0-9]{8}" maxlength="10" class="form-control" placeholder="09xxxxxxxx"/>
								</li>
							</ul>
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
										<input type="number" id="pay_amount" name="pay_amount" min="1" max="50000" value="1" class="form-control" />
									</div>
								</li>
								<li class="mb-1">
									<button type="button" value="100" class="btn btn-secondary" id="plus-100">+100</button>
									<button type="button" value="1000" class="btn btn-secondary" id="plus-1000">+1000</button>
									<button type="button" value="10000" class="btn btn-secondary" id="plus-10000">+10000</button>
								</li>
								<li class="align-self-start">
									請向商家洽詢
								</li>
							</ul>
						</div>
					</div>
					<div class="mb-3 mybox container text-center">
						<div class="row">
							<div class="col">
								<img alt="您的電支帳戶" src="<c:url value="/resources/img/person.jpg"/>">
								<span>您的電支帳戶</span>
							</div>
							<div class="col d-flex justify-content-center">
								<img alt="箭頭" src="<c:url value="/resources/img/arrow.png" />" class="align-self-center">
							</div>
							<div class="col">
								<img alt="家樂福" src="<c:url value="/resources/img/shop.jpg" />" id="e_account-icon">
								<span id="e_account-name">家樂福</span>
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
		initFetch();
		
		store.subscribe(() => {
			const state = store.getState();
			console.log(state);
			
			if(state.request){
				if(state.request.from){
					const {balance} = state.request.from;
					$("#current-balance").text(balance);
				}
				
				if(state.request.to){
					const {name} = state.request.to;
			    	$("#e_account-name").text(name);
				}
			}
			
			if(state.response){
				renderModalBody(state.response, ({status, message, timestamp, name, amount, balance}) => {
					return `
						付款商家: \${name}<br>
						付款金額: NT\$\${amount}<br>
						付款後餘額: NT\$\${balance}
					`;
				}, () => {
					return "付款失敗!";
				});
			}
		});
	
		//付款金額
		const setPayWithDrawAmount = (value) => {
			let currentBalance = parseInt($("#current-balance").text());
			if(value > currentBalance){
				$("#pay_amount").val(currentBalance);
			} else {
				$("#pay_amount").val(value);
			}
		};
		
		//按鈕
		$(document).ready(()=>{
			$("#plus-100").click(function(){
				let amount = parseInt($("#pay_amount").val()) + 100;
				setPayWithDrawAmount(amount);
			});
			$("#plus-1000").click(function(){
				let amount = parseInt($("#pay_amount").val()) + 1000;
				setPayWithDrawAmount(amount);
			});
			$("#plus-10000").click(function(){
				let amount = parseInt($("#pay_amount").val()) + 10000;
				setPayWithDrawAmount(amount);
			});
			
			//根據輸入的手機號碼抓取對方大名
			$("#store_phone").keyup(function() {
				let storePhone = $("#store_phone").val();
				if(storePhone.length == 10){
					let dataJSON = {};
					dataJSON["phone"] = storePhone;

					instance.post("/api/getEAccount", dataJSON)
					.then(res => {
						const { name } = res.data;
						store.dispatch({
							type: "FETCH",
							payload: {to:{name}}
						});
					});
				} else{
					console.log("x");
				}
			});
			
			//付款
			$("#pay-btn").click(() => {
				let dataJSON = {};
				dataJSON["remitter"] = store.getState().e_account ? store.getState().e_account.phone : "0912345678";//TODO 抓使用者真實的手機
				dataJSON["receiver"] = $("#store_phone").val();
				dataJSON["amount"] = parseInt($("#pay_amount").val());
				dataJSON["type"] = "S";

				instance.post("/api/ePay/transaction", dataJSON)
				.then(res => {
					store.dispatch({
						type: "SUBMIT",
						payload: res.data
					});
				});
			});
		});
		
		async function initFetch(){
			let res = await instance.get("/api/getCurrentUser");
			store.dispatch({
				type: "FETCH_USER",
				payload: res.data
			});
			
			//先抓自己的餘額
			let dataJSON = {};
			dataJSON["phone"] = store.getState().e_account ? store.getState().e_account.phone : "0912345678";//TODO 抓使用者真實的手機

			res = await instance.post("/api/getMyEAccount", dataJSON)
			const {balance} = res.data;
			store.dispatch({
				type: "FETCH",
				payload: {from: {balance}}
			});
		}
	</script>
</body>
</html>

