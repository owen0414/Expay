<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>本月額度</title>
<%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
</head>
<body>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

	<!-- Content -->
	<div class="content_container" style="height: auto; min-height: 450px">
		<!-- 本日支出 -->
		<div class="row mx-4 mx-md-2">
			<div class="col-12 col-md-5 quota_item mx-md-auto mt-4 px-0">
				<div class="row mx-3 mx-md-auto">
					<div class="col-12 font-weight-bold"><i class="fas fa-calendar-day font-blue mr-2"></i>本日支出</div>
					<div class="col-6">
						<p>已轉出</p>
						<p class="font-blue font-weight-bold">NT$ 15,000</span></p>
					</div>
					<div class="col-6 text-right">
						<p>剩餘額度</p>
						<p>NT$ 84,999</p>
					</div>
					<div class="col-12">
						<div class="progress">
							<div class="progress-bar" role="progressbar" style="width: 15%;"></div>
						</div>
					</div>
					<div class="col-6">
						<p>0</p>
					</div>
					<div class="col-6 text-right">
						<p>99,999</p>
					</div>
					<div class="col-12">
						<p>每日轉出金額上限 NT$ 99,999</p>
					</div>
				</div>
			</div>
			<!-- 本月支出-->
			<div class="col-12 col-md-5 quota_item mx-md-auto mt-4 px-0">
				<div class="row mx-3 mx-md-auto">
					<div class="col-12 font-weight-bold"><i class="far fa-calendar-alt font-blue mr-2"></i>本月支出</div>
					<div class="col-6">
						<p>已轉出</p>
						<p class="font-blue font-weight-bold">NT$ 10,000</p>
					</div>
					<div class="col-6 text-right">
						<p>剩餘額度</p>
						<p>NT$ 189,999</p>
					</div>
					<div class="col-12">
						<div class="progress">
							<div class="progress-bar" role="progressbar" style="width: 5%;"></div>
						</div>
					</div>
					<div class="col-6">
						<p>0</p>
					</div>
					<div class="col-6 text-right">
						<p>199,999</p>
					</div>
					<div class="col-12">
						<p>每月轉出金額上限 NT$ 199,999</p>
					</div>
					<div class="col-12">
						<hr class="quota_hr">
					</div>	
					<div class="col-6">
						<p>已轉出 + 付款</p>
						<p class="font-blue font-weight-bold">NT$ 100,001</p>
					</div>
					<div class="col-6 text-right">
						<p>剩餘額度</p>
						<p>NT$ 199,999</p>
					</div>
					<div class="col-12">
						<div class="progress">
							<div class="progress-bar" role="progressbar" style="width: 33%;"></div>
						</div>
					</div>
					<div class="col-6">
						<p>0</p>
					</div>
					<div class="col-6 text-right">
						<p>300,000</p>
					</div>
					<div class="col-12">
						<p>每月轉出 + 付款金額上限 NT$ 300,000</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row mx-4 mx-md-2">
			<!-- 本月收入-->
			<div class="col-12 col-md-5 quota_item mx-md-auto mt-4 mb-auto mb-md-4 px-0">
				<div class="row mx-3 mx-md-auto">
					<div class="col-12 font-weight-bold"><i class="fas fa-hand-holding-usd font-green mr-2"></i>本月收入</div>
					<div class="col-6">
						<p>已轉入 + 收款</p>
						<p class="font-green font-weight-bold">NT$ 170,000</p>
					</div>
					<div class="col-6 text-right">
						<p>剩餘額度</p>
						<p>NT$ 130,000</p>
					</div>
					<div class="col-12">
						<div class="progress">
							<div class="progress-bar" role="progressbar" style="width: 56%;"></div>
						</div>
					</div>
					<div class="col-6">
						<p>0</p>
					</div>
					<div class="col-6 text-right">
						<p>300,000</p>
					</div>
					<div class="col-12">
						<p>每月轉入 + 收款金額上限 NT$ 300,000</p>
					</div>
				</div>
			</div>
			<!-- 儲值-->
			<div class="col-12 col-md-5 quota_item mx-md-auto my-4 px-0">
				<div class="row mx-3 mx-md-auto">
					<div class="col-12 font-weight-bold"><i class="fas fa-dollar-sign font-green mr-2"></i>儲值額度</div>
					<div class="col-6">
						<p>已儲值</p>
						<p class="font-green font-weight-bold">NT$ 5,000</p>
					</div>
					<div class="col-6 text-right">
						<p>剩餘額度</p>
						<p>NT$ 45,000</p>
					</div>
					<div class="col-12">
						<div class="progress">
							<div class="progress-bar" role="progressbar" style="width: 10%;"></div>
						</div>
					</div>
					<div class="col-6">
						<p>0</p>
					</div>
					<div class="col-6 text-right">
						<p>50,000</p>
					</div>
					<div class="col-12">
						<p>儲值金額上限 NT$ 50,000</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>
</body>
</html>

