import { z } from "zod";

export const CreateConsiteSchema = z.object({
  body: z.object({
    name: z.string().nonempty(),
    guides: z.string().optional(), // hasta que se implemente el campo de guias
    m3: z.number().optional(),
    KmCube: z.number().optional(),
    start: z.string().nonempty(),
    destinity: z.string().nonempty(),
    tLaps: z.number().optional(),
  }),
});

export type CreateConsiteType = z.infer<typeof CreateConsiteSchema>["body"];
