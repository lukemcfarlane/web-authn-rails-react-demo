import React from "react";

const LoginPage = () => (
  <div class="login-page">
    <div class="container">
      <section class="header">
        <h1 class="title">Login</h1>
      </section>
      <form class="login-form">
        <div class="row">
          <div class="six columns">
            <label for="username">Username</label>
            <input
              class="u-full-width"
              type="text"
              placeholder="your_username"
              id="username"
            />
          </div>
        </div>
        <div class="row">
          <div class="two columns">
            <button>Register</button>
          </div>
          <div class="two columns">
            <button type="submit" class="button-primary">
              Login
            </button>
          </div>
        </div>
      </form>
    </div>
  </div>
);

export default LoginPage;
