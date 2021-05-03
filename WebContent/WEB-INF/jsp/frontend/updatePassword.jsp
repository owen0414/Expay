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
								<h2>設定</h2>
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
			</div>
		</div>
	</div>
	
	<!-- ResultModal -->
	<%@ include file="/WEB-INF/jsp/frontend/resultModal.jsp"%>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>
	<script>
		$(document).ready(()=>{
			//修改密碼
			$("#pw-btn").click(() => {
				const oldPassword = $("#old_password").val();
				const password = $("#password").val();
				const password2 = $("#password2").val();
				
				if(oldPassword === password || oldPassword === password2){
					alert("新舊密碼不可一致");
				} else if(password !== password2){
					alert("兩次新密碼不一致");
				} else {
					let dataJSON = {};
					dataJSON["old_password"] = oldPassword;
					dataJSON["password"] = password;

					instance.put("/api/updatePassword/", dataJSON)
					.then(res => {
						renderModalBody(res.data, ({status, message, timestamp}) => {
							return `\${message}<br>`;
						}, ({status, message, timestamp}) => {
							return `\${message}<br>`;
						});
					});
				}
			});
		});
	</script>
</body>
</html>

