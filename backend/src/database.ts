import mongoose from 'mongoose';
import {MONGODB} from './config';

import { createPool, Pool} from 'mysql';
import {MYSQL} from './config';

import colors from 'colors';


let pool: Pool;

//function async mongoose 
export const connectMongo = async (): Promise<void> => {
    try {
        const db = await mongoose
        .connect(`mongodb+srv://${MONGODB.MONGO_USER}:${MONGODB.MONGO_PASS}@${MONGODB.MONGODB_HOST}/${MONGODB.MONGO_DB}?retryWrites=true&w=majority`);
        console.log(colors.green('MongoDB connected'));
    } catch (error) {
        console.log(colors.red('MongoDB connection error: '), error);
        process.exit(1);
    }
}

//function async mysql
export const connectMySQL = ()=> {
    const configuration = {
        host: MYSQL.DB_HOST,
        user: MYSQL.DB_USER,
        password: MYSQL.DB_PASSWORD,
        database: MYSQL.DB_DATABASE,
        connectionLimit: MYSQL.DB_CONNECTION_LIMIT,
        dateStrings: true
    }
    try {
        pool =  createPool(configuration);
        console.log(colors.green('MySQL connected'));
    } catch (error) {
        console.log(colors.red('MySQL connection error: '), error);
        process.exit(1);
    }
}

export const execute = <T>(query: string, params: string[] | Object): Promise<T> => {
    try {
      if (!pool) throw new Error('Pool was not created. Ensure pool is created when running the app.');
  
      return new Promise<T>((resolve, reject) => {
        pool.query(query, params, (error, results) => {
          if (error) reject(error);
          else resolve(results);
        });
      });
  
    } catch (error) {
      console.error('[mysql.connector][execute][Error]: ', error);
      throw new Error('failed to execute MySQL query');
    }
  }










//OLD FUNCTION
//funcion async mongoose
// (async () => {
//     try {
//         const db = await mongoose
//         .connect(`mongodb+srv://${MONGODB.MONGO_USER}:${MONGODB.MONGO_PASS}@${MONGODB.MONGODB_HOST}/${MONGODB.MONGO_DB}?retryWrites=true&w=majority`);
//         console.log(colors.green('[MONGO]') ,'Database is connected to: ',db.connection.db.databaseName);
//     } catch (error) {
//         console.log(error);
//     }
// })();

