import { Response, Request, NextFunction } from "express";
import Guide from "../models/guide.model";
import { CreateGuidesType } from "../schemas/guides.schema";

export const createGuide = async (
  req: Request<unknown, unknown, CreateGuidesType>,
  res: Response,
  next: NextFunction
) => {
  try {
    const {
      number,
      driver,
      lisencePlate,
      consite,
      date,
      inKm,
      outKm,
      activity,
      fuel,
      oilM,
      graseM,
      hydraulicM,
      observations,
    } = req.body;
    const newGuide = new Guide({
      number,
      driver,
      lisencePlate,
      consite,
      date,
      inKm,
      outKm,
      activity,
      fuel,
      oilM,
      graseM,
      hydraulicM,
      observations,
    });
    const savedGuide = await newGuide.save();
    res.json(savedGuide);
  } catch (err) {
    next(err);
  }
};

export const getGuides = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const consites = await Guide.find();
    res.json(consites);
  } catch (err) {
    next(err);
  }
};

export const getGuide = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const consite = await Guide.findById(req.params.id);
    if (!consite) return res.status(404).json({ message: "Guide not found" });
    res.json(consite);
  } catch (err) {
    next(err);
  }
};

export const deleteGuide = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const consite = await Guide.findByIdAndDelete(req.params.id);
    if (!consite) return res.status(404).json({ message: "Guide not found" });
    res.json(consite);
  } catch (err) {
    next(err);
  }
};

export const updateGuide = async (
  req: Request,
  res: Response
): Promise<Response> => {
  try {
    const consite = await Guide.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
    });
    if (!consite) return res.status(404).json({ message: "Guide not found" });
    return res.json(consite);
  } catch (err) {
    return res.status(500).json({ message: "Server error" });
  }
};
