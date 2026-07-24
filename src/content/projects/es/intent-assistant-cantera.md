---
title: "Intent Assistant MCP - Logística"
code: "PRJ-03"
summary: "Asistente conversacional basado en Model Context Protocol (MCP) que expone la lógica de negocio de la logística de una cantera como herramientas reutilizables. Un LLM utiliza tool calling para consultar viajes, gestionar avalados y analizar anomalías mediante lenguaje natural."
year: "2026"
role: "AI/LLM Engineer"
status: "En producción"
category: "IA / LLMs"
stack: ["Python", "FastAPI", "LangGraph", "Claude (Anthropic API)", "MCP", "SQLite", "scikit-learn / PyOD", "React", "Vite", "Chart.js", "Azure App Service", "GitHub Actions"]
order: 3
repo: "https://github.com/enzodp9/intent-assistant"
link: "https://intent-assistant-enzo.azurewebsites.net"
---

## Objetivo

Explorar el uso de Model Context Protocol (MCP) para exponer la lógica de negocio de la logística de una cantera como herramientas reutilizables, permitiendo que un LLM interprete consultas en lenguaje natural y ejecute acciones mediante tool calling, reemplazando una arquitectura basada en routers de intenciones y flujos conversacionales rígidos.

## Cómo funciona

- **Servidor MCP:** expone la lógica de negocio de la logística como herramientas reutilizables para consultas de viajes, gestión de avalados y detección de anomalías.
- **Tool calling:** Claude interpreta la intención del usuario, selecciona la herramienta adecuada, extrae los parámetros necesarios y coordina su ejecución mediante LangGraph.
- **Detección de anomalías:** combina reglas de negocio con modelos de Machine Learning (Isolation Forest mediante PyOD), manteniendo la lógica de decisión fuera del LLM.
- **Arquitectura desacoplada:** el mismo servidor MCP puede ser consumido por el chat de la aplicación o por cualquier cliente compatible con MCP, como Claude Desktop o Claude Code, sin modificar la lógica de negocio.
