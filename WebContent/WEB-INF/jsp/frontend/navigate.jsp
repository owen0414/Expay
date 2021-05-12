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

  useEffect(() => {
    fetchData();

    return () => {
      setUserInfo({});
      setIsLogin(false);
    }
  }, []);

  const handleLogout = async () => {
    try{
      const res = await instance.get("/api/logout");
      const { status } = res.data;
      if(status === 200){
        location.href = "${pageContext.request.contextPath}/user/login";
      }
      console.log(res);
    }catch(error){
      console.log(error);  
    }
  };

  const renderNavItem = () => {
    return (isLogin ? (
      <ul className="navbar-nav">
        <li className="nav-item">
          <a href="${pageContext.request.contextPath}/personalPage" className="nav-link">個人頁面</a>
        </li>
        {userInfo.info.role === "M" ?
        <li className="nav-item">
          <a className="nav-link" data-toggle="modal" data-target="#paymentNotificationModal" style={{cursor: "pointer"}}>待收款通知 <span className="badge badge-secondary">{userInfo.info.unReceiveTransaction}</span></a>
        </li> : 
        <li className="nav-item">
          <a className="nav-link" style={{cursor: "not-allowed"}} disabled="disabled">待收款通知 <span className="badge badge-secondary">{userInfo.info.unReceiveTransaction}</span></a>
        </li>}
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
      </ul>
    ));
  }

  return (
    <nav className="navbar bg-light navbar-expand-lg navbar-light py-3">
      <a className="navbar-brand" href="${pageContext.request.contextPath}/">EX Pay</a>
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
