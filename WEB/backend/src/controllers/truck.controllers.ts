import { Response, Request, NextFunction } from "express";
import Truck from "../models/truck.model";
import { CreateTrucksType } from "../schemas/trucks.schema";

export const createTruck = async (
  req: Request<unknown, unknown, CreateTrucksType>,
  res: Response,
  next: NextFunction
) => {
  try {
    const { lisencePlate, conSiteId, fuel, cubedC, driverId } = req.body;
    const newTruck = new Truck({
      lisencePlate,
      conSiteId,
      fuel,
      cubedC,
      driverId,
    });
    const savedTruck = await newTruck.save();
    res.json(savedTruck);
  } catch (err) {
    next(err);
  }
};

export const getTrucks = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const consites = await Truck.find();
    res.json(consites);
  } catch (err) {
    next(err);
  }
};

export const getTruck = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const consite = await Truck.findById(req.params.id);
    if (!consite) return res.status(404).json({ message: "Truck not found" });
    res.json(consite);
  } catch (err) {
    next(err);
  }
};

export const deleteTruck = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const consite = await Truck.findByIdAndDelete(req.params.id);
    if (!consite) return res.status(404).json({ message: "Truck not found" });
    res.json(consite);
  } catch (err) {
    next(err);
  }
};

export const updateTruck = async (
  req: Request,
  res: Response
): Promise<Response> => {
  try {
    const consite = await Truck.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
    });
    if (!consite) return res.status(404).json({ message: "Truck not found" });
    return res.json(consite);
  } catch (err) {
    return res.status(500).json({ message: "Server error" });
  }
};
