import mongoose from "mongoose";
import mysql from "mysql";
import { configuration } from "./config";

import colors from "colors";

/**
 * This function takes a mongoose connection, a collection name, and a query, and returns a promise of
 * an array of documents.
 * @param connection - mongoose.Connection - this is the connection to the database
 * @param {string} collection - string - The name of the collection you want to query
 * @param {any} query - any
 * @returns An array of objects.
 */
export const getMongo = async (
  connection: mongoose.Connection,
  collection: string,
  query: any
): Promise<any> => {
  try {
    const data = await connection.collection(collection).find(query).toArray();
    return data;
  } catch (error) {
    console.log(colors.red("MongoDB connection error: "), error);
    process.exit(1);
  }
};

/**
 * It creates a new connection to the database, and returns a promise that resolves to the connection
 * if it succeeds, or rejects with an error if it fails.
 */
export const ConnectMYSQL = async () =>
  new Promise<mysql.Connection>((resolve, reject) => {
    const connectionn = mysql.createConnection(configuration);

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
export const Query = async (connection: mysql.Connection, query: string) =>
  new Promise<any>((resolve, reject) => {
    connection.query(query, (err: any, result: any) => {
      if (err) {
        reject(err);
      }
      resolve(result);
    });
  });
