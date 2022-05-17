import { Routes, Route, Navigate } from 'react-router-dom';
import { Home } from './home/Home';

export function DashboardRouter(){
   return (
      <>
        <main>
           <div className="content-body">
             <div className="container-fluid">
                <Routes>
                   <Route  path="/*" element={<Home/>} />
                   <Route path="*" element={<Navigate to="/dashboard/home" />} />
                </Routes>
             </div>
           </div>
        </main>
      </>
   );
}