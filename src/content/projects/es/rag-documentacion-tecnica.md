---
title: "Asistente RAG para Microsoft Power Platform"
code: "PRJ-01"
summary: "Asistente de IA basado en RAG que responde consultas sobre Microsoft Power Platform mediante búsqueda semántica sobre la documentación oficial y generación de respuestas con citas verificables mediante LLM locales."
year: "2026"
role: "Proyecto Personal"
status: "Activo"
category: "IA / LLMs"
stack: ["Python", "Next.js", "React", "TypeScript", "Tailwind", "SQLite + sqlite-vec", "Ollama", "better-sqlite3"]
order: 1
repo: "https://github.com/enzodp9/rag-powerplatform/"
---

## Objetivo

Desarrollar un asistente RAG capaz de responder consultas en lenguaje natural sobre la documentación de Microsoft Power Platform (Power Automate, Power Apps, Power Pages y Power BI), ejecutando todo el procesamiento de forma local para preservar la privacidad y proporcionar respuestas con citas verificables de Microsoft Learn.

## Cómo funciona

- **Ingesta:** un pipeline en Python descarga y procesa la documentación oficial, eliminando el frontmatter y dividiéndola en fragmentos optimizados para búsqueda semántica.
- **Indexado:** cada fragmento se convierte en embeddings con `nomic-embed-text` mediante Ollama y se almacena en SQLite con `sqlite-vec`. El proceso es incremental, reprocesando únicamente contenido nuevo o modificado.
- **Consulta:** la aplicación traduce la consulta al inglés, realiza una búsqueda vectorial por similitud y genera la respuesta en streaming con un LLM local, incluyendo enlaces directos a las fuentes de Microsoft Learn.
