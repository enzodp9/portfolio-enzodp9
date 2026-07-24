---
title: "UD-TI Studio – Prompt-Based UI Generator"
code: "PRJ-02"
summary: "An AI-powered tool that generates React + Tailwind components from natural-language instructions using a locally run LLM. It supports conversational iteration and live previews of the changes."
year: "2026"
role: "AI/LLM Engineer"
status: "Demo"
category: "IA / LLMs"
stack: ["Next.js", "React", "TypeScript", "Tailwind", "shadcn/ui", "Ollama"]
order: 2
repo: "https://github.com/enzodp9/udti-studio"
---

## Goal

Explore the use of language models to automate the generation and iteration of user interfaces through natural language, running the entire inference pipeline locally to preserve privacy and reduce reliance on external services.

## How it works

- **Generation:** it interprets the user's description and uses an LLM run with Ollama to stream React + Tailwind components.
- **Validation:** the generated code is automatically processed to fix dependencies and inconsistencies before it runs.
- **Execution:** components render in an isolated sandbox, enabling an immediate and safe preview.
- **Iteration:** the user can refine the result through natural-language conversation, compare differences between versions, and export the generated prototype.
