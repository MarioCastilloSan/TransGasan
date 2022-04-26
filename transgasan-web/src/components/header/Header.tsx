import React from 'react'
import Logo from '../../logo.png'
import './header.css'

const Header = () =>{
  return (
    <div className="header">
      <img 
        src = {Logo}
        height={100} 
        width = {300} 
        alt= "Logo TransGasan"
        />
    </div>
  );
}

export default Header;
