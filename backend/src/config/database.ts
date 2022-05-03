import mongoose from "mongoose";
import { MONGODB } from "./config";

import mysql from 'mysql';
import { configuration} from "./config";

import colors from "colors";


/**
 * It connects to MongoDB using the Mongoose library
 */
export const connectMongo = async (): Promise<void> => {
  try {
    const db = await mongoose.connect(
      `mongodb+srv://${MONGODB.MONGO_USER}:${MONGODB.MONGO_PASS}@${MONGODB.MONGODB_HOST}/${MONGODB.MONGO_DB}?retryWrites=true&w=majority`
    );
    console.log(colors.green("MongoDB connected"));
  } catch (error) {
    console.log(colors.red("MongoDB connection error: "), error);
    process.exit(1);
  }
};



/**
 * It creates a new connection to the database, and returns a promise that resolves to the connection
 * if it succeeds, or rejects with an error if it fails.
 */
export const ConnectMYSQL = async () => new Promise<mysql.Connection>((resolve, reject) => {
  const connectionn = mysql.createConnection(configuration)

  connectionn.connect((err: any) => {
    if (err) {
      reject(err);
    }
    resolve(connectionn);
  });
});

/**
 * It's a function that takes a connection and a query, and returns a promise that resolves to the
 * result of the query.
 * @param connection - mysql.Connection - This is the connection to the database.
 * @param {string} query - string - The query you want to run
 */
export const Query = async (connection: mysql.Connection, query: string ) => new Promise<any>((resolve, reject) => {
  connection.query(query, (err: any, result: any) => {
    if (err) {
      reject(err);
    } 
      resolve(result);
  });
});
