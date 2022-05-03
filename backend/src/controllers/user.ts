import { NextFunction, Request, Response } from 'express';
import { ConnectMYSQL, Query } from '../config/database';


/**
 * It connects to the database, then queries the database, then returns the result of the query, then
 * closes the connection.
 */
export const showUsers = async () => {
    let query = `SElECT * FROM user`;

    ConnectMYSQL()
        .then((connection) => {
            Query(connection, query)
                .then((result) => {
                    console.log('users: ', result);

                    // return res.status(200).json({
                    //     result
                    // });
                })
                .catch((error) => {
                    console.log(error.message, error);

                    // return res.status(200).json({
                    //     message: error.message,
                    //     error
                    // });
                })
                .finally(() => {
                    console.log('Closing connection.');
                    connection.end();
                });
        })
        .catch((error) => {
            console.log(error.message, error);

            // return res.status(200).json({
            //     message: error.message,
            //     error
            // });
        });
};