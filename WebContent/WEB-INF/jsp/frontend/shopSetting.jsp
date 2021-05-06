<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>店家資料維護</title>
	<%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
</head>
<body>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>
	
	<!-- Content -->
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-5">
				<form class="setting-form">
					<div class="card my-3">
						<ul class="list-group list-group-flush">
							<li class="list-group-item text-center">
								<h2>設定</h2>
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<label for="shop_name" class="d-block">商店名稱</label>
								<input type="text" name="shop_name" id="shop_name" class="form-control w-auto" />
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<label for="tax_id" class="d-block">商店統編</label>
								<input type="text" name="tax_id" id="tax_id" maxlength="8" class="form-control w-auto" />
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<label for="address" class="d-block">商店地址</label>
								<input type="text" name="address" id="address" class="form-control w-auto" />
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<label for="phone" class="d-block">手機</label>
								<input type="tel" name="phone" id="phone" maxlength="10" pattern="09[0-9]{8}" class="form-control w-auto" />
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<label for="email" class="d-block">Email</label>
								<input type="email" name="email" id="email" class="form-control w-auto" />
							</li>
							<li class="list-group-item">
								<a href="${pageContext.request.contextPath}/updatePassword">變更密碼</a>
							</li>
							<li class="list-group-item d-flex justify-content-end">
								<button type="button" class="btn btn-secondary" id="shop-btn">變更</button>
							</li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- ResultModal -->
	<%@ include file="/WEB-INF/jsp/frontend/resultModal.jsp"%>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>
	<script>
		store.subscribe(() => {
			const state = store.getState();
			console.log(state);
			
			if(state.request){
				const {shop_name, tax_id, address, phone, email} = state.request;
				$("#shop_name").val(shop_name);
				$("#tax_id").val(tax_id);
				$("#address").val(address);
				$("#phone").val(phone);
				$("#email").val(email);
			}
			
			if(state.response){
				renderModalBody(state.response, ({status, message, timestamp}) => {
					return `\${message}<br>`;
				}, ({status, message, timestamp}) => {
					return `\${message}<br>`;
				});
			}
		});
		$(document).ready(() => {
			//取得當前商店資料
			instance.get("/api/shopInfo/")
			.then(res => {
				store.dispatch({
					type: "FETCH",
					payload: res.data
				});
			})
			.catch(error => {
				handleError(error.response.data);
				console.log(error);
			});
			
			//修改商店資料
			$("#shop-btn").click(()=> {
				const taxIdRegExp = /[0-9]{8}/;
				
				let dataJSON = {};
				dataJSON['shop_name'] = $("#shop_name").val();
				dataJSON['tax_id'] = $("#tax_id").val();
				dataJSON['address'] = $("#address").val();
				dataJSON['phone'] = $("#phone").val();
				dataJSON['email'] = $("#email").val();
				
				if(!taxIdRegExp.test($("#tax_id").val())){
					alert("統編須為長度8字元及全數字!");
				} else if(!checkPhone($("#phone").val())){
					alert("手機不符格式!");
				} else if(!checkEmail($("#email").val())){
					alert("Email不符格式!");
				} else {
					instance.put("/api/shopInfo/", dataJSON)
					.then(res => {
						store.dispatch({
							type: "SUBMIT",
							payload: res.data
						});
					})
					.catch(error => {
						handleError(error.response.data);
						console.log(error);
					});
				}
			});
		});
	</script>
</body>
</html>

