---
title: "RAG Assistant for Microsoft Power Platform"
code: "PRJ-01"
summary: "An AI assistant built on RAG that answers questions about Microsoft Power Platform through semantic search over the official documentation, generating responses with verifiable citations using local LLMs."
year: "2026"
role: "Personal Project"
status: "Active"
category: "IA / LLMs"
stack: ["Python", "Next.js", "React", "TypeScript", "Tailwind", "SQLite + sqlite-vec", "Ollama", "better-sqlite3"]
order: 1
repo: "https://github.com/enzodp9/rag-powerplatform/"
---

## Goal

Build a RAG assistant capable of answering natural-language questions about Microsoft Power Platform documentation (Power Automate, Power Apps, Power Pages, and Power BI), running the entire pipeline locally to preserve privacy and provide responses with verifiable citations from Microsoft Learn.

## How it works

- **Ingestion:** a Python pipeline downloads and processes the official documentation, stripping the frontmatter and splitting it into chunks optimized for semantic search.
- **Indexing:** each chunk is converted into embeddings with `nomic-embed-text` via Ollama and stored in SQLite with `sqlite-vec`. The process is incremental, reprocessing only new or modified content.
- **Query:** the app translates the query into English, runs a vector similarity search, and streams the answer with a local LLM, including direct links to the Microsoft Learn sources.
