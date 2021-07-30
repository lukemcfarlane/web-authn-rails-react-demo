import React from "react";
import { createSession } from "actions/session-actions";
import { useState } from "react";
import classnames from "classnames";

import "./login-page.scss";

const LoginPage = () => {
  const [username, setUsername] = useState("");
  const [errorMsg, setErrorMsg] = useState();
  const hasError = !!errorMsg;

  const register = () => {
    window.location.href = "users";
  };

  const login = async () => {
    const resp = await createSession(username);
    if (resp.ok) {
      window.location.href = "users";
    } else {
      const { error } = await resp.json();

      if (error === "not found") {
        setErrorMsg("Invalid username");
      } else {
        setErrorMsg("Oh no! Something went wrong :-(");
      }
    }
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
              {hasError && <div className="error">{errorMsg}</div>}
              <input
                className={classnames("u-full-width", {
                  "has-error": hasError,
                })}
                type="text"
                placeholder="your_username"
                id="username"
                defaultValue={username}
                onChange={(e) => setUsername(e.target.value)}
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
