import { useReducer } from "react";
import { AppRouter } from "./app/router/AppRouter";
import { AuthContext } from "./app/views/store/contexts/AuthContext";
import { authReducer } from "./app/views/store/reducers/authReducer";
import "./App.css";

const init = () => {
  let sessionUser: any = sessionStorage.getItem("user");
  let user: any;
  if (!sessionUser) {
    user = sessionUser;
  } else {
    user = JSON.parse(sessionUser);
  }
  return user;
};

function App() {
  const [user, dispatchUser] = useReducer(authReducer, {}, init);
  return (
    <AuthContext.Provider value={{ user, dispatchUser }}>
      <AppRouter />
    </AuthContext.Provider>
  );
}

export default App;
