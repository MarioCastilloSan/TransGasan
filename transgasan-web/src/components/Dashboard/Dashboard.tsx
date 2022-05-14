import React from 'react';
import "./Dashboard.css";
//const express = require('express');


//Conexion a  Mongo
//const mongoose = require('mongoose');

const user = 'jcsepulveda';
const passwd = 'sochinaedo6';
const dbname = 'TransGasan-DB';
const uri = `mongodb+srv://${user}:${passwd}@transgasan-db.odhnf.mongodb.net/${dbname}?retryWrites=true&w=majority`; 

//mongoose.connect(uri,  { useNewUrlParser: true, useUnifiedTopology: true})
  //.then(() => console.log('Conectado'));



const Dashboard = () => {


  return (
      <div className='Dashboard'>
        <table>
          <thead>
            <tr>
              <th>Id</th>
              <th>Number</th>
              <th>Driver</th>
              <th>LisencePlate</th>
              <th>ConSite</th>
              <th>Date</th>
              <th>In Km</th>
              <th>Out Km</th>
              <th>Activity</th>
              <th>Fuel</th>
              <th>OilM</th>
              <th>GraseM</th>
              <th>HydraulicM</th>
              <th>Observations</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td> 01 </td>
              <td> 13 </td>
              <td> Juan Perez </td>
              <td> RR-02-11 </td>
              <td> ASUR </td>
              <td> 07-04-20 </td>
              <td> 170.000 </td>
              <td> 170.050 </td>
              <td> Mover material  </td>
              <td> 220 </td>
              <td> 0 </td>
              <td> 1 </td>
              <td> 0 </td>
              <td> Se detuvo un momento por taco  </td>
              
            </tr>
          </tbody>
        </table>
      </div>
  );
}

export default Dashboard;
