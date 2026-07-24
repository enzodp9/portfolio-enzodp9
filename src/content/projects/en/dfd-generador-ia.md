---
title: "AI-Powered Data Flow Diagram (DFD) Generator"
code: "PRJ-04"
summary: "A tool that turns natural-language descriptions into Data Flow Diagrams (DFD) using LLMs. It implements structured prompting, schema validation, and provider-agnostic generation (Claude or OpenAI) to produce formally valid diagrams."
year: "2026"
role: "AI/LLM Engineer"
status: "Active"
category: "IA / LLMs"
stack: ["Next.js", "React", "TypeScript", "Tailwind", "shadcn/ui", "React Flow", "dagre", "Claude / OpenAI", "Zod"]
order: 4
repo: "https://github.com/enzodp9/dfd-generator"
---

## Goal

Explore the use of LLMs to automate the generation of Data Flow Diagrams (DFD) from natural language, ensuring a structured and formally valid output through prompting, schema validation, and business rules, without depending on a specific AI provider.

## How it works

- **Generation:** the user describes a system in natural language and selects the diagram's level of detail. A structured prompt guides the LLM to produce a DFD in JSON format.
- **Provider-agnostic:** an abstraction layer allows using Claude or OpenAI without modifying the generation logic.
- **Validation:** the response is validated with Zod, normalizing nodes and fixing connections to ensure compliance with Yourdon-DeMarco notation.
- **Visualization:** the diagram is automatically laid out and rendered as an interactive graph, which can be navigated, rearranged, and exported.
