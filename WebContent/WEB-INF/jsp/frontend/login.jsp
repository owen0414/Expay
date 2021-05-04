<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>登入</title>
<%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
</head>
<body>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

	<!-- Content -->
	<div class="login_container">
		<div class="row mx-4 mx-md-2">
			<div class="col-12 col-md-5 mx-md-auto mt-4 px-md-0 font-weight-bold text-center">
				<h4>登入</h4>
			</div>
		</div>
		<div class="row mx-4 mx-md-2 mb-5">
			<div class="col-12 col-md-5 login_item mx-md-auto mt-4 px-0">
				<!-- 個人登入 -->
				<div id="mem_item">
					<form id="mem_login_form" autocomplete="off" method="post">
						<div class="shop_lg text-center">切換商家</div>
						<div class="row justify-content-start mt-4 mx-auto mx-md-5"> 
							<div class="col-12 mx-3 mx-md-5 px-md-0">身分證字號</div>
						</div>
						<div class="row justify-content-start"> 
							<div class="col-10 col-md-8 mt-2 mx-auto">
								<input type="text" class="form-control" id="identity" name="identity" maxlength="10">
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>身分證不能為空白</p>
							</div>
						</div>
						<div class="row justify-content-start mt-4 mx-auto mx-md-5"> 
							<div class="col-12 mx-3 mx-md-5 px-md-0">密碼</div>
						</div>
						<div class="row"> 
							<div class="col-10 col-md-8 mt-2 mx-auto">
								<input type="password" class="form-control input_password" id="mem_pwd" name="mem_pwd" maxlength="16"> 
								<i class="far fa-eye toggle_password"></i>
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>密碼不能為空白</p>
							</div>
						</div>
						<div class="row justify-content-start mt-4 mx-auto mx-md-5"> 
							<div class="col-12 mx-3 mx-md-5 px-md-0">驗證碼</div>
						</div>
						<div class="row justify-content-start">
							<div class="col-10 col-md-8 mt-2 mx-auto">
								<input type="text" class="form-control">
							</div>
						</div>
						<div class="row justify-content-center mt-2"> 
							<div class="col-10 col-md-8">
								<div class="form-check form-check-inline">
									  <input class="form-check-input" type="checkbox" id="mem_remember" name="mem_remember" >
									  <label class="form-check-label" for="mem_remember">保持登入狀態</label>
								</div>
							</div>	
						</div>
						<div class="row justify-content-start mt-4 mx-auto mx-md-5"> 
							<div class="col-6 col-md-4 mx-3 mx-md-5 px-md-0">
								<a href="#" class="forget_password">忘記密碼？</a>
							</div>
						</div>
						<div class="row justify-content-start mx-auto mb-3"> 
							<div class="col-10 col-md-8 mx-auto text-center">
								<button class="btn btn_memlogin">登入</button>
							</div>
							<div class="col-10 col-md-8 mx-auto">
								<hr class="login_hr">
							</div>
							<div class="col-10 col-md-8 mx-auto text-center">
								<a class="btn btn_register" href="register">註冊</a>
							</div>
						</div>
					</form>
				</div>
				<!-- 商家登入 -->
				<div id="shop_item" style="display:none;">
					<form id="shop_login_form" autocomplete="off" method="post">
						<div class="mem_lg text-center">切換個人</div>
						<div class="row justify-content-start mt-4 mx-auto mx-md-5"> 
							<div class="col-12 mx-3 mx-md-5 px-md-0">帳號</div>
						</div>
						<div class="row justify-content-start"> 
							<div class="col-10 col-md-8 mt-2 mx-auto">
								<input type="text" class="form-control" id="id" name="id">
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>帳號不能為空白</p>
							</div>
						</div>
						<div class="row justify-content-start mt-4 mx-auto mx-md-5"> 
							<div class="col-12 mx-3 mx-md-5 px-md-0">密碼</div>
						</div>
						<div class="row"> 
							<div class="col-10 col-md-8 mt-2 mx-auto">
								<input type="password" class="form-control input_password" id="shop_pwd" name="shop_pwd" maxlength="16"> 
								<i class="far fa-eye toggle_password"></i>
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>密碼不能為空白</p>
							</div>
						</div>
						<div class="row justify-content-start mt-4 mx-auto mx-md-5"> 
							<div class="col-12 mx-3 mx-md-5 px-md-0">驗證碼</div>
						</div>
						<div class="row justify-content-start">
							<div class="col-10 col-md-8 mt-2 mx-auto">
								<input type="text" class="form-control">
							</div>
						</div>
						<div class="row justify-content-center mt-2"> 
							<div class="col-10 col-md-8">
								<div class="form-check form-check-inline">
									  <input class="form-check-input" type="checkbox" id="shop_remember" name="shop_remember" >
									  <label class="form-check-label" for="shop_remember">保持登入狀態</label>
								</div>
							</div>	
						</div>
						<div class="row justify-content-start mt-4 mx-auto mx-md-5"> 
							<div class="col-6 col-md-4 mx-3 mx-md-5 px-md-0">
								<a href="#" class="forget_password">忘記密碼？</a>
							</div>
						</div>
						<div class="row justify-content-start mx-auto mb-3"> 
							<div class="col-10 col-md-8 mx-auto text-center">
								<button class="btn btn_shoplogin">登入</button>
							</div>
							<div class="col-10 col-md-8 mx-auto">
								<hr class="login_hr">
							</div>
							<div class="col-10 col-md-8 mx-auto text-center">
								<a class="btn btn_register" href="register">註冊</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>	
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>
	<script>
	
		//login
	
		$(".toggle_password").click(function() {
			
			  $(this).toggleClass("fa-eye-slash");
			  var input = $(".input_password");
			  if (input.attr("type") == "password") {
			    input.attr("type", "text");
			  } else {
			    input.attr("type", "password");
			  }
			});
	
		$(".shop_lg").click(function() {
			$("#mem_item").hide();
			$("#shop_item").show();
			$(".toggle_password").removeClass("fa-eye-slash");
			$(".input_password").attr("type", "password");
			$("#mem_login_form")[0].reset();
		});
	
		$(".mem_lg").click(function() {
			$("#shop_item").hide();
			$("#mem_item").show();
			$(".toggle_password").removeClass("fa-eye-slash");
			$(".input_password").attr("type", "password");
			$("#shop_login_form")[0].reset();
		});
		
		//一般使用者登入
		
		$("#mem_login_form").submit(function(){
			
			var identity = $('#identity')
			var password = $('#mem_pwd')
			var result = true
			
			//檢查身分證有沒有填
			
			if(identity.val().length < 1){
				identity.next('.is_error').show();
				result = result && false;	
			}else{
				identity.next('.is_error').hide();
				result = result && true;
			}
			
			//檢查密碼有沒有填
			
			if(password.val().length < 1){
				password.siblings('.is_error').show();
				result = result && false;
			}else{
				password.siblings('.is_error').hide();
				result = result && true;
			}
			
			if(result){
				
				var requestURL = `${BASE_URL}/api/user/login`;
				var dataJSON = {}
				dataJSON['identity'] = identity.val()
				dataJSON['password'] = password.val()
				dataJSON['remember'] = $("#mem_remember").prop('checked')
				
				$.ajax({
					url: requestURL,
					data: JSON.stringify(dataJSON),
					type: 'POST',
					dataType: 'json',
					contentType: 'application/json;charset=utf-8',
					success: function (returnData) {
						console.log(returnData)
					},
					error: function (xhr, ajaxOptions, thrownError) {
						console.log(xhr.status)
						console.log(thrownError)
					},
				})
				
			}
			
			return false;
		})
		
		
		//商家登入
		
		$("#shop_login_form").submit(function(){
			
			var id = $('#id')
			var password = $('#shop_pwd')
			var result = true
			
			//檢查帳號有沒有填
			
			if(id.val().length < 1){
				id.next('.is_error').show();
				result = result && false;	
			}else{
				id.next('.is_error').hide();
				result = result && true;
			}
			
			//檢查密碼有沒有填
			
			if(password.val().length < 1){
				password.siblings('.is_error').show();
				result = result && false;
			}else{
				password.siblings('.is_error').hide();
				result = result && true;
			}
			
			if(result){
				
				var requestURL = 'http://172.19.35.31/api/shop/login'
				var dataJSON = {}
				dataJSON['identity'] = id.val()
				dataJSON['password'] = password.val()
				dataJSON['remember'] = $("#shop_remember").prop('checked')
				
				$.ajax({
					url: requestURL,
					data: JSON.stringify(dataJSON),
					type: 'POST',
					dataType: 'json',
					contentType: 'application/json;charset=utf-8',
					success: function (returnData) {
						console.log(returnData)
					},
					error: function (xhr, ajaxOptions, thrownError) {
						console.log(xhr.status)
						console.log(thrownError)
					},
				})
	
			}
			
			return false;
		})
	
		
	</script>
</body>
</html>

