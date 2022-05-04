import { showUsers } from './controllers/user';
import {showDriver} from './controllers/driver'
import app from './app'
import * as DBservices from './config/database';
import morgan from 'morgan';
import express from 'express';

// const router = express.Router();
const data = showUsers();
const dataDriver = showDriver();
const conexion = DBservices.connectMongo();



/* Listening to the port that is set in the app.set('port', process.env.PORT || 3000); */
app.listen(app.get('port'), ()=>{
    console.log('listening on port',app.get('port'));
});

app.use(morgan('dev'))