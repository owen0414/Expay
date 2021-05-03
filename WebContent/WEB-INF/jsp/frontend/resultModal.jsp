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
	      	<div id="result-area" class="alert">
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
		let resultAreaClass, resultTitle, resultBody;
		
		if(status === 200){
			resultAreaClass = "alert-success";
			resultTitle = "成功!";
			resultBody = successHint(res);
		} else {
			resultAreaClass = "alert-danger";
			resultTitle = "失敗!";
			resultBody = failedHint(res);
		}
		
		$("#resultModalLabel").text(resultTitle);
		$("#result-area").addClass(resultAreaClass);
		$("#result-area").html(resultBody);
		$("#resultModal").modal("toggle");
	}
	</script>