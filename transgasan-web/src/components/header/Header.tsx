import React from 'react'
import Logo from '../../logo.svg'
import './header.css'

const Header = () =>{
  return (
    <div className="header">
      <img 
        src = {Logo}
        height={100} 
        width = {100} 
        alt= "Logo TransGasan"
        />
    </div>
  );
}

export default Header;
