import React from "react";
import ReactDOM from "react-dom";
import LoginPage from "components/login-page";

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<LoginPage />, document.querySelector("#react-root"));
});
