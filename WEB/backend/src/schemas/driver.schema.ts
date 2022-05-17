import { z } from "zod";

export const CreateDriverSchema = z.object({
  body: z.object({
    name: z.string().nonempty(), 
  }),
});

export type CreateDriverType = z.infer<typeof CreateDriverSchema>["body"];
