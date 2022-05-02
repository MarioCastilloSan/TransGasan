import dotenv from 'dotenv';
dotenv.config();

//PORT APP EXPRESS
export const PORT = {PORT: process.env.PORT}

//Object mongoose
export const  MONGODB = {
    MONGO_DB: process.env.MONGO_DB,
    MONGODB_HOST: process.env.MONGODB_HOST,
    MONGO_USER: process.env.MONGO_USER,
    MONGO_PASS: process.env.MONGO_PASS,
    
}

//object data mysql
export const MYSQL = {
    DB_HOST: process.env.MY_SQL_DB_HOST,
    DB_USER: process.env.MY_SQL_DB_USER,
    DB_PASSWORD: process.env.MY_SQL_DB_PASSWORD,
    DB_PORT: process.env.MY_SQL_DB_PORT,
    DB_DATABASE: process.env.DB_DATABASE,
    DB_CONNECTION_LIMIT: process.env.MY_SQL_DB_CONNECTION_LIMIT ? parseInt(process.env.MY_SQL_DB_CONNECTION_LIMIT) : 4,
  }

