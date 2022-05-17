import { Routes, Route, Navigate } from 'react-router-dom';
import { Login } from './login/Login';


export function AuthRouter(){
   return (
      <Routes>
         <Route path="login" element={ <Login/> } />
         <Route path="*" element={<Navigate to="/auth/login" />} />
      </Routes>
   );
}