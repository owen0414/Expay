<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<div id="nav" class="smart-scroll"></div>

<script src="<c:url value="/resources/js/axios.min.js"/>"></script>
<script src="https://unpkg.com/react@17/umd/react.development.js" crossorigin></script>
<script src="https://unpkg.com/react-dom@17/umd/react-dom.development.js" crossorigin></script>
<script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>

<script type="text/babel">
const { useState, useEffect } = React;
const { render } = ReactDOM;

const App = () => {
  const [isLogin, setIsLogin] = useState(false);
  const [userInfo, setUserInfo] = useState({});

  //抓取現在的使用者資料
  const fetchData = async () => {
    try{
      //TODO 網址要改!
      const res = await instance.get("/api/getCurrentUser");
      setUserInfo(res.data);
      setIsLogin(res.data.login);
    }catch(error){
      console.log(error);
    }
  }

  //當一渲染ui就執行useEffect
  useEffect(() => {
    fetchData();

    return () => {
      setUserInfo({});
      setIsLogin(false);
    }
  }, []);

  //處理登出邏輯
  const handleLogout = async () => {
    try{
      const res = await instance.get("/api/logout");
      const { status } = res.data;
      //如果狀態為200，跳轉至登入頁面
      if(status === 200){
        location.href = "${pageContext.request.contextPath}/user/login";
      }
      console.log(res);
    }catch(error){
      console.log(error);  
    }
  };

  //渲染nav item
  const renderNavItem = () => {
    return (isLogin ? (
      <ul className="navbar-nav">
        <li className="nav-item">
          <a href="${pageContext.request.contextPath}/personalPage" className="nav-link">個人頁面</a>
        </li>
        {userInfo.info.role === "M" ?
        <li className="nav-item">
          <a className="nav-link" data-toggle="modal" data-target="#paymentNotificationModal" style={{cursor: "pointer"}}>待付款通知 <span className="badge badge-secondary">{userInfo.info.unReceiveTransaction}</span></a>
        </li> : 
        <li className="nav-item">
          <a className="nav-link" style={{cursor: "not-allowed"}} disabled="disabled">待付款通知 <span className="badge badge-secondary">{userInfo.info.unReceiveTransaction}</span></a>
        </li>}
        <li className="nav-item">
          <a href="${pageContext.request.contextPath}/intro" className="nav-link">介紹</a>
        </li>
        <li className="nav-item">
          <a href="${pageContext.request.contextPath}/help" className="nav-link">幫助</a>
        </li>
        <li className="nav-item">
          <a className="nav-link" onClick={handleLogout} style={{cursor: 'pointer'}}>登出</a>
        </li>
      </ul>
    ):(
      <ul className="navbar-nav">
        <li className="nav-item">
          <a href="${pageContext.request.contextPath}/user/login" className="nav-link">登入</a>
        </li>
        <li className="nav-item">
          <a href="${pageContext.request.contextPath}/user/register" className="nav-link">註冊</a>
        </li>
        <li className="nav-item">
          <a href="${pageContext.request.contextPath}/intro" className="nav-link">介紹</a>
        </li>
        <li className="nav-item">
          <a href="${pageContext.request.contextPath}/help" className="nav-link">幫助</a>
        </li>
      </ul>
    ));
  }

  //渲染navbar ui
  return (
    <nav className="navbar bg-light navbar-expand-lg navbar-light py-3">
      <a className="navbar-brand" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="Ex Pay" style={{ height: '60px'}}/></a>
      <button
        className="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span className="navbar-toggler-icon"></span>
      </button>
      <div className="collapse navbar-collapse" id="navbarNav">
        <ul className="navbar-nav mr-auto"></ul>
        {renderNavItem()}
      </div>
    </nav>
  );
};

render(
  <App/>,
  document.querySelector("#nav")
);
</script>
