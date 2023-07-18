import z from 'zod'

export interface EditCommentInputDTO {
  textarea: string,
  token: string,
  idToEdit: string
}

export type EditCommentOutputDTO = undefined

export const EditCommentSchema = z.object({
  textarea: z.string().min(1),
  token: z.string().min(1),
  idToEdit: z.string().min(1)
}).transform(data => data as EditCommentInputDTO)