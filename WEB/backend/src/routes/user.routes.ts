import { Router } from "express";
import {getUser} from "../controllers/user.controllers";
const router = Router();




router.post("/api/signin", getUser);


export default router;