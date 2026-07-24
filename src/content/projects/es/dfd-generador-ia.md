---
title: "Generador de Diagramas de Flujo de Datos (DFD) con IA"
code: "PRJ-04"
summary: "Herramienta que transforma descripciones en lenguaje natural en Diagramas de Flujo de Datos (DFD) mediante LLMs. Implementa prompting estructurado, validación de esquemas y generación agnóstica de proveedor (Claude u OpenAI) para producir diagramas formalmente válidos."
year: "2026"
role: "AI/LLM Engineer"
status: "Activo"
category: "IA / LLMs"
stack: ["Next.js", "React", "TypeScript", "Tailwind", "shadcn/ui", "React Flow", "dagre", "Claude / OpenAI", "Zod"]
order: 4
repo: "https://github.com/enzodp9/dfd-generator"
---

## Objetivo

Explorar el uso de LLMs para automatizar la generación de Diagramas de Flujo de Datos (DFD) a partir de lenguaje natural, garantizando una salida estructurada y formalmente válida mediante prompting, validación de esquemas y reglas de negocio, sin depender de un proveedor específico de IA.

## Cómo funciona

- **Generación:** el usuario describe un sistema en lenguaje natural y selecciona el nivel de detalle del diagrama. Un prompt estructurado guía al LLM para producir un DFD en formato JSON.
- **Proveedor agnóstico:** una capa de abstracción permite utilizar Claude u OpenAI sin modificar la lógica de generación.
- **Validación:** la respuesta se valida con Zod, normalizando nodos y corrigiendo conexiones para garantizar el cumplimiento de la notación Yourdon-DeMarco.
- **Visualización:** el diagrama se organiza automáticamente y se renderiza como un grafo interactivo, permitiendo navegarlo, reorganizarlo y exportarlo.

