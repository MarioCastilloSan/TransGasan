import { showUsers } from './controllers/user';
import app from './app'
import * as DBservices from './database';
import morgan from 'morgan';
import express from 'express';

const router = express.Router();
const data = showUsers();

DBservices.connectMongo();


app.listen(app.get('port'), ()=>{
    console.log('listening on port',app.get('port'));
});

app.use(morgan('dev'))