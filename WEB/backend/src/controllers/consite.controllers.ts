import { Response, Request, NextFunction } from "express";
import  Consite  from "../models/consite.model";
import { CreateConsiteType} from "../schemas/consite.schema";

/**
 * It takes a request, a response, and a next function as arguments, and then it tries to create a new
 * consite, and if it succeeds, it sends the new consite as a response, and if it fails, it calls the
 * next function with the error as an argument.
 * @param req - Request - The request object.
 * @param {Response} res - Response,
 * @param {NextFunction} next - NextFunction
 */
export const createConsite = async (
    req: Request<unknown,unknown,CreateConsiteType>, 
    res: Response, 
    next: NextFunction
) => {
    try {
        const {name, guides, m3, KmCube, start, destinity, tLaps} = req.body;
        const newConsite = new Consite({name, guides, m3, KmCube, start, destinity, tLaps});
        const savedConsite = await newConsite.save();
        res.json(savedConsite);
    }catch(err){
        next(err);
    }
}

/**
 * This function gets all the consites from the database and returns them in a json format.
 * @param {Request} req - The request object.
 * @param {Response} res - Response - The response object.
 * @param {NextFunction} next - NextFunction - This is a function that will be called if an error
 * occurs.
 */
export const getConsites = async (
    req:Request,
    res:Response,
    next:NextFunction
) => {
    try {
        const consites = await Consite.find();
        res.json(consites);
    }catch(err){
        next(err);
    }
}

/**
 * This function is called when a user makes a GET request to the /consites/:id endpoint. It finds the
 * consite with the id specified in the request parameters, and if it exists, it sends it back to the
 * user. If it doesn't exist, it sends a 404 error message.
 * @param {Request} req - The request object. This is an object that represents the HTTP request and
 * has properties for the request query string, parameters, body, HTTP headers, and so on.
 * @param {Response} res - Response - The response object.
 * @param {NextFunction} next - NextFunction - This is a function that will be called when the current
 * middleware is done.
 * @returns The consite object
 */
export const getConsite = async (
    req:Request,
    res:Response,
    next:NextFunction
) => {
    try {
        const consite = await Consite.findById(req.params.id);
        if(!consite) return res.status(404).json({message: "Consite not found"}); 
        res.json(consite);
    }catch(err){
        next(err);
    }
}

/**
 * This function deletes a consite from the database and returns the deleted consite to the user.
 * @param {Request} req - The request object. This is an object that represents the HTTP request and
 * has properties for the request query string, parameters, body, HTTP headers, and so on.
 * @param {Response} res - Response - The response object that will be sent back to the client.
 * @param {NextFunction} next - NextFunction - This is a function that will be called if an error
 * occurs.
 * @returns The deleted consite
 */
export const deleteConsite = async (
    req:Request,
    res:Response,
    next:NextFunction
) => {
    try {
        const consite = await Consite.findByIdAndDelete(req.params.id);
        if(!consite) return res.status(404).json({message: "Consite not found"});
        res.json(consite);
    }catch(err){
        next(err);
    }
}

/**
 * This function updates a consite in the database and returns the updated consite.
 * @param {Request} req - Request - The request object
 * @param {Response} res - Response - This is the response object that will be returned to the client.
 * @returns The updated consite.
 */
export const updateConsite = async (
    req:Request,
    res:Response
): Promise<Response> => {
    try {
        const consite = await Consite.findByIdAndUpdate(req.params.id, req.body, {
            new: true,
        });
        if(!consite) return res.status(404).json({message: "Consite not found"});
        return res.json(consite);
    }catch(err){
        return res.status(500).json({message: "Server error"});
    }
}

