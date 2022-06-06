import { z } from 'zod';

export const createUserSchema = z.object({
  body: z.object({
    username: z.string({ required_error: 'Username is required' }),
    password: z.string({ required_error: 'Password is required' })
      .min(5, 'Password must be more than 5 characters')
      .max(32, 'Password must be less than 32 characters'),
    passwordConfirm: z.string({ required_error: 'Please confirm your password' }),
  }).refine((data) => data.password === data.passwordConfirm, {
    path: ['passwordConfirm'],
    message: 'Passwords do not match',
  }),
});

export const loginUserSchema = z.object({
  body: z.object({
    username: z.string({ required_error: 'Username is required' }),
    password: z.string({ required_error: 'Password is required' }).min(
      5,
      'Invalid email or password'
    ),
  }),
});

export type CreateUserType = z.infer<typeof createUserSchema>['body'];
export type LoginUserType = z.infer<typeof loginUserSchema>['body'];
