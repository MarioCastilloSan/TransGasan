import mongoose from "mongoose";
import { MONGODB } from "./config";

import mysql from 'mysql';
import { configuration} from "./config";

import colors from "colors";

//function async mongoose
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



export const ConnectMYSQL = async () => new Promise<mysql.Connection>((resolve, reject) => {
  const connectionn = mysql.createConnection(configuration)

  connectionn.connect((err: any) => {
    if (err) {
      reject(err);
    }
    resolve(connectionn);
  });
});

export const Query = async (connection: mysql.Connection, query: string ) => new Promise<any>((resolve, reject) => {
  connection.query(query, (err: any, result: any) => {
    if (err) {
      reject(err);
    } 
      resolve(result);
  });
});
