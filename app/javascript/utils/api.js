export default {
  post(endpoint, params) {
    const headers = {
      "Content-Type": "application/json",
    };

    const csrfToken = document.querySelector("[name=csrf-token]")?.content;
    if (csrfToken) headers["X-CSRF-Token"] = csrfToken;

    return fetch(endpoint, {
      method: "POST",
      headers,
      body: JSON.stringify(params),
    });
  },
};
