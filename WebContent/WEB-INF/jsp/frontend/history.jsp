<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>紀錄</title>
<%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
</head>
<body>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

	<!-- Content -->
	<div class="content_container" >
		<div class="row mx-5 mx-sm-auto">
			<div
				class="col-12 col-sm-3 money_container mx-sm-auto mt-5 px-0 text-center">
				<div>
					<p class="mt-5 px-5">NT$500</p>
				</div>
			</div>
		</div>
		<div class="mt-5 mx-4 mx-sm-auto">
			<div class="col-12 col-sm-6 mx-sm-auto mt-5 px-0 tab_content">
				<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
					<a class="tab_link nav-item nav-link active" id="nav-transaction-tab"
						data-toggle="tab" href="#nav-transaction" role="tab"
						aria-controls="nav-transaction" aria-selected="true">交易紀錄</a> <a
						class="nav-item nav-link tab_link" id="nav-account-tab"
						data-toggle="tab" href="#nav-account" role="tab"
						aria-controls="nav-account" aria-selected="false">帳戶紀錄</a>
				</div>
				<div class="tab-content px-5 px-sm-4" id="nav-tabContent">
					<!-- 交易紀錄  -->
					<div class="tab-pane fade show active my-5" id="nav-transaction"
						role="tabpanel" aria-labelledby="nav-transaction-tab">
						<div class="row justify-content-start">
							<div class="col-12  mx-auto mx-sm-5 px-0">電子帳戶</div>
						</div>
						<div class="row justify-content-start text-center">
							<div class="col-12 col-sm-10 mt-3 mx-auto mx-sm-5 account_number">
								XXXXXXXXXXXXXXXXXX</div>
						</div>
						<div class="row justify-content-start text-center">
							<div class="col-12 col-sm-4 mt-3 mx-sm-5 px-0">
								<select class="form-control">
									<option>最近一個月</option>
									<option>最近三個月</option>
									<option>最近一年</option>
								</select>
							</div>
						</div>
						<div id="transaction_history_area">
							<h4 class="text-center mt-3">沒有交易紀錄</h4>
						</div>
					</div>
					<!-- 帳戶紀錄  -->
					<div class="tab-pane fade" id="nav-account" role="tabpanel"
						aria-labelledby="nav-account-tab">
						<div class="row justify-content-start text-center condition_item">
							<div class="col-12 col-sm-4 mt-3 account_condition active">全部</div>
							<div class="col-12 col-sm-4 mt-3 account_condition">收入</div>
							<div class="col-12 col-sm-4 mt-3 account_condition">支出</div>
						</div>
						<div class="row justify-content-start text-center">
							<div class="col-12 col-sm-4 mt-3 mx-sm-5 px-0">
								<select class="form-control">
									<option>最近一個月</option>
									<option>最近三個月</option>
									<option>最近一年</option>
								</select>
							</div>
						</div>
						<div id="account_history_area">
							<h4 class="text-center mt-3">沒有帳戶異動紀錄</h4>
							<div class="row justify-content-start pay_item">
								<div
 									class="col-12 col-sm-10 my-3 mx-auto mx-sm-5 account_history">
									<div class="row">
										<div class="col-12 col-sm-6">
											<p id="account_history_time">2021-04-29 14:46:15</p>
											<p id="account_history_name">統一超商 (711)</p>
										</div>
										<div class="col-12 col-sm-6 text-sm-right">
											<p class="font-red" id="account_history_type">付款</p>
											<p class="font-red">NT$ <span id="account_history_amount">-100</span></p>
										</div>
									</div>
								</div>
							</div>
							<div class="row justify-content-start transfer_item">
								<div
 									class="col-12 col-sm-10 my-3 mx-auto mx-sm-5 account_history">
									<div class="row">
										<div class="col-12 col-sm-6">
											<p id="account_history_time">2021-04-29 14:46:15</p>
											<p id="account_history_name">張 * 程</p>
										</div>
										<div class="col-12 col-sm-6 text-sm-right">
											<p class="font-blue" id="account_history_type">轉帳</p>
											<p class="font-blue">NT$ <span id="account_history_amount">100</span></p>
										</div>
									</div>
								</div>
							</div>
							<div class="row justify-content-start deposit_item">
								<div
 									class="col-12 col-sm-10 my-3 mx-auto mx-sm-5 account_history">
									<div class="row">
										<div class="col-12 col-sm-6">
											<p id="account_history_time">2021-04-29 14:46:15</p>
											<p id="account_history_name"></p>
										</div>
										<div class="col-12 col-sm-6 text-sm-right">
											<p class="font-blue" id="account_history_type">儲值</p>
											<p class="font-blue">NT$ <span id="account_history_amount">1,000</span></p>
										</div>
									</div>
								</div>
							</div>
							<div class="row justify-content-start withdraw_item">
								<div
 									class="col-12 col-sm-10 my-3 mx-auto mx-sm-5 account_history">
									<div class="row">
										<div class="col-12 col-sm-6">
											<p id="account_history_time">2021-04-29 14:46:15</p>
											<p id="account_history_name"></p>
										</div>
										<div class="col-12 col-sm-6 text-sm-right">
											<p class="font-red" id="account_history_type">提領</p>
											<p class="font-red">NT$ <span id="account_history_amount">-200</span></p>
										</div>
									</div>
								</div>
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Transaction Modal -->
		<div class="modal fade" id="transaction_modal" tabindex="-1"
			role="dialog" aria-labelledby="transactionModalTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header text-center">
						<h5 class="modal-title text-center font-weight-bold" id="transactionModalTitle">交易紀錄明細</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body history_modal">
						<div class="container-fluid">
							<div class="col-12 font-weight-bold ">
								<h4 class="transaction_history_shopname"></h4>
							</div>
							<div class="col-12 mt-4">
								<p>付款日期<span class="font-weight-bold mx-2 transaction_history_time"></span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易號碼<span class="font-lightblue font-weight-bold mx-2 transaction_history_code"></span></p>
							</div>
							<div class="col-12 mt-2">
								<p>合計金額<span class="font-blue font-weight-bold mx-2 ">NT$ <span class="transaction_history_amount">60</span></span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Pay Modal -->
		<div class="modal fade" id="pay_modal" tabindex="-1"
			role="dialog" aria-labelledby="payModalTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header text-center">
						<h5 class="modal-title text-center font-weight-bold" id="payModalTitle">帳戶紀錄明細</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body pay_modal">
						<div class="container-fluid">
							<div class="col-12 mt-2">
								<p>交易類別   <span class="font-weight-bold px-2">付款</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易日期  <span class="font-weight-bold px-2">2021/04/03 12：14：21</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易編號  <span class="font-lightblue font-weight-bold px-2">e103620210403121421353</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易金額  <span class="font-red font-weight-bold px-2">NT$ -73</span></p>
							</div>
							<hr class="transaction_hr">
							<div class="col-12 mt-2">
								<p>訂單編號 <span class="font-weight-bold px-2">202105050948202554</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>商店名稱 <span class="font-weight-bold px-2">統一超商(711)</span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Transfer Modal -->
		<div class="modal fade" id="transfer_modal" tabindex="-1"
			role="dialog" aria-labelledby="transferModalTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header text-center">
						<h5 class="modal-title text-center font-weight-bold" id="transferModalTitle">帳戶紀錄明細</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body transfer_modal">
						<div class="container-fluid">
							<div class="col-12 mt-2">
								<p>交易類別   <span class="font-weight-bold px-2">轉帳</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易日期  <span class="font-weight-bold px-2">2021/04/03 12：14：21</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易編號  <span class="font-lightblue font-weight-bold px-2">e103620210403121421353</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易金額  <span class="font-red font-weight-bold px-2">NT$ -73</span></p>
							</div>
							<hr class="transaction_hr">
							<div class="col-12 mt-2">
								<p>轉入者 <span class="font-weight-bold px-2">張 * 程</span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Deposit Modal -->
		<div class="modal fade" id="deposit_modal" tabindex="-1"
			role="dialog" aria-labelledby="depositModalTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header text-center">
						<h5 class="modal-title text-center font-weight-bold" id="depositModalTitle">帳戶紀錄明細</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body deposit_modal">
						<div class="container-fluid">
							<div class="col-12 mt-2">
								<p>交易類別   <span class="font-weight-bold px-2">儲值</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易日期  <span class="font-weight-bold px-2">2021/04/03 12：14：21</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易編號  <span class="font-lightblue font-weight-bold px-2">e103620210403121421353</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易金額  <span class="font-blue font-weight-bold px-2">NT$ 73</span></p>
							</div>
							<hr class="transaction_hr">
							<div class="col-12 mt-2">
								<p>銀行名稱 <span class="font-weight-bold px-2">玉山銀行</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>銀行帳號 <span class="font-weight-bold px-2">808-00010789****9341</span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Withdraw Modal -->
		<div class="modal fade" id="withdraw_modal" tabindex="-1"
			role="dialog" aria-labelledby="withdrawModalTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header text-center">
						<h5 class="modal-title text-center font-weight-bold" id="withdrawModalTitle">帳戶紀錄明細</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body withdraw_modal">
						<div class="container-fluid">
							<div class="col-12 mt-2">
								<p>交易類別   <span class="font-weight-bold px-2">提領</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易日期  <span class="font-weight-bold px-2">2021/04/03 12：14：21</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易編號  <span class="font-lightblue font-weight-bold px-2">e103620210403121421353</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易金額  <span class="font-red font-weight-bold px-2">NT$ -73</span></p>
							</div>
							<hr class="transaction_hr">
							<div class="col-12 mt-2">
								<p>銀行名稱 <span class="font-weight-bold px-2">國泰世華銀行</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>銀行帳號 <span class="font-weight-bold px-2">013-00006995****5710</span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	<!-- Footer -->
	<%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>
	
	<script>

		$(".account_condition").click(function(){
			$(this).addClass('active');
			$(this).siblings().removeClass('active');
		})
		
		$(document).ready(function () {
			
			$(".pay_item").click(function(){
				$("#pay_modal").modal('show')
			})
			
			$(".transfer_item").click(function(){
				$("#transfer_modal").modal('show')
			})
			
			$(".deposit_item").click(function(){
				$("#deposit_modal").modal('show')
			})
			
			$(".withdraw_item").click(function(){
				$("#withdraw_modal").modal('show')
			})
		 
			var requestURL1 = `${BASE_URL}/api/transactionHistory`;
			
			$.ajax({
				url: requestURL1,
				type: 'GET',
				dataType: 'json',
				contentType: 'application/json;charset=utf-8',
				success: function (returnData) {			
					console.log(returnData)
					$("#transaction_history_area").children().remove()
					for(var i = 0; i < returnData.length ; i++){
						const { shop_name, time, amount} = returnData[i];
						$("#transaction_history_area").append(`
							<div class="row justify-content-start" id="transaction_history_item_\${i}">
								<div class="col-12 col-sm-10 my-3 mx-auto mx-sm-5 transaction_history">
									<div class="row">
										<div class="col-12 col-sm-6">
											<p>\${time}</p>
											<p>\${shop_name}</p>
										</div>
										<div class="col-12 col-sm-6 text-sm-right">
											<p>付款</p>
											<p>NT$ <span>\${numberWithCommas(amount)}</span></p>
										</div>
									</div>
								</div>
							</div>`);
						$("#transaction_history_item_" + i ).click(function(){
							$(".transaction_history_shopname").html(returnData[$(this).index()].shop_name)
							$(".transaction_history_time").html(returnData[$(this).index()].time)
							$(".transaction_history_code").html(returnData[$(this).index()].transaction_code)
							$(".transaction_history_amount").html(numberWithCommas(returnData[$(this).index()].amount))
							$("#transaction_modal").modal('show')
						})
					
					}
				},
				error: function (xhr, ajaxOptions, thrownError) {
					console.log(xhr.status)
					console.log(thrownError)
				},
			})
			
			var requestURL2 = `${BASE_URL}/api/eAccountHistory`;
			
			$.ajax({
				url: requestURL2,
				type: 'GET',
				dataType: 'json',
				contentType: 'application/json;charset=utf-8',
				success: function (returnData) {			
					console.log(returnData)
					$("#account_history_area").children().remove()
					for(var j = 0; j < returnData.length ; j++){
						
						if(returnData[j].type == 'S'){
							returnData[j].type = '付款'
						}else if(returnData[j].type == 'T'){
							returnData[j].type = '轉帳'
						}else if(returnData[j].type == 'D'){
							returnData[j].type = '儲值'
						}else if(returnData[j].type == 'W'){
							returnData[j].type = '提領'
						}
						
						const { name, time, amount,type} = returnData[j];
						$("#account_history_area").append(`
							<div class="row justify-content-start">
								<div class="col-12 col-sm-10 my-3 mx-auto mx-sm-5 account_history">
									<div class="row">
										<div class="col-12 col-sm-6">
											<p>\${time}</p>
											<p>\${name}</p>
										</div>
										<div class="col-12 col-sm-6 text-sm-right">
											<p class="type">\${type}</p>
											<p>NT$ <span class="amount">\${numberWithCommas(amount)}</span></p>
										</div>
									</div>
								</div>
							</div>`)
							
							if(amount < 0){
								$(".type").eq(j).addClass("font-red")
								$(".amount").eq(j).parent().addClass("font-red")
							}else{
								$(".type").eq(j).addClass("font-blue")
								$(".amount").eq(j).parent().addClass("font-blue")
							}
							
							if(type == '付款'){
								$(".account_history").eq(j).parent().addClass("pay_item")
							}else if(type == '轉帳'){
								$(".account_history").eq(j).parent().addClass("transfer_item")
							}else if(type == '儲值'){
								$(".account_history").eq(j).parent().addClass("deposit_item")
							}else if(type == '提領'){
								$(".account_history").eq(j).parent().addClass("withdraw_item")
							}
							
					}
				},
				error: function (xhr, ajaxOptions, thrownError) {
					console.log(xhr.status)
					console.log(thrownError)
				},
			})
	 })
	 
		
		
	</script>
</body>
</html>

