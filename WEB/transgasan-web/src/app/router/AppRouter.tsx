import { useContext } from "react";
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Navigate,
} from "react-router-dom";
import { AuthContext } from "../views/store/contexts/AuthContext";
import { AuthRouter } from '../views/auth/AuthRouter';
import { PrivateRouter } from "./PrivateRouter";
import { DashboardRouter } from "../views/dashboard/DashboardRouter";


interface Context {
  dispatchUser?: any;
  user?: User;
}

interface User {
  loggedIn: boolean;
}

export function AppRouter() {
  const { user }: Context = useContext(AuthContext);
  return (
    <Router>
      <Routes>

        <Route path='/auth/*' element={ <AuthRouter/> }  />
        <Route path='/dashboard/*'
          element={
            <PrivateRouter loggedIn={true} element={<DashboardRouter/>}/>
            } 
        />
        <Route path="*" element={<Navigate to="/dashboard/home" />} />
      </Routes>
    </Router>
  );
}
