---
title: "Intent Assistant MCP – Logistics"
code: "PRJ-03"
summary: "A conversational assistant built on the Model Context Protocol (MCP) that exposes a quarry's logistics business logic as reusable tools. An LLM uses tool calling to query trips, manage authorized parties, and analyze anomalies through natural language."
year: "2026"
role: "AI/LLM Engineer"
status: "In production"
category: "IA / LLMs"
stack: ["Python", "FastAPI", "LangGraph", "Claude (Anthropic API)", "MCP", "SQLite", "scikit-learn / PyOD", "React", "Vite", "Chart.js", "Azure App Service", "GitHub Actions"]
order: 3
repo: "https://github.com/enzodp9/intent-assistant"
link: "https://intent-assistant-enzo.azurewebsites.net"
---

## Goal

Explore the use of the Model Context Protocol (MCP) to expose a quarry's logistics business logic as reusable tools, letting an LLM interpret natural-language queries and execute actions through tool calling — replacing an architecture based on intent routers and rigid conversational flows.

## How it works

- **MCP server:** exposes the logistics business logic as reusable tools for querying trips, managing authorized parties, and detecting anomalies.
- **Tool calling:** Claude interprets the user's intent, selects the right tool, extracts the required parameters, and coordinates its execution through LangGraph.
- **Anomaly detection:** combines business rules with Machine Learning models (Isolation Forest via PyOD), keeping the decision logic outside the LLM.
- **Decoupled architecture:** the same MCP server can be consumed by the app's chat or by any MCP-compatible client, such as Claude Desktop or Claude Code, without changing the business logic.
