import { Response, Request, NextFunction } from "express";
import User from "../models/user.model";
import { LoginUserType } from "../schemas/user.schema";



export const getUser = async (
  req: Request<unknown, unknown, LoginUserType>,
  res: Response,
  next: NextFunction
) => {
  try {
    const user = await User.findOne({ username: req.body.username });
    if (!user) return res.status(401).json({ message: "Invalid credentials" });
    if (!(await user.comparePasswords(user.password, req.body.password))) {
      return res.status(401).json({ message: "Invalid credentials" });
    }


    // Pendiente: Crear token de autenticación, verificar los roles
    const respUser =  {
        id: user._id,
        username: user.username,
        password:  '',
        idType: user.idType,
        idProfile: user.idProfile
    }

    res.json(respUser);
    console.log(respUser);
  } catch (err) {
    next(err);
  }
};
