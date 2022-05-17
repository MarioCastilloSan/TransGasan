import { CreateTrucksSchema } from './../schemas/trucks.schema';
import { CreateGuidesSchema } from './../schemas/guides.schema';
import { CreateDriverSchema } from './../schemas/driver.schema';
import { Router } from "express";

const router = Router();

import {
    getConsites,
    getConsite,
    createConsite,
    updateConsite,
    deleteConsite,
} from "../controllers/consite.controllers";
import {
    getDrivers,
    getDriver,
    createDriver,
    updateDriver,
    deleteDriver,
} from "../controllers/driver.controllers";
import {
    getGuides,
    getGuide,
    createGuide,
    updateGuide,
    deleteGuide
} from "../controllers/guide.controllers";
import{
    getTrucks,
    getTruck,
    createTruck,
    updateTruck,
    deleteTruck
} from "../controllers/truck.controllers";
import { validateSchema } from "../middleware/validateSchema.middleware";
import { CreateConsiteSchema } from "../schemas/consite.schema";

/* A router for the API. */
router.get("/consites", getConsites);
router.get("/consite/:id", getConsite);
router.delete("/consite/:id", deleteConsite);
router.put("/consite/:id", updateConsite);
router.post("/consite", validateSchema(CreateConsiteSchema), createConsite);


router.get("/drivers/", getDrivers);
router.get("/driver/:id", getDriver);
router.delete("/driver/:id", deleteDriver);
router.put("/driver/:id", updateDriver);
router.post("/driver", validateSchema(CreateDriverSchema),createDriver);

router.get("/guides/", getGuides);
router.get("/guide/:id", getGuide);
router.delete("/guide/:id", deleteGuide);
router.put("/guide/:id", updateGuide);
router.post("/guide", validateSchema(CreateGuidesSchema),createGuide);

router.get("/trucks/", getTrucks);
router.get("/truck/:id", getTruck);
router.delete("/truck/:id", deleteTruck);
router.put("/truck/:id", updateTruck);
router.post("/trucks", validateSchema(CreateTrucksSchema),createTruck);

export default router;