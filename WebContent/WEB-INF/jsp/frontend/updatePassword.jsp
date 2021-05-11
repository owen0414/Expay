<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>修改密碼</title>
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
								<h2>修改登入密碼</h2>
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<label for="old_password" class="d-block">舊密碼</label>
								<input type="password" name="old_password" id="old_password" class="form-control w-auto" />
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<label for="password" class="d-block">新密碼</label>
								<input type="password" name="password" id="password" class="form-control w-auto" />
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<label for="password2" class="d-block">新密碼(再輸入一次)</label>
								<input type="password" name="password2" id="password2" class="form-control w-auto" />
							</li>
							<li class="list-group-item d-flex justify-content-end">
								<button type="button" class="btn btn-secondary" id="pw-btn">變更</button>
							</li>
						</ul>
					</div>
				</form>
				<form class="setting-form">
					<div class="card my-3">
						<ul class="list-group list-group-flush">
							<li class="list-group-item text-center">
								<h2>修改交易密碼</h2>
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<label for="old_tpassword" class="d-block">舊交易密碼</label>
								<input type="password" name="old_tpassword" id="old_tpassword" pattern="[0-9]{6}" maxlength="6" class="form-control w-auto" />
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<label for="tpassword" class="d-block">新交易密碼</label>
								<input type="password" name="tpassword" id="tpassword" pattern="[0-9]{6}" maxlength="6" class="form-control w-auto" />
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<label for="tpassword2" class="d-block">新交易密碼(再輸入一次)</label>
								<input type="password" name="tpassword2" id="tpassword2" pattern="[0-9]{6}" maxlength="6" class="form-control w-auto" />
							</li>
							<li class="list-group-item d-flex justify-content-end">
								<button type="button" class="btn btn-secondary" id="tpw-btn">變更</button>
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
		initFetch();

		store.subscribe(() => {
			const state = store.getState();
			console.log(state);
			
			if(state.response){
				renderModalBody(state.response, ({status, message, timestamp}) => {
					return `\${message}<br>`;
				}, ({status, message, timestamp}) => {
					return `\${message}<br>`;
				});
			}
		});
		$(document).ready(()=>{
			//修改密碼
			$("#pw-btn").click(() => {
				const oldPassword = $("#old_password").val();
				const password = $("#password").val();
				const password2 = $("#password2").val();
				
				if(oldPassword.length < 8 || password.length < 8 || password2.length < 8){
					alert("密碼須至少8字元!");
				} else if(oldPassword === password || oldPassword === password2){
					alert("新舊登入密碼不可相同!");
				} else if(password !== password2){
					alert("兩次新登入密碼不相同!");
				} else {
					let dataJSON = {};
					dataJSON["e_account"] = store.getState().e_account.info.e_account;
					dataJSON["old_password"] = oldPassword;
					dataJSON["password"] = password;

					instance.put("/api/updatePassword/", dataJSON)
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
			//設定交易密碼
			$("#tpw-btn").click(()=>{
				const tpwdRegExp = /[0-9]{6}/;
				const oldTPassword = $("#old_tpassword").val();
				const tPassword = $("#tpassword").val();
				const tPassword2 = $("#tpassword2").val();
				
				if(!tpwdRegExp.test(oldTPassword) || !tpwdRegExp.test(tPassword) || !tpwdRegExp.test(tPassword2)){
					alert("交易密碼須為長度6字元及全數字!");
				} else if(oldTPassword === tPassword || oldTPassword === tPassword2){
					alert("新舊交易密碼不可相同!");
				} else if(tPassword !== tPassword2) {
					alert("兩次新交易密碼不相同!");
				} else {
					let dataJSON = {};
					dataJSON["e_account"] = store.getState().e_account.info.e_account;
					dataJSON["old_t_pwd"] = oldTPassword;
					dataJSON["new_t_pwd"] = tPassword;
					
					instance.put("/api/updateTransactionPwd", dataJSON)
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
		async function initFetch() {
			try{
				const res = await instance.get("/api/getCurrentUser");
				const { login } = res.data;
				if(!login){
					location.href=`${pageContext.request.contextPath}/user/login`;
					throw new Error("尚未登入!");
				}

				store.dispatch({
					type: "FETCH_USER",
					payload: res.data
				});
			}catch(error){
				handleError(error.response.data);
				console.log(error);
			}
		}
	</script>
</body>
</html>

