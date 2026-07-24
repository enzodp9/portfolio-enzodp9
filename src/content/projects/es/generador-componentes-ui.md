---
title: "UD-TI Studio - Generador de UI por prompt"
code: "PRJ-02"
summary: "Herramienta impulsada por IA que genera componentes React + Tailwind a partir de instrucciones en lenguaje natural mediante un LLM ejecutado localmente. Permite iterar conversacionalmente y previsualizar los cambios en tiempo real."
year: "2026"
role: "AI/LLM Engineer"
status: "Demo"
category: "IA / LLMs"
stack: ["Next.js", "React", "TypeScript", "Tailwind", "shadcn/ui", "Ollama"]
order: 2
repo: "https://github.com/enzodp9/udti-studio"
---

## Objetivo

Explorar el uso de modelos de lenguaje para automatizar la generación e iteración de interfaces de usuario mediante lenguaje natural, ejecutando todo el pipeline de inferencia localmente para preservar la privacidad y reducir la dependencia de servicios externos.

## Cómo funciona

- **Generación:** interpreta la descripción del usuario y utiliza un LLM ejecutado con Ollama para generar componentes React + Tailwind en streaming.
- **Validación:** el código generado se procesa automáticamente para corregir dependencias e inconsistencias antes de su ejecución.
- **Ejecución:** los componentes se renderizan en un sandbox aislado, permitiendo una previsualización inmediata y segura.
- **Iteración:** el usuario puede refinar el resultado mediante conversaciones en lenguaje natural, visualizar las diferencias entre versiones y exportar el prototipo generado.
