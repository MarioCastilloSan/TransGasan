import { z } from "zod";

export const CreateGuidesSchema = z.object({
  body: z.object({
    number: z.number(),
    driver: z.string().optional(),
    lisencePlate: z.string().optional(), // hasta que se implemente el campo de guias
    consite:z.string().optional(),
    date: z.date(),
    inKm: z.number().optional(),
    outKm: z.number().optional(),
    activity: z.string().optional(),
    fuel: z.number().optional(),
    oilM: z.number().optional(),
    graseM: z.number().optional(),
    hydraulicM: z.number().optional(),
    observations: z.string().optional(),
  }),
});

export type CreateGuidesType = z.infer<typeof CreateGuidesSchema>["body"];
