# Portfolio — Enzo Prediger

Sitio estático en [Astro](https://astro.build) con estética de **registro técnico / datasheet**: full monospace, mucho aire, un único acento cobalto. Los proyectos viven como Markdown en una _content collection_.

## Correr el proyecto

```bash
npm install      # instalar dependencias
npm run dev      # servidor de desarrollo en http://localhost:4321
npm run build    # build de producción → dist/
npm run preview  # previsualizar el build
```

Requiere Node 18+ (probado con Node 22).

## Editar proyectos

Cada proyecto es un `.md` en [`src/content/projects/`](src/content/projects/). El frontmatter está validado por el schema en [`src/content/config.ts`](src/content/config.ts):

| Campo      | Tipo                                                | Notas                                  |
| ---------- | --------------------------------------------------- | -------------------------------------- |
| `title`    | string                                              | Título del proyecto                    |
| `code`     | string                                              | Código de registro, ej. `"PRJ-01"`     |
| `summary`  | string                                              | Una línea para el índice               |
| `year`     | string                                              | ej. `"2026"` o `"2025 — presente"`     |
| `role`     | string                                              | Tu rol                                 |
| `status`   | string                                              | ej. `"En producción"`                  |
| `category` | `'Producto' \| 'IA / LLMs' \| 'Power Platform'`     | Define en qué grupo del índice aparece |
| `stack`    | string[]                                            | Tecnologías                            |
| `featured` | boolean (default `false`)                           | El destacado va arriba en la home      |
| `order`    | number (default `99`)                               | Orden ascendente                       |
| `repo`     | url (opcional)                                      | Link al repositorio                    |
| `link`     | url (opcional)                                      | Link a demo                            |

El cuerpo del Markdown usa `##` para las sub-secciones de la ficha.

## Estructura

```
src/
├── components/    # Header, Footer, Hero, FeaturedProject, ProjectIndex, ProjectRow, About
├── content/       # config.ts (schema) + projects/*.md
├── data/site.ts   # nombre, tagline, links (editar acá los datos personales)
├── layouts/       # BaseLayout.astro
├── pages/         # index.astro, 404.astro, projects/[slug].astro
└── styles/        # global.css (tokens + base)
```

## Pendientes a completar (placeholders marcados con `TODO(Enzo)`)

- [`astro.config.mjs`](astro.config.mjs) → `site:` con tu dominio real.
- [`src/data/site.ts`](src/data/site.ts) → `links.github` (reemplazar `TU-USUARIO`) y `links.cv` (link al PDF del CV).

## Deploy

Sitio 100% estático. Build command `npm run build`, output `dist/`.

- **Vercel** — preset "Astro" autodetectado. Build `npm run build`, output `dist`.
- **Netlify** — build command `npm run build`, publish directory `dist`.
- **Azure Static Web Apps** — app location `/`, output location `dist`, sin API.

Para que las URLs canónicas y Open Graph queden correctas, completá `site` en `astro.config.mjs` antes del deploy.
