<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>註冊頁</title>
<%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
</head>
<body>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

	<!-- Content -->
	<div class="login_container">
		<div class="row mx-4 mx-md-2 mb-5">
			<div class="col-12 col-md-5 register_item mx-md-auto mt-4 px-0">
					<form id="shop_register_form" autocomplete="off" method="post">
						<div class="row justify-content-start mt-3 text-center font-weight-bold"> 
							<div class="col-12">
								<h4>輸入基本資料</h4>
							</div>
						</div>
						<div class="row justify-content-start mt-3 mx-auto mx-md-5"> 
							<div class="col-12 col-md-3 px-md-2 text-center text-md-right font-weight-bold font-red">
								*為必填欄位
							</div>
						</div>
						<div class="row justify-content-start mt-3 mx-auto mx-md-5"> 
							<div class="col-12 col-md-3 px-md-2 text-center text-md-right font-weight-bold">
								<label for="id"><span class="font-red">*</span>帳號：</label>
							</div>
							<div class="col-10 col-md-8 px-md-0 mx-auto mx-md-0">
								<input type="text" class="form-control" id="id" name="id">
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>帳號不能為空白</p>
							</div>
						</div>
						<div class="row justify-content-start mt-3 mx-auto mx-md-5"> 
							<div class="col-12 col-md-3 px-md-2 text-center text-md-right font-weight-bold">
									<label for="pwd"><span class="font-red">*</span>密碼：</label>
							</div>
							<div class="col-10 col-md-8 px-md-0 mx-auto mx-md-0">
								<input type="password" class="form-control" id="pwd" name="pwd"  maxlength="16"> 
								<i class="far fa-eye toggle_regpassword" id="pwd1"></i>
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>密碼不能為空白</p>
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>密碼格式錯誤</p>
								<p class="font-red"><i class="fas fa-exclamation-circle mr-1"></i>密碼為8~16個字元，且至少包含一個英文字母及一個數字</p>
							</div>
						</div>
						<div class="row justify-content-start mt-3 mx-auto mx-md-5"> 
							<div class="col-12 col-md-3 px-md-2 text-center text-md-right font-weight-bold">
								<label for="confirm_pwd"><span class="font-red">*</span>確認密碼：</label>
							</div>
							<div class="col-10 col-md-8 px-md-0 mx-auto mx-md-0">
								<input type="password" class="form-control" id="confirm_pwd" name="confirm_pwd"  maxlength="16"> 
								<i class="far fa-eye toggle_regpassword" id="pwd2"></i>
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>確認密碼需與密碼相同</p>
							</div>
						</div>
						<div class="row justify-content-start mt-3 mx-auto mx-md-5"> 
							<div class="col-12 col-md-3 px-md-2 text-center text-md-right font-weight-bold">
								<label for="shop_name"><span class="font-red">*</span>商家名稱：</label>
							</div>
							<div class="col-10 col-md-8 px-md-0 mx-auto mx-md-0">
								<input type="text" class="form-control" id="shop_name" name="shop_name"> 
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>商家名稱不能為空白</p>
							</div>
						</div>
						<div class="row justify-content-start mt-3 mx-auto mx-md-5"> 
							<div class="col-12 col-md-3 px-md-2 text-center text-md-right font-weight-bold">
								<label for="tax_id">統一編號：</label>
							</div>
							<div class="col-10 col-md-8 px-md-0 mx-auto mx-md-0">
								<input type="text" class="form-control" id="tax_id" name="tax_id" oninput="value=value.replace(/[^\d]/g,'')" maxlength="8"> 
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>統一編號格式錯誤</p>
							</div>
						</div>
						<div class="row justify-content-start mt-3 mx-auto mx-md-5"> 
							<div class="col-12 col-md-3 px-md-2 text-center text-md-right font-weight-bold">
								<label for="phone"><span class="font-red">*</span>商家電話：</label>
							</div>
							<div class="col-10 col-md-8 px-md-0 mx-auto mx-md-0">
								<input type="text" class="form-control" id="phone" name="phone" oninput="value=value.replace(/[^\d]/g,'')" maxlength="10"> 
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>商家電話不能為空白</p>
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>商家電話格式錯誤</p>
							</div>
						</div>
						<div class="row justify-content-start mt-3 mx-auto mx-md-5"> 
							<div class="col-12 col-md-3 px-md-2 text-center text-md-right font-weight-bold">
								<label for="email"><span class="font-red">*</span>商家信箱：</label>
							</div>
							<div class="col-10 col-md-8 px-md-0 mx-auto mx-md-0">
								<input type="email" class="form-control" id="email" name="email"> 
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>商家信箱不能為空白</p>
							</div>
						</div>
						<div class="row justify-content-start mt-3 mx-auto mx-md-5"> 
							<div class="col-12 col-md-3 px-md-2 text-center text-md-right font-weight-bold">
								<label for="address"><span class="font-red">*</span>商家地址：</label>
							</div>
							<div class="col-12 col-md-8 px-md-0 ">
								<div id="twzipcode">
									<div class="row">
										<div class="col-12 col-md-6 mb-2">
											 <div data-role="county" data-style="form-control" data-id="county"></div>
										</div>
										<div class="col-12 col-md-6 mb-2">
											 <div data-role="district" data-style="form-control" data-id="district"></div>
										</div>
										<div class="col-12 mb-2">
											<input type="text" class="form-control" id="address" name="address" placeholder="路段號樓"  >
											<p class="is_error"><i class="fas fa-exclamation mr-1"></i>商家地址不能為空白</p>
										</div>
									</div>	
								</div>
							</div>
						</div>
						<div class="row justify-content-start my-4 mx-auto mx-md-5"> 
							<div class="col-10 col-md-8 mx-auto text-center">
								<button class="btn btn_shoplogin">完成</button>
							</div>
						</div>
					</form>
				</div>
			</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="errorModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalScrollableTitle">提示</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- 失敗 -->
					<div class="row errorPage">
						<div class="col-12 d-flex justify-content-center">
							<div class="m-2 text-center">
								<p class="h5 responseMessage" style="font-weight: bold"></p>
							</div>
						</div>
						<div class="col-12 d-flex justify-content-center">
							<div class="m-2">
								<div class="ui-error">
									<svg viewBox="0 0 87 87" version="1.1"
										xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink">
                                                <g id="Page-1"
											stroke="none" stroke-width="1" fill="none"
											fill-rule="evenodd">
                                                    <g id="Group-2"
											transform="translate(2.000000, 2.000000)">
                                                        <circle
											id="Oval-2" stroke="rgba(252, 191, 191, .5)" stroke-width="4"
											cx="41.5" cy="41.5" r="41.5"></circle>
                                                        <circle
											class="ui-error-circle" stroke="#F74444" stroke-width="4"
											cx="41.5" cy="41.5" r="41.5"></circle>
                                                        <path
											class="ui-error-line1"
											d="M22.244224,22 L60.4279902,60.1837662" id="Line"
											stroke="#F74444" stroke-width="3" stroke-linecap="square"></path>
                                                        <path
											class="ui-error-line2"
											d="M60.755776,21 L23.244224,59.8443492" id="Line"
											stroke="#F74444" stroke-width="3" stroke-linecap="square"></path>
                                                    </g>
                                                </g>
                                            </svg>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Footer -->
		<%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>
		<script>

		$("#pwd1").click(function() {
			
			  $(this).toggleClass("fa-eye-slash");
			  var pwd1 = $("#pwd");
			  
			  if (pwd1.attr("type") == "password") {
				  pwd1.attr("type", "text");
			  } else {
				  pwd1.attr("type", "password");
			  }
	
		});
		
		$("#pwd2").click(function() {
			
			  $(this).toggleClass("fa-eye-slash");
			  var pwd2 = $("#confirm_pwd");
			    
			  if (pwd2.attr("type") == "password") {
				  pwd2.attr("type", "text");
			  } else {
				  pwd2.attr("type", "password");
			  }
			  
		});
		
		$('#twzipcode').twzipcode({
			zipcodeIntoDistrict:true
		});
		
		//註冊失敗的提示
		
        function failInit() {
        	$("#errorModal").modal('show');
            $('.fadeIn').fadeIn(1000)
        }
		
		$("#shop_register_form").submit(function() {
			
			var id = $('#id')
			var password = $('#pwd')
			var confirm_password = $('#confirm_pwd')
			var shop_name = $('#shop_name')
			var phone = $('#phone')
			var email = $('#email')
			var tax_id = $('#tax_id')
			var county = $('#county')
			var district = $('#district')
			var address = $('#address')
			var result = true
			
			//檢查帳號
			
			if(id.val().length < 1){
				id.next('.is_error').show();
				result = result && false;
			}else{
				id.next('.is_error').hide();
				result = result && true;
			}
			
			//檢查密碼
			
			regex = new RegExp("^(?=.*[0-9])(?=.*[a-z])([a-zA-Z0-9]{8,16})$");
			
			password.siblings('.is_error').hide();
			
			if(password.val().length < 1){
				password.siblings('.is_error').eq(0).show();
				result = result && false;	
			}else if(! regex.test(password.val())){
				password.siblings('.is_error').eq(1).show();
				result = result && false;	
			}else{
				password.siblings('.is_error').hide();
				result = result && true;
			}
			
			//檢查確認密碼
			
			if(password.val().length >= 1 && password.val() != confirm_password.val()){
				confirm_password.siblings('.is_error').show();
				result = result && false;
			}else{
				confirm_password.siblings('.is_error').hide();
				result = result && true;
			}
			
			//檢查商家名稱
			
			if(shop_name.val().length < 1){
				shop_name.next('.is_error').show();
				result = result && false;
			}else{
				shop_name.next('.is_error').hide();
				result = result && true;
			}
			
			//檢查統一編號
			
			regex = new RegExp("[0-9]{8}$");
			
			if(tax_id.val().length >= 1 && ! regex.test(tax_id.val())){
				tax_id.next('.is_error').show();
				result = result && false;
			}else{
				tax_id.next('.is_error').hide();
				result = result && true;
			}	
			
			//檢查商家電話
			
			regex = new RegExp("^09[0-9]{8}$");
			
			phone.siblings('.is_error').hide();
			
			if(phone.val().length < 1){
				phone.siblings('.is_error').eq(0).show();
				result = result && false;
			}else if(! regex.test(phone.val())){
				phone.siblings('.is_error').eq(1).show();
				result = result && false;
			}else{
				phone.siblings('.is_error').hide();
				result = result && true;
			}
			
			//檢查商家信箱
			
			if(email.val().length < 1){
				email.next('.is_error').show();
				result = result && false;
			}else{
				email.next('.is_error').hide();
				result = result && true;
			}
			
			//檢查商家地址
			
			if(county.val().length < 1 || address.val().length < 1){
				address.next('.is_error').show();
				result = result && false;
			}else{
				address.next('.is_error').hide();
				result = result && true;
			}
			
			if(result){

				event.preventDefault();
				
				var requestURL = `${BASE_URL}/api/shop/signup`
				var dataJSON = {}
				dataJSON['id'] = id.val()
				dataJSON['password'] = password.val()
				dataJSON['shop_name'] = shop_name.val()
				dataJSON['tax_id'] =  tax_id.val()
				dataJSON['phone'] =  phone.val()
				dataJSON['email'] =  email.val()
				dataJSON['address'] =  county.val() + district.val() + address.val()
	
				$.ajax({
					url: requestURL,
					data: JSON.stringify(dataJSON),
					type: 'POST',
					dataType: 'json',
					contentType: 'application/json;charset=utf-8',
					success: function (returnData) {
						if(returnData.status == 200){
							location.href = "payment_password"
						}else if(returnData.status == 400){
						 $('.responseMessage').html(returnData.message)
	                       console.log(returnData.message)
	                       failInit() //顯示失敗
						}
					},
					error: function (xhr, ajaxOptions, thrownError) {
						console.log(xhr.status)
						console.log(thrownError)
					},
				})
			}else{
				return result;
			}	
		})
		
		
	</script>
</body>
</html>

