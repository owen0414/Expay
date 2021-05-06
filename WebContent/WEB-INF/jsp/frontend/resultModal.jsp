<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
	<div class="modal fade" id="resultModal" tabindex="-1" aria-labelledby="resultModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="resultModalLabel"></h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" id="resultModelBody">
	      	<div id="result-area" class="alert d-flex flex-column align-items-center">
	      	</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
	function renderModalBody(res, successHint, failedHint){
		const { status } = res;
		let resultTitle, resultBody;
		
		if(status === 200){
			resultTitle = "成功!";
			resultBody = `
			<svg viewBox="0 0 87 87" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
				<g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
					<g id="Group-3" transform="translate(2.000000, 2.000000)">
						<circle id="Oval-2" stroke="rgba(165, 220, 134, 0.2)" stroke-width="4" cx="41.5" cy="41.5" r="41.5"></circle>
						<circle  class="ui-success-circle" id="Oval-2" stroke="#A5DC86" stroke-width="4" cx="41.5" cy="41.5" r="41.5"></circle>
						<polyline class="ui-success-path" id="Path-2" stroke="#A5DC86" stroke-width="4" points="19 38.8036813 31.1020744 54.8046875 63.299221 28"></polyline>
					</g>
				</g>
			</svg>
			` + successHint(res);
			$("#result-area").addClass("alert-success");
			$("#result-area").removeClass("alert-danger");
		} else {
			resultTitle = "失敗!";
			resultBody = `
			<svg  viewBox="0 0 87 87" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
				<g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
					<g id="Group-2" transform="translate(2.000000, 2.000000)">
						<circle id="Oval-2" stroke="rgba(252, 191, 191, .5)" stroke-width="4" cx="41.5" cy="41.5" r="41.5"></circle>
						<circle  class="ui-error-circle" stroke="#F74444" stroke-width="4" cx="41.5" cy="41.5" r="41.5"></circle>
						<path class="ui-error-line1" d="M22.244224,22 L60.4279902,60.1837662" id="Line" stroke="#F74444" stroke-width="3" stroke-linecap="square"></path>
						<path class="ui-error-line2" d="M60.755776,21 L23.244224,59.8443492" id="Line" stroke="#F74444" stroke-width="3" stroke-linecap="square"></path>
					</g>
				</g>
			</svg>
			` + failedHint(res);
			$("#result-area").addClass("alert-danger");
			$("#result-area").removeClass("alert-success");
		}
		
		$("#resultModalLabel").text(resultTitle);
		$("#result-area").html(resultBody);
		$("#resultModal").modal("toggle");
	}
	</script>