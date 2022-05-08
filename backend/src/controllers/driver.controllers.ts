import { Response, Request, NextFunction } from "express";
import  Driver  from "../models/driver.model";
import { CreateDriverType} from "../schemas/driver.schema";

export const createDriver = async (
    req: Request<unknown,unknown,CreateDriverType>, 
    res: Response, 
    next: NextFunction
) => {
    console.log("Hola")
    try {
        const {name} = req.body;

        const newDriver = new Driver({name});
        const savedDriver = await newDriver.save();
        res.json(savedDriver);
    }catch(err){
        next(err);
    }
}

export const getDrivers = async (
    req:Request,
    res:Response,
    next:NextFunction
) => {
    try {
        const consites = await Driver.find();
        res.json(consites);
    }catch(err){
        next(err);
    }
}

export const getDriver = async (
    req:Request,
    res:Response,
    next:NextFunction
) => {
    try {
        const consite = await Driver.findById(req.params.id);
        if(!consite) return res.status(404).json({message: "Driver not found"}); 
        res.json(consite);
    }catch(err){
        next(err);
    }
}

export const deleteDriver = async (
    req:Request,
    res:Response,
    next:NextFunction
) => {
    try {
        const consite = await Driver.findByIdAndDelete(req.params.id);
        if(!consite) return res.status(404).json({message: "Driver not found"});
        res.json(consite);
    }catch(err){
        next(err);
    }
}


export const updateDriver = async (
    req:Request,
    res:Response
): Promise<Response> => {
    try {
        const consite = await Driver.findByIdAndUpdate(req.params.id, req.body, {
            new: true,
        });
        if(!consite) return res.status(404).json({message: "Driver not found"});
        return res.json(consite);
    }catch(err){
        return res.status(500).json({message: "Server error"});
    }
}

