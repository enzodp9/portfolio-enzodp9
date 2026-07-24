import { defineCollection, z } from 'astro:content';

const projects = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    code: z.string(), // "PRJ-01"
    summary: z.string(), // una línea para el índice
    year: z.string(),
    role: z.string(),
    status: z.string(),
    category: z.enum([
      'Producto',
      'Product',
      'IA / LLMs',
      'Datos / ML',
      'Data / ML',
      'Power Platform',
    ]),
    stack: z.array(z.string()),
    featured: z.boolean().default(false),
    order: z.number().default(99),
    repo: z.string().url().optional(),
    link: z.string().url().optional(),
  }),
});

export const collections = { projects };
