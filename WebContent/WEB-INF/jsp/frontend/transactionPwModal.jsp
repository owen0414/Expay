<%@ include file="/WEB-INF/jsp/includes.jsp"%> <%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<div
    class="modal fade"
    id="transactionPwModal"
    tabindex="-1"
    aria-labelledby="resultModalLabel"
    aria-hidden="true"
    data-backdrop="static"
    data-keyboard="false"
>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="transactionPwModalLabel">請輸入交易密碼</h5>
                <button
                    type="button"
                    class="close"
                    data-dismiss="modal"
                    aria-label="Close"
                    onclick="location.href='${pageContext.request.contextPath}';"
                >
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12 col-md-8">
                            <p id="hint" class="mb-2"></p>
                            <input
                                type="password"
                                name="transactionPw"
                                id="transactionPw"
                                class="form-control"
                                placeholder="交易密碼"
                                maxlength="6"
                                autofocus
                            />
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button
                    type="button"
                    class="btn btn-secondary"
                    data-dismiss="modal"
                    onclick="location.href='${pageContext.request.contextPath}';"
                >
                    關閉
                </button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(() => {
        $('#transactionPwModal').modal('toggle')

        $('#transactionPw').keyup(async function () {
            let tpw = $(this).val()
            if (tpw.length === 6) {
                try {
                    let res = await instance.get('/api/getCurrentUser')
                    const {
                        login,
                        info: { role },
                    } = res.data
                    if (!login) {
                        alert('尚未登入!')
                        throw new Error('尚未登入!')
                    }

                    let dataJSON = {}
                    dataJSON['transactionPwd'] = tpw
                    dataJSON['role'] = role

                    res = await instance.post('/api/checkTransactionPwd', dataJSON)
                    const { valid } = res.data
                    if (!valid) {
                        $('#hint').html('交易密碼錯誤').css('color', 'red')
                    } else {
                        $('#transactionPwModal').modal('hide')
                    }
                } catch (error) {
                    handleError(error.response.data)
                    console.log(error)
                }
            }
        })

        $('.modal').on('shown.bs.modal', function () {
            $(this).find('[autofocus]').focus()
        })
    })
</script>
