import { TokenPayload, USER_ROLES } from "../../src/models/User";

export class TokenManagerMock {
  public createToken = (payload: TokenPayload): string => {
    if (payload.id === "new-id-123-mock") {
      return "novo-token-mock";
    } else if (payload.id === "u0001") {
      return "token-mock-admin";
    } else {
      return "token-mock-normal";
    }
  };

  public getPayload = (token: string): TokenPayload | null => {
    if (token === "token-mock-admin") {
      return {
        id: "u0001",
        name: "it-programmer",
        role: USER_ROLES.ADMIN,
      };
    } else if (token === "token-mock-normal") {
      return {
        id: "u0002",
        name: "it-user",
        role: USER_ROLES.NORMAL,
      };
    } else if (token === "token-mock-normal-2") {
      return {
        id: "u0003",
        name: "it-user",
        role: USER_ROLES.NORMAL,
      };
    } else if (token === "token-mock-normal-3") {
      return {
        id: "u0004",
        name: "it-user",
        role: USER_ROLES.NORMAL,
      };
    } else {
      return null;
    }
  };
}
