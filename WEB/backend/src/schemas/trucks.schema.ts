import { z } from "zod";

export const CreateTrucksSchema = z.object({
  body: z.object({
    lisencePlate: z.string().optional(), // hasta que se implemente el campo de guias
    conSiteId: z.string().optional(),
    fuel: z.number(),
    cubedC: z.string().optional(),
    driverId: z.string().optional(),
  }),
});

export type CreateTrucksType = z.infer<typeof CreateTrucksSchema>["body"];
