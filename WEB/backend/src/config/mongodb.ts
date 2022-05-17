import mongoose from "mongoose";
import { MONGODB } from "./config";

export async function connectDB() {
  try {
    const db = await mongoose.connect(`mongodb+srv://${MONGODB.MONGO_USER}:${MONGODB.MONGO_PASS}@${MONGODB.MONGODB_HOST}/${MONGODB.MONGO_DB}?retryWrites=true&w=majority`);
    console.log("Database is connected to: ", db.connection.name);
  } catch (error) {
    console.error(error);
  }
}
