import api from "utils/api";

export const createSession = async (username) => {
  return api.post("/sessions", { username });
};
