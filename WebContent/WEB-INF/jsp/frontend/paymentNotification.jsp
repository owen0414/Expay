<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>付款通知</title>
<%@ include file="/WEB-INF/jsp/frontend/include.jsp"%>
</head>
<body>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/jsp/frontend/navigate.jsp"%>

	<!-- Content -->
	<div class="content_container">
		<div class="row mx-4 mx-md-2">
			<div class="col-12 col-md-5 quota_item mx-md-auto mt-4 px-0">
				<div class="row mx-3 mx-md-auto">
					<div class="col-12 font-weight-bold text-center">付款通知</div>
				</div>
				
				<div class="row mx-3 mx-md-auto">
					<div
						class="col-12 col-md-10 my-3 mx-auto payment_item">
						<div class="row">
							<div class="col-3">
								<p class="mt-2">
									<img alt="對方電支帳戶"
										src="<c:url value="/resources/img/person.jpg"/>">
								</p>
								<p>0912******</p>
							</div>
							<div class="col-9">
								<p class="mt-auto mt-md-4">要求您付NT $100</p>
							</div>
						</div>
						<div class="row">
							<div class="col-12 text-center text-md-right">
								<button class="btn btn-primary">確認</button>
								<button class="btn btn-danger">拒絕</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row mx-3 mx-md-auto">
					<div
						class="col-12 col-md-10 my-3 mx-auto payment_item">
						<div class="row">
							<div class="col-3">
								<p class="mt-2">
									<img alt="對方電支帳戶"
										src="<c:url value="/resources/img/person.jpg"/>">
								</p>
								<p>0914******</p>
							</div>
							<div class="col-9">
								<p class="mt-auto mt-md-4">要求您付NT $3,000</p>
							</div>
						</div>
						<div class="row">
							<div class="col-12 text-center text-md-right">
								<button class="btn btn-primary">確認</button>
								<button class="btn btn-danger">拒絕</button>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/jsp/frontend/footer.jsp"%>
</body>
</html>

