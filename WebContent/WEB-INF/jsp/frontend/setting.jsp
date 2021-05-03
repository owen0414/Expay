<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>個人資料維護</title>
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
								<label for="fullname" class="d-block">姓名</label>
								<input type="text" name="fullname" id="fullname" class="form-control w-auto" value="彭小翔" readonly="readonly" />
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<label for="phone" class="d-block">手機</label>
								<input type="tel" name="phone" id="phone" maxlength="10" pattern="09[0-9]{8}" class="form-control w-auto" />
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<label for="email" class="d-block">Email</label>
								<input type="email" name="email" id="email" class="form-control w-auto" />
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<label for="birthday" class="d-block">生日</label>
								<input type="date" name="birthday" id="birthday" class="form-control w-auto" />
							</li>
							<li class="list-group-item">
								<a href="${pageContext.request.contextPath}/updatePassword">變更密碼</a>
							</li>
							<li class="list-group-item d-flex justify-content-end">
								<button type="button" class="btn btn-secondary" type="button" id="setting-btn">變更</button>
							</li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<%@ include file="/WEB-INF/jsp/frontend/resultModal.jsp"%>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>
	<script>
		$(document).ready(() => {
			//取得個人資料
			instance.get("/api/personalInfo/")
			.then(res => {
				const { name, phone, email, birthday } = res.data;
				$("#fullname").val(name);
				$("#phone").val(phone);
				$("#email").val(email);
				$("#birthday").val(birthday);
			});

			$("#setting-btn").click(() => {
				let dataJSON = {};
				dataJSON["name"] = $("#name").val();
				dataJSON["phone"] = $("#phone").val();
				dataJSON["email"] = $("#email").val();
				dataJSON["birthday"] = $("#birthday").val();

				instance.put("/api/personalInfo/", dataJSON)
				.then(res => {
					renderModalBody(res.data);
				});
			});
			
			function renderModalBody(res){
				const {status, message, timestamp} = res;
			
				let resultAreaClass, resultTitle, resultBody;
				
				if(status === 200){
					resultAreaClass = "alert-success";
					resultTitle = "修改個人資料成功!";
					resultBody = `
						\${message}<br>
					`;
				} else {
					resultAreaClass = "alert-danger";
					resultTitle = "修改個人資料失敗!";
					resultBody = `
						\${message}<br>
					`;
				}
				
				$("#resultModalLabel").text(resultTitle);
				$("#result-area").addClass(resultAreaClass);
				$("#result-area").html(resultBody);
				$("#resultModal").modal("toggle");
			}
		});
	</script>
</body>
</html>
