import z from 'zod'

export interface CreatePostInputDTO {
  textarea: string,
  token: string
}

export type CreatePostOutputDTO = undefined

export const CreatePostSchema = z.object({
  textarea: z.string().min(1),
  token: z.string().min(1)
}).transform(data => data as CreatePostInputDTO)