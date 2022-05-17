export interface Action {
  type: string;
  payload: any;
}

const isAuthenticated = { loggedIn: false };

export function authReducer(state = isAuthenticated, action: Action) {
  switch (action.type) {
    case "login":
      return { ...action.payload, loggedIn: true };
    case "logout":
      return { loggedIn: false };

    default:
      return state;
  }
}
