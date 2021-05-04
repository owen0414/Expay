<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>設定支付密碼</title>
<%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
</head>
<body>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

	<!-- Content -->
	<div class="login_container">
		<div class="row mx-4 mx-md-2 mb-5">
			<div class="col-12 col-md-5 login_item mx-md-auto mt-4 px-0">
					<form id="paymentpwd_form" autocomplete="off" method="post">
						<div class="row justify-content-start mt-4 text-center font-weight-bold"> 
							<div class="col-12">
								<h4>設定支付密碼</h4>
							</div>
						</div>
						<div class="row justify-content-start mt-4 mx-auto mx-md-5"> 
							<div class="col-12 col-md-4 px-md-2 text-center text-md-right font-weight-bold">
									<label for="pwd">支付密碼：</label>
							</div>
							<div class="col-10 col-md-8 px-md-0 mx-auto mx-md-0">
								<input type="password" class="form-control" id="pwd" name="pwd" maxlength="6"> 
								<i class="far fa-eye toggle_regpassword" id="pwd1"></i>
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>支付密碼不能為空白</p>
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>支付密碼格式錯誤</p>
								<p class="font-red"><i class="fas fa-exclamation-circle mr-1"></i>支付密碼須為6個數字</p>
							</div>
						</div>
						<div class="row justify-content-start mt-4 mx-auto mx-md-5"> 
							<div class="col-12 col-md-4 px-md-2 text-center text-md-right font-weight-bold">
								<label for="confirm_pwd">確認支付密碼：</label>
							</div>
							<div class="col-10 col-md-8 px-md-0 mx-auto mx-md-0">
								<input type="password" class="form-control" id="confirm_pwd" name="confirm_pwd" maxlength="6"> 
								<i class="far fa-eye toggle_regpassword" id="pwd2"></i>
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>確認密碼需與密碼相同</p>
							</div>
						</div>
						<div class="row justify-content-start my-4 mx-auto mx-md-5"> 
							<div class="col-10 col-md-8 mx-auto text-center">
								<button class="btn btn_memlogin">完成</button>
							</div>
						</div>
					</form>
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
		
		$("#paymentpwd_form").submit(function() {
			
			var password = $('#pwd')
			var confirm_password = $('#confirm_pwd')
			var result = true
			
			//檢查支付密碼
			
			regex = new RegExp("[0-9]{6}$");
			
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
			
			if(result){

				event.preventDefault();
				
				var requestURL = `${BASE_URL}/api/updateTPassword`
				var dataJSON = {}
				dataJSON['e_account'] = '0215215'
				dataJSON['transactionPwd'] = password.val()
				
				$.ajax({
					url: requestURL,
					data: JSON.stringify(dataJSON),
					type: 'POST',
					dataType: 'json',
					contentType: 'application/json;charset=utf-8',
					success: function (returnData) {
						if(returnData.status == 200){
							alert('設定密碼成功')
							location.href = "/Expay"
						}
						console.log(returnData)
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

