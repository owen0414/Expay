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
								<input type="password" class="form-control" id="pwd" name="pwd"> 
								<i class="far fa-eye toggle_password" id="pwd1"></i>
							</div>
						</div>
						<div class="row justify-content-start mt-4 mx-auto mx-md-5"> 
							<div class="col-12 col-md-4 px-md-2 text-center text-md-right font-weight-bold">
								<label for="confirm_pwd">確認支付密碼：</label>
							</div>
							<div class="col-10 col-md-8 px-md-0 mx-auto mx-md-0">
								<input type="password" class="form-control" id="confirm_pwd" name="confirm_pwd"> 
								<i class="far fa-eye toggle_password" id="pwd2"></i>
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
	<!-- Jquery JS -->
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
	<!-- Vendor JS Files -->
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>
	<script src="<c:url value="/resources/vendor/bootstrap-datepicker/locales/bootstrap-datepicker.zh-TW.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.twzipcode.min.js"/>"></script>
	<!-- Custom JS -->
	<script type="text/javascript" src="<c:url value="/resources/js/custom.js"/>"></script>
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
		
	</script>
</body>
</html>

