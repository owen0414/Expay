<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
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
				<h2 class="text-center my-3">轉帳</h2>
				<form>
					<div class="mb-3 mybox">
						<label for="phone" class="d-block mb-1">收款方手機號碼:</label>
						<input type="tel" name="phone" id="phone" pattern="09[0-9]{8}" maxlength="10" class="form-control w-75 mx-auto" placeholder="09xxxxxxxx"/>
					</div>
					<div class="mb-3 mybox container">
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
										<input type="number" id="transfer_amount" name="transfer_amount" min="1" max="50000" value="1" class="form-control">
									</div>	
								</li>
								<li class="mb-1 w-75">
									<button type="button" value="100" class="btn btn-secondary" id="plus-100">+100</button>
								</li>
							</ul>
						</div>
						<div class="row">
							<div class="col">
								<hr />
							</div>
						</div>
						<div class="row text-center">
							<div class="col">
								<img alt="您的電支帳戶" src="<c:url value="/resources/img/person.jpg"/>">
								<span>您的電支帳戶</span>
							</div>
							<div class="col d-flex justify-content-center">
								<img alt="箭頭" src="<c:url value="/resources/img/arrow.png" />" class="align-self-center">
							</div>
							<div class="col">
								<img alt="彭小翔" src="<c:url value="/resources/img/person2.png" />">
								<span>彭小翔</span>
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
					<div class="mb-3 d-flex justify-content-end">
						<button class="btn btn-secondary">轉帳</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>
	<script>
		const setTransferAmount = (value) => {
			if(value > 50000){
				$("#transfer_amount").val(50000);
			} else {
				$("#transfer_amount").val(value);
			}
		};
		
		$(document).ready(()=>{
			$("#plus-100").click(function(){
				let amount = parseInt($("#transfer_amount").val()) + 100;
				setTransferAmount(amount);
			});

			setInterval(()=>{
				$("#nowtime").text(new Date());
			}, 1000);
		});
		
		var requestURL = "http://localhost/api/getLinkedBank";
		var dataJSON = {};
		dataJSON["identity"] = "F123456789";

		$.ajax({
		    url: requestURL,
		    data: JSON.stringify(dataJSON),
		    type: "POST",
		    dataType: "json",
		    contentType: "application/json;charset=utf-8",
		    success: function(returnData){
		        console.log(returnData);
		        alert(returnData.e_account);
		    },
		    error: function(xhr, ajaxOptions, thrownError){
		        console.log(xhr.status);
		        console.log(thrownError);
		    }
		});
		
	</script>
</body>
</html>

