import app from './app'
import * as DBservices from './database';
import morgan from 'morgan';
import { RequestHandler } from 'express';

interface user{
    idUser: number,
    User:string,
    password:string,
    idType:number,
    idProfile:number,
}

DBservices.connectMongo();
DBservices.connectMySQL();
const showUser = async () => {
    await DBservices.execute<user>('use dbs6109599', []);
    return await DBservices.execute<user>('SELECT * FROM user', []);
}
console.log(showUser());


app.listen(app.get('port'), ()=>{
    console.log('listening on port',app.get('port'));
});

app.use(morgan('dev'))