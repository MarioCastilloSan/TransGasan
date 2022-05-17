import './home.scss'
import 'boxicons/css/boxicons.min.css';
import { Routes, Route,Navigate  } from 'react-router-dom'
import AppLayout from '../components/layout/AppLayout';
import Blank from '../pages/Blank';




export function Home() {
  return (
    <div className='Apps'>
      <Routes>
        <Route path='' element={<AppLayout />} >
          <Route index element={<Blank />} />
          <Route path='/Employees' element={<Blank />} />
          <Route path='/Analysis' element={<Blank />} />
          <Route path='/Reports' element={<Blank />} />
          <Route path="*" element={<Navigate to="/dashboard/" />} />
        </Route>
      </Routes>
    </div>
);
}
