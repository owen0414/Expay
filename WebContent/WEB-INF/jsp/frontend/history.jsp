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
					<a class="tab_link nav-item nav-link active" id="nav-home-tab"
						data-toggle="tab" href="#nav-home" role="tab"
						aria-controls="nav-home" aria-selected="true">交易紀錄</a> <a
						class="nav-item nav-link tab_link" id="nav-profile-tab"
						data-toggle="tab" href="#nav-profile" role="tab"
						aria-controls="nav-profile" aria-selected="false">帳戶紀錄</a>
				</div>
				<div class="tab-content px-5 px-sm-4" id="nav-tabContent">
					<!-- 交易紀錄  -->
					<div class="tab-pane fade show active my-5" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab">
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
						<div class="row justify-content-start">
							<div
								class="col-12 col-sm-10 my-3 mx-auto mx-sm-5 transaction_history">
								<div class="row">
									<div class="col-12 col-sm-6">
										<p>2021/04/20 13：25</p>
										<p>統一超商 ( 711 )</p>
									</div>
									<div class="col-12 col-sm-6 text-sm-right">
										<p>付款</p>
										<p>NT$ 60</p>
									</div>
								</div>
							</div>
						</div>
						<div class="row justify-content-start">
							<div
								class="col-12 col-sm-10 my-3 mx-auto mx-sm-5 transaction_history">
								<div class="row">
									<div class="col-12 col-sm-6">
										<p>2021/04/15 15：20</p>
										<p>50嵐(輔大店)</p>
									</div>
									<div class="col-12 col-sm-6 text-sm-right">
										<p>付款</p>
										<p>NT$ 50</p>
									</div>
								</div>
							</div>
						</div>
						<div class="row justify-content-start">
							<div
								class="col-12 col-sm-10 my-3 mx-auto mx-sm-5 transaction_history">
								<div class="row">
									<div class="col-12 col-sm-6">
										<p>2021/03/31 09：24</p>
										<p>momo購物網</p>
									</div>
									<div class="col-12 col-sm-6 text-sm-right">
										<p>付款</p>
										<p>NT$ 306</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 帳戶紀錄  -->
					<div class="tab-pane fade" id="nav-profile" role="tabpanel"
						aria-labelledby="nav-profile-tab">
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
						<div class="row justify-content-start">
							<div
								class="col-12 col-sm-10 my-3 mx-auto mx-sm-5 account_history account_history1">
								<div class="row">
									<div class="col-12 col-sm-6">
										<p>2021/04/20 13：25：30</p>
										<p>統一超商 (711)</p>
									</div>
									<div class="col-12 col-sm-6 text-sm-right">
										<p class="font-red">付款</p>
										<p class="font-red">NT$ -50</p>
										<p>餘額 NT $300</p>
									</div>
								</div>
							</div>
						</div>
						<div class="row justify-content-start">
							<div
								class="col-12 col-sm-10 my-3 mx-auto mx-sm-5 account_history account_history2">
								<div class="row">
									<div class="col-12 col-sm-6">
										<p>2021/04/03 12：14：21</p>
										<p>張  * 程</p>
									</div>
									<div class="col-12 col-sm-6 text-sm-right">
										<p class="font-red">轉帳</p>
										<p class="font-red">NT$ -73</p>
										<p>餘額 NT $350</p>
									</div>
								</div>
							</div>
						</div>
						<div class="row justify-content-start">
							<div
								class="col-12 col-sm-10 my-3 mx-auto mx-sm-5 account_history account_history3">
								<div class="row">
									<div class="col-12 col-sm-6">
										<p>2021/04/02 21：50：15</p>
										<p>呂 * 昊</p>
									</div>
									<div class="col-12 col-sm-6 text-sm-right">
										<p>轉帳</p>
										<p>NT$ 102</p>
										<p>餘額 NT $423</p>
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
					<div class="modal-body">
						<div class="container-fluid">
							<div class="col-12 font-weight-bold">711</div>
							<div class="col-12 mt-4">
								<p>付款日期<span class="font-weight-bold mx-2">2021/04/20 13：25</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易完成日期<span class="font-weight-bold  mx-2">2021/04/21 12：18</span></p>
							</div>
							<hr class="transaction_hr">
							<div class="col-12 mt-2">
								<p>交易號碼<span class="font-lightblue font-weight-bold  mx-2">2021042057399988010</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>付款方法<span class="font-weight-bold mx-2">EX Money</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>商品價格<span class="font-weight-bold mx-2">NT$ 60</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>合計金額<span class="font-blue font-weight-bold  mx-2">NT$ 60</span></p>
							</div>
							<hr class="transaction_hr">
							<div class="col-12 font-weight-bold">資訊來源為特約機構</div>
							<div class="col-12 mt-4">
								<p>訂單編號<span class="font-weight-bold  mx-2">20210420960535028937194132500</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>品牌名稱<span class="font-weight-bold  mx-2">統一超商</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>電子郵件帳號<span class="font-weight-bold  mx-2">public@mail.7-11.com.tw</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>電話<span class="font-weight-bold  mx-2">0800008711</span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Account Modal -->
		<div class="modal fade" id="account_modal" tabindex="-1"
			role="dialog" aria-labelledby="accountModalTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header text-center">
						<h5 class="modal-title text-center font-weight-bold" id="accountModalTitle">帳戶紀錄明細</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="container-fluid">
							<div class="col-12 mt-2">
								<p>交易類別   <span class="font-weight-bold px-2">轉帳</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易日期  <span class="font-weight-bold px-2">2021/04/03 12：14：21</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易序號  <span class="font-lightblue font-weight-bold px-2">e103620210403121421353</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易方式   <span class="font-weight-bold px-2">EX Money</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易金額  <span class="font-red font-weight-bold px-2">NT$ -73</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易後餘額 <span class="font-weight-bold px-2">NT$ 350</span></p>
							</div>
							<hr class="transaction_hr">
							<div class="col-12 mt-2">
								<p>轉入者 <span class="font-weight-bold px-2">張 * 程</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>備註</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Account Modal2 -->
		<div class="modal fade" id="account_modal2" tabindex="-1"
			role="dialog" aria-labelledby="accountModalTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header text-center">
						<h5 class="modal-title text-center font-weight-bold" id="accountModalTitle">帳戶紀錄明細</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="container-fluid">
							<div class="col-12 mt-2">
								<p>交易類別   <span class="font-weight-bold px-2">轉帳</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易日期  <span class="font-weight-bold px-2">2021/04/02 21：50：15</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易序號  <span class="font-lightblue font-weight-bold px-2">e239520210402215015780</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易方式   <span class="font-weight-bold px-2">EX Money</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易金額  <span class="font-blue font-weight-bold px-2">NT$ 102</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>交易後餘額 <span class="font-weight-bold px-2">NT$ 423</span></p>
							</div>
							<hr class="transaction_hr">
							<div class="col-12 mt-2">
								<p>轉出者 <span class="font-weight-bold px-2">呂 * 昊</span></p>
							</div>
							<div class="col-12 mt-2">
								<p>備註</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	<!-- Footer -->
	<%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>
	
	<script>
		$(".transaction_history").click(function(){
			$("#transaction_modal").modal('show');
			//第幾個元素
			//var index = $(".transaction_history").index(this);
			//console.log(index);
		})
		
		$(".account_history2,.account_history1").click(function(){
			$("#account_modal").modal('show');
			//第幾個元素
			//var index = $(".account_history").index(this);
			//console.log(index);
		})
		
		$(".account_history3").click(function(){
			$("#account_modal2").modal('show');
			//第幾個元素
			//var index = $(".account_history").index(this);
			//console.log(index);
		})
		
		$(".account_condition").click(function(){
			$(this).addClass('active');
			$(this).siblings().removeClass('active');
		})
		
	</script>
</body>
</html>

