import User from "../models/user.model";
import Role from "../models/rol.model";
import { Response, Request, NextFunction } from "express";

export const createUser = async (
    req:Request, 
    res:Response,
    next:NextFunction
) => {
  try {
    const { username, email, password, roles } = req.body;

    const rolesFound = await Role.find({ name: { $in: roles } });

    // creating a new User
    const user = new User({
      username,
      email,
      password,
      roles: rolesFound.map((role) => role._id),
    });

    // encrypting password
    user.password = await User.passwordEncrypt(user.password);

    // saving the new user
    const savedUser = await user.save();

    return res.status(200).json({
      _id: savedUser._id,
      username: savedUser.username,
      email: savedUser.email,
      roles: savedUser.roles,
    });
  } catch (error) {
    console.error(error);
  }
};

export const getUsers = async (
    req:Request, 
    res:Response,
    next:NextFunction
) => {};

export const getUser = async (
    req:Request, 
    res:Response,
    next:NextFunction
) => {};
