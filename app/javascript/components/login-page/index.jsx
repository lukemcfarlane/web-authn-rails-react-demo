import React from "react";

const LoginPage = () => {
  const register = () => {
    window.location.href = "users";
  };
  const login = () => {
    window.location.href = "users";
  };

  return (
    <div className="login-page">
      <div className="container">
        <section className="header">
          <h1 className="title">Login</h1>
        </section>
        <form className="login-form">
          <div className="row">
            <div className="six columns">
              <label htmlFor="username">Username</label>
              <input
                className="u-full-width"
                type="text"
                placeholder="your_username"
                id="username"
              />
            </div>
          </div>
          <div className="row">
            <div className="two columns">
              <button type="button" onClick={register}>
                Register
              </button>
            </div>
            <div className="two columns">
              <button type="button" className="button-primary" onClick={login}>
                Login
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  );
};

export default LoginPage;
