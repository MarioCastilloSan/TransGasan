import { connectMongo, getMongo } from '../config/database';


/**
 * This function connects to the MongoDB database, then queries the Driver collection, and returns the
 * results.
 */
export const showDriver = async () => {
    let query = "";
    let collection = 'Driver';
    const connection = await connectMongo();
    const data = await getMongo(connection,collection, query);
    console.log('driver: ', data);

};