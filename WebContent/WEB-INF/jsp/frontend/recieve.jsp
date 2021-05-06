<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
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
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-5">
				<h2 class="text-center my-3">收款</h2>
				<form>
					<div class="mb-3 mybox container">
						<div class="row">
							<ul class="col d-flex justify-content-between align-items-center">
								<li><label for="from_phone">對方手機:</label></li>
								<li><input type="tel" name="from_phone" id="from_phone" pattern="09[0-9]{8}" maxlength="10" placeholder="09xxxxxxxx" class="form-control" /></li>
							</ul>
						</div>
					</div>
					<div class="mb-3 mybox container">
						<div class="row mb-3">
							<ul class="col d-flex flex-column align-items-center">
								<li class="mb-1 align-self-start"><label for="recieve_amount">收款金額<label></li>
								<li class="mb-1">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text">NT$</span>
										</div>
										<input type="number" id="recieve_amount" name="recieve_amount" min="1" max="50000" value="1" class="form-control">
									</div>	
								</li>
								<li class="mb-1">
									<button type="button" value="100" class="btn btn-secondary" id="plus-100">+100</button>
									<button type="button" value="1000" class="btn btn-secondary" id="plus-1000">+1000</button>
									<button type="button" value="10000" class="btn btn-secondary" id="plus-10000">+10000</button>
								</li>
							</ul>
						</div>
						<div class="row mb-3">
							<div class="col">
								<textarea id="note" class="form-control" rows="3" placeholder="收款備註" maxlength="50"></textarea>
							</div>
						</div>
						<div class="row">
							<div class="col">
								這會寄送收款通知給對方
							</div>
						</div>
					</div>
					<div class="mb-3 mybox container text-center">
						<div class="row">
							<div class="col">
								<img alt="對方電支帳戶" src="<c:url value="/resources/img/person2.png" />" id="e_account-icon">
								<span id="e_account-name">對方電支帳戶</span>
							</div>
							<div class="col d-flex justify-content-center">
								<img alt="箭頭" src="<c:url value="/resources/img/arrow.png" />" class="align-self-center">
							</div>
							<div class="col">
								<img alt="您的電支帳戶" src="<c:url value="/resources/img/person.jpg"/>">
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
			
			if(state.request){
				const {name} = state.request.from;
			    $("#e_account-name").text(name);
			}
			
			if(state.response){
				const { from: {name} } = state.request;
				const { info: {balance}} = state.e_account;
				const amount = parseInt($("#recieve_amount").val());
				const afterBalance = amount + balance;
				const note = $("#note").val();
				
				renderModalBody(state.response, ({status, message, timestamp}) => {
					return `
						付款者大名: \${name}<br>
						收款金額: NT\$\${numberWithCommas(amount)}<br>
						預計收款後餘額: NT\$\${numberWithCommas(afterBalance)}<br>
						收款備註: \${note}
					`;
				}, () => {
					return "收款通知失敗!";
				});
			}
		});
		
		//收款金額
		const setRecieveAmount = (value) => {
			if(value > 50000){
				$("#recieve_amount").val(50000);
			} else {
				$("#recieve_amount").val(value);
			}
		};
		
		//按鈕
		$(document).ready(()=>{
			$("#recieve_amount").change(function(e) {
				let amount = parseInt(e.target.value);
				setRecieveAmount(amount);
			});
			$("#plus-100").click(function(){
				let amount = parseInt($("#recieve_amount").val()) + 100;
				setRecieveAmount(amount);
			});
			$("#plus-1000").click(function(){
				let amount = parseInt($("#recieve_amount").val()) + 1000;
				setRecieveAmount(amount);
			});
			$("#plus-10000").click(function(){
				let amount = parseInt($("#recieve_amount").val()) + 10000;
				setRecieveAmount(amount);
			});
			
			//根據輸入的手機號碼抓取對方大名
			$("#from_phone").keyup(function() {
				let fromPhone = $("#from_phone").val();
				if(checkPhone(fromPhone)){
					let dataJSON = {};
					dataJSON["phone"] = fromPhone;
					dataJSON["role"] = "M";

					instance.post("/api/getEAccount", dataJSON)
					.then(res => {
						if(res.status === 200){
							const { name } = res.data;
							store.dispatch({
								type: "FETCH",
								payload: {from: {name}}
							});
						}else{
							alert("手機不存在!");
						}
					})
					.catch(error => {
						console.log(error);
					});
				} else{
					console.log("x");
				}
			});
			
			//收款
			$("#recieve-btn").click(() => {
				const remitter = $("#from_phone").val();
				const amount = parseInt($("#recieve_amount").val());
				const note = $('#note').val();
				
				if(!checkPhone(remitter)){
					alert("付款方手機不符格式!");
				} else if(amount < 0 || amount > 50000){
					alert("收款金額必須0~50000");
				} else if(note.length == 0 || note.length > 50){
					alert("收款備註字元需介於1~50字之間!");
				} else {
					let dataJSON = {};
					dataJSON["remitter"] = remitter;
					dataJSON["receiver"] = store.getState().e_account ? store.getState().e_account.info.phone : "0912345678";//TODO 抓使用者真實的手機
					dataJSON["amount"] = amount;
					dataJSON["note"] = note;
					dataJSON["type"] = "R";

					instance.post("/api/ePay/transaction", dataJSON)
					.then(res => {
						store.dispatch({
							type: "SUBMIT",
							payload: res.data
						});
					})
					.catch(error => {
						console.log(error);
					});
				}
			});
		});
		async function initFetch(){
			try{
				let res = await instance.get('/api/getCurrentUser');
				const { login } = res.data;
				if(!login){
					location.href=`${pageContext.request.contextPath}/user/login`;
					throw new Error("尚未登入!");
				}

				store.dispatch({
					type: 'FETCH_USER',
					payload: res.data
				});
			}catch(error){
				console.log(error);
			}
		}
	</script>
</body>
</html>

