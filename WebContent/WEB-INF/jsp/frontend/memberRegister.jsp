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
					<form id="mem_register_form" autocomplete="off" method="post">
						<div class="row justify-content-start mt-3 text-center font-weight-bold"> 
							<div class="col-12">
								<h4>輸入基本資料</h4>
							</div>
						</div>
						<div class="row justify-content-start mt-3 mx-auto mx-md-5"> 
							<div class="col-12 col-md-3 px-md-2 text-center text-md-right font-weight-bold">
								<label for="identity">身分證字號：</label>
							</div>
							<div class="col-10 col-md-8 px-md-0 mx-auto mx-md-0">
								<input type="text" class="form-control" id="identity" name="identity" maxlength="10">
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>身分證不能為空白</p>
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>身分證格式錯誤</p>
							</div>
						</div>
						<div class="row justify-content-start mt-3 mx-auto mx-md-5"> 
							<div class="col-12 col-md-3 px-md-2 text-center text-md-right font-weight-bold">
									<label for="pwd">密碼：</label>
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
								<label for="confirm_pwd">確認密碼：</label>
							</div>
							<div class="col-10 col-md-8 px-md-0 mx-auto mx-md-0">
								<input type="password" class="form-control" id="confirm_pwd" name="confirm_pwd"  maxlength="16"> 
								<i class="far fa-eye toggle_regpassword" id="pwd2"></i>
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>確認密碼需與密碼相同</p>
							</div>
						</div>
						<div class="row justify-content-start mt-3 mx-auto mx-md-5"> 
							<div class="col-12 col-md-3 px-md-2 text-center text-md-right font-weight-bold">
								<label for="name">姓名：</label>
							</div>
							<div class="col-10 col-md-8 px-md-0 mx-auto mx-md-0">
								<input type="text" class="form-control" id="name" name="name"> 
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>姓名不能為空白</p>
							</div>
						</div>
						<div class="row justify-content-start mt-3 mx-auto mx-md-5">
							<div class="col-12 col-md-3 px-md-2 text-center text-md-right font-weight-bold">
								<label for="birthday">出生年月日：</label>
							</div>
							<div class="col-10 col-md-8 px-md-0 mx-auto mx-md-0">
								<div class="input-group input-group date mb-2 mr-sm-2">
									<input type="text" class="form-control" id="birthday"
										name="birthday">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<span class="input-group-addon"><i
												class="fas fa-calendar-alt"></i></span>
										</div>
									</div>
								</div>
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>出生年月日不能為空白</p>
							</div>
						</div>
						<div class="row justify-content-start mt-3 mx-auto mx-md-5"> 
							<div class="col-12 col-md-3 px-md-2 text-center text-md-right font-weight-bold">
								<label for="phone">手機：</label>
							</div>
							<div class="col-10 col-md-8 px-md-0 mx-auto mx-md-0">
								<input type="text" class="form-control" id="phone" name="phone" oninput="value=value.replace(/[^\d]/g,'')" maxlength="10">
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>手機不能為空白</p>
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>手機格式錯誤</p> 
							</div>
						</div>
						<div class="row justify-content-start mt-3 mx-auto mx-md-5"> 
							<div class="col-12 col-md-3 px-md-2 text-center text-md-right font-weight-bold">
								<label for="email">電子信箱：</label>
							</div>
							<div class="col-10 col-md-8 px-md-0 mx-auto mx-md-0">
								<input type="email" class="form-control" id="email" name="email"> 
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>電子信箱不能為空白</p>
							</div>
						</div>
						<div class="row justify-content-start mt-3 mx-auto mx-md-5">
							<div
								class="col-12 col-md-3 px-md-2 text-center text-md-right font-weight-bold">
								<label for="issue_year">發證日期：</label>
							</div>
							<div class="col-10 col-md-3 mb-2 px-md-1 mx-auto mx-md-0">
								<select class="form-control" id="issue_year" name="issue_year">
									<option value="">年</option>
									<option value="110">110</option>
									<option value="109">109</option>
									<option value="108">108</option>
									<option value="107">107</option>
									<option value="106">106</option>
									<option value="105">105</option>
									<option value="104">104</option>
									<option value="103">103</option>
									<option value="102">102</option>
									<option value="101">101</option>
									<option value="100">100</option>
									<option value="99">99</option>
									<option value="98">98</option>
									<option value="97">97</option>
									<option value="96">96</option>
									<option value="95">95</option>
									<option value="94">94</option>
								</select>
							</div>
							<div class="col-10 col-md-3 mb-2 px-md-1 mx-auto mx-md-0">
								<select class="form-control" id="issue_month" name="issue_month">
									<option value="">月</option>
									<option value="01">1</option>
									<option value="02">2</option>
									<option value="03">3</option>
									<option value="04">4</option>
									<option value="05">5</option>
									<option value="06">6</option>
									<option value="07">7</option>
									<option value="08">8</option>
									<option value="09">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select>
							</div>
							<div class="col-10 col-md-3 mb-2 px-md-1 mx-auto mx-md-0">
								<select class="form-control" id="issue_day" name="issue_day">
									<option value="">日</option>
									<option value="01">1</option>
									<option value="02">2</option>
									<option value="03">3</option>
									<option value="04">4</option>
									<option value="05">5</option>
									<option value="06">6</option>
									<option value="07">7</option>
									<option value="08">8</option>
									<option value="09">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
								</select>
							</div>
							<div class="col-10 col-md-3 mb-2 px-md-1 mx-auto mx-md-0">
							</div>
							<div class="col-10 col-md-8 mb-2 px-md-1 mx-auto mx-md-0">
								<p class="is_error issue_error"><i class="fas fa-exclamation mr-1"></i>發證日期不能為空白</p>
							</div>
						</div>
						<div class="row justify-content-start mt-3 mx-auto mx-md-5"> 
							<div class="col-12 col-md-3 px-md-2 text-center text-md-right font-weight-bold">
								<label for="issue_city">發證地點：</label>
							</div>
							<div class="col-10 col-md-8 mb-2 px-md-0 mx-auto mx-md-0">
								<select class="form-control" id="issue_city" name="issue_city">
									<option value="">請選擇</option>
									<option value="北市">北市</option>
									<option value="北縣">北縣</option>
									<option value="新北市">新北市</option>
									<option value="基市">基市</option>
									<option value="宜縣">宜縣</option>
									<option value="桃市">桃市</option>
									<option value="桃縣">桃縣</option>
									<option value="竹市">竹市</option>
									<option value="竹縣">竹縣</option>
									<option value="苗縣">苗縣</option>
									<option value="中市(升格)">中市(升格)</option>
									<option value="中市">中市</option>
									<option value="中縣">中縣</option>
									<option value="彰縣">彰縣</option>
									<option value="投縣">投縣</option>
									<option value="雲縣">雲縣</option>
									<option value="嘉市">嘉市</option>
									<option value="嘉縣">嘉縣</option>
									<option value="南市(升格)">南市(升格)</option>
									<option value="南市">南市</option>
									<option value="南縣">南縣</option>
									<option value="高市">高市</option>
									<option value="高縣">高縣</option>
									<option value="屏縣">屏縣</option>
									<option value="東縣">東縣</option>
									<option value="花縣">花縣</option>
									<option value="澎縣">澎縣</option>
									<option value="連江">連江</option>
									<option value="金門">金門</option>
								</select>
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>發證地點不能為空白</p>
							</div>
						</div>
						<div class="row justify-content-start mt-3 mx-auto mx-md-5"> 
							<div class="col-12 col-md-3 px-md-2 text-center text-md-right font-weight-bold">
								<label for="issue_type">領補換類別：</label>
							</div>
							<div class="col-10 col-md-8 mb-2 px-md-0 mx-auto mx-md-0">
								<select class="form-control" id="issue_type" name="issue_type">
									<option value="">請選擇</option>
									<option value="初發">初發</option>
									<option value="補發">補發</option>
									<option value="換發">換發</option>
								</select>
								<p class="is_error"><i class="fas fa-exclamation mr-1"></i>領補換類別不能為空白</p>
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
		$("#birthday,.input-group.date").datepicker({
			format : "yyyy-mm-dd",
			clearBtn : true,
			language : "zh-TW",
			orientation : "bottom auto",
			autoclose : true,
			toggleActive : true
		});

		$("#birthday").change(function() {
			console.log($("#birthday").val());
		})
		
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
		
		$("#mem_register_form").submit(function() {
			
			var identity = $('#identity')
			var password = $('#pwd')
			var confirm_password = $('#confirm_pwd')
			var name = $('#name')
			var birthday = $('#birthday')
			var phone = $('#phone')
			var email = $('#email')
			var issue_year = $('#issue_year')
			var issue_month = $('#issue_month')
			var issue_day = $('#issue_day')
			var issue_city = $('#issue_city')
			var issue_type = $('#issue_type')
			var result = true
			
	
			//檢查身分證
			
			regex = new RegExp("^[A-Z][1-2][0-9]{8}$");
			
			identity.siblings('.is_error').hide();
			
			if(identity.val().length < 1){
				identity.siblings('.is_error').eq(0).show();
				result = result && false;
			}else if(! regex.test(identity.val())){
				identity.siblings('.is_error').eq(1).show();
				result = result && false;		
			}else{
				identity.siblings('.is_error').hide();
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
			
			
			//檢查姓名
			
			if(name.val().length < 1){
				name.next('.is_error').show();
				result = result && false;
			}else{
				name.next('.is_error').hide();
				result = result && true;
			}
			
			
			//檢查生日
			
			if(birthday.val().length < 1){
				birthday.parents().siblings('.is_error').show();
				result = result && false;
			}else{
				birthday.parents().siblings('.is_error').hide();
				result = result && true;
			}
			
			//檢查手機
			
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
			
			//檢查電子信箱
			
			if(email.val().length < 1){
				email.next('.is_error').show();
				result = result && false;
			}else{
				email.next('.is_error').hide();
				result = result && true;
			}
			
			//檢查發證日期
			
			if(issue_year.val().length < 1 || issue_month.val().length < 1  || issue_day.val().length < 1){
				$('.issue_error').show();
				result = result && false;
			}else{
				$('.issue_error').hide();
				result = result && true;
			}
			
			//檢查發證地點
			
			if(issue_city.val().length < 1){
				issue_city.next('.is_error').show();
				result = result && false;
			}else{
				issue_city.next('.is_error').hide();
				result = result && true;
			}
			
			//檢查補換發
			
			if(issue_type.val().length < 1){
				issue_type.next('.is_error').show();
				result = result && false;
			}else{
				issue_type.next('.is_error').hide();
				result = result && true;
			}

			if(result){

				event.preventDefault();
				
				var requestURL = 'http://172.19.35.31/api/user/signup'
				var dataJSON = {}
				dataJSON['identity'] = $('#identity').val()
				dataJSON['password'] = $('#pwd').val()
				dataJSON['name'] = $('#name').val()
				dataJSON['birthday'] =  $('#birthday').val()
				dataJSON['phone'] =  $('#phone').val()
				dataJSON['email'] =  $('#email').val()
				dataJSON['issue_date'] =  $('#issue_year').val() + $('#issue_month').val() + $('#issue_day').val()
				dataJSON['issue_city'] =  $('#issue_city').val()
				dataJSON['issue_type'] =  $('#issue_type').val()
				
				$.ajax({
					url: requestURL,
					data: JSON.stringify(dataJSON),
					type: 'POST',
					dataType: 'json',
					contentType: 'application/json;charset=utf-8',
					success: function (returnData) {
						console.log("註冊成功")
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

