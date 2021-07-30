jest.mock("utils/api");

import "isomorphic-fetch";

import { createSession } from "./session-actions";
import api from "utils/api";

describe("Session actions", () => {
  describe("createSession", () => {
    let mockResponse = new Response("test");

    beforeEach(() => {
      api.post.mockReturnValue(mockResponse);
    });

    it("performs post sessions request", async () => {
      const resp = await createSession("test@example.com");
      expect(resp).toEqual(mockResponse);
      expect(api.post).toHaveBeenCalledWith("/sessions", {
        username: "test@example.com",
      });
    });
  });
});
