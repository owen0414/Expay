<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<div id="notifiactionApp"></div>

<script src="https://unpkg.com/react@17/umd/react.development.js" crossorigin></script>
<script src="https://unpkg.com/react-dom@17/umd/react-dom.development.js" crossorigin></script>
<script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
<script type="text/babel">
const { useState, useEffect } = React;
const { render } = ReactDOM;

const App = props => {
    const [data, setData] = useState([]);

    useEffect(async () => {
        const res = await instance.get("/api/getPaymentNotification");
        setData(oldState => res.data);
        // setData([
        //     {
        //         name: "張登凱",
        //         phone: "0912345678",
        //         amount: 1000,
        //         note: "快付錢!",
        //         transaction_code: "T202105060000000008"
        //     },
        //     {
        //         name: "呂承昊",
        //         phone: "0988777666",
        //         amount: 30000,
        //         note: "還錢!",
        //         transaction_code: "T202105060000000009"
        //     }
        // ]);
    }, []);

    $("#paymentNotificationModal").on("show.bs.modal", async () => {
        const res = await instance.get("/api/getPaymentNotification");
        setData(oldState => res.data);
    });

    const Item = ({name, phone, amount, note, time, transaction_code, e_account}) => (
        <div className="row mx-3 mx-md-auto mybox">
            <div
                className="col-12 col-md-10 my-3 mx-auto payment_item">
                <div className="row">
                    <div className="col">
                        <p>{nameToStar(name)}</p>
                        <p>{phoneToStar(phone)}</p>
                        <p>要求您付NT$ {amount}</p>
                        <p>備註: {note}</p>
                        <p>時間: {time}</p>
                    </div>
                </div>
                <div className="row">
                    <div className="col-12 text-center text-md-right">
                        <button className="btn btn-primary mr-3" onClick={() => {
                            //確認的話把資料pass給轉帳頁面!
                            $.cookie("e_account", e_account);
                            $.cookie("name", name);
                            $.cookie("phone", phone);
                            $.cookie("amount",amount);
                            $.cookie("transaction_code", transaction_code);
                            location.href = "${pageContext.request.contextPath}/transfer";
                        }}>確認</button>
                        <button className="btn btn-danger" onClick={async ()=>{
                            try{
                                //執行拒絕的動作
                                const res = await instance.post("/api/ePay/receive", {
                                    transactionCode: transaction_code,
                                    status: "N"
                                });

                                //跳出框框
                                const {status, message} = res.data;
                                alert(message);

                                //從ui刪除資料
                                setData(oldData => oldData.filter((val, i) => val.transaction_code !== transaction_code));
                            }catch(error){
                                console.log(error);
                            }
                        }}>拒絕</button>
                    </div>
                </div>
            </div>
        </div>
    );

    const renderItem = () => {
        //會由時間晚排到時間早
        return data.sort((a, b) => {
            return (new Date(b.time) - new Date(a.time));
        }).map((val, i) => {
            return <Item {...val} key={i}/>;
        });
    };
    

    return (
        <div className="modal fade" id="paymentNotificationModal" tabIndex="-1" aria-labelledby="paymentNotificationModalLabel" aria-hidden="true">
            <div className="modal-dialog">
                <div className="modal-content">
                    <div className="modal-header">
                    <h5 className="modal-title" id="paymentNotificationModalLabel">待付款通知</h5>
                    <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    </div>
                    <div className="modal-body container" id="paymentNotificationModalBody">
                        {renderItem()}
                    </div>
                    <div className="modal-footer">
                    <button type="button" className="btn btn-secondary" data-dismiss="modal">關閉</button>
                    </div>
                </div>
            </div>
        </div>
    );
}

render(
    <App />,
    document.querySelector("#notifiactionApp")
);
</script>