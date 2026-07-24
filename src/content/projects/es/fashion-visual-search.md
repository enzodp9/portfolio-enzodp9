---
title: "Fashion Visual Search"
code: "PRJ-05"
summary: "Buscador visual de productos de moda desplegado en Azure que utiliza embeddings de imágenes (ResNet50) y búsqueda vectorial exacta sobre PostgreSQL/pgvector para recuperar productos similares."
year: "2026"
role: "ML Engineer"
status: "Demo"
category: "Datos / ML"
stack: ["FastAPI", "PostgreSQL", "pgvector", "Supabase", "ResNet50", "TensorFlow/Keras", "React", "TypeScript", "Docker", "Azure Container Apps"]
order: 5
repo: "https://github.com/enzodp9/fashion-visual-search"
link: "https://fashion-visual-search.yellowfield-a80de18a.canadacentral.azurecontainerapps.io"
---

## Objetivo

Desarrollar un sistema de búsqueda visual capaz de recuperar productos de moda
similares a partir de una imagen, combinando extracción de embeddings con
búsqueda vectorial exacta y una arquitectura preparada para ejecutarse tanto
localmente como en la nube.

## Cómo funciona

- **Extracción de embeddings:** una ResNet50 preentrenada convierte cada
  imagen en un vector de 2048 dimensiones que representa sus características
  visuales.
- **Búsqueda vectorial:** PostgreSQL con pgvector calcula la distancia L2
  entre el embedding de consulta y el catálogo, permitiendo realizar
  búsquedas exactas por similitud con radio y cantidad de resultados
  configurables.
- **Infraestructura portable:** el backend puede ejecutarse indistintamente
  sobre PostgreSQL local o Supabase mediante una configuración independiente
  del proveedor de base de datos.
- **Preparación del dataset:** un pipeline genera automáticamente un
  subconjunto representativo del catálogo, optimizado para las
  restricciones de almacenamiento del entorno de despliegue.
- **Ingesta desacoplada:** la carga masiva de imágenes se realiza mediante un
  proceso independiente del ciclo HTTP, facilitando el procesamiento de
  catálogos de gran tamaño y evitando duplicados.
