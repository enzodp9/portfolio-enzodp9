---
title: "Fashion Visual Search"
code: "PRJ-05"
summary: "A visual fashion product search engine deployed on Azure that uses image embeddings (ResNet50) and exact vector search over PostgreSQL/pgvector to retrieve similar products."
year: "2026"
role: "ML Engineer"
status: "Demo"
category: "Data / ML"
stack: ["FastAPI", "PostgreSQL", "pgvector", "Supabase", "ResNet50", "TensorFlow/Keras", "React", "TypeScript", "Docker", "Azure Container Apps"]
order: 5
repo: "https://github.com/enzodp9/fashion-visual-search"
link: "https://fashion-visual-search.yellowfield-a80de18a.canadacentral.azurecontainerapps.io"
---

## Goal

Build a visual search system capable of retrieving similar fashion products
from an image, combining embedding extraction with exact vector search and
an architecture ready to run both locally and in the cloud.

## How it works

- **Embedding extraction:** a pretrained ResNet50 converts each image into
  a 2048-dimensional vector representing its visual features.
- **Vector search:** PostgreSQL with pgvector computes the L2 distance
  between the query embedding and the catalog, enabling exact similarity
  search with configurable radius and result count.
- **Portable infrastructure:** the backend can run interchangeably on
  local PostgreSQL or Supabase through a database-provider-independent
  configuration.
- **Dataset preparation:** a pipeline automatically generates a
  representative subset of the catalog, optimized for the storage
  constraints of the deployment environment.
- **Decoupled ingestion:** bulk image uploads run through a process
  independent of the HTTP cycle, making it easier to handle large
  catalogs and avoid duplicates.
