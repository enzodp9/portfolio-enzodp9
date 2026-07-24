---
title: "Pronóstico de demanda y optimización de inventario para panadería"
code: "PRJ-06"
summary: "Pipeline de Data Science que transforma datos históricos de ventas en un plan óptimo de reposición, combinando clasificación ABC-XYZ, forecasting SARIMA y optimización matemática de costos de inventario."
year: "2024"
role: "Data Scientist"
status: "Demo"
category: "Datos / ML"
stack: ["Python", "Pandas", "statsmodels", "Pyomo", "ipopt", "Streamlit", "Plotly"]
order: 6
repo: "https://github.com/enzodp9/bakery-demand-inventory"
link: "https://bakery-demand-inventory.streamlit.app/"
---

## Objetivo

Desarrollar un sistema de planificación de inventario capaz de determinar cuánto pedir de cada ingrediente considerando demanda estacional, incertidumbre del pronóstico y costos asociados a compra, almacenamiento y pedidos. El desafío principal es integrar modelos predictivos con un modelo de optimización que convierta las estimaciones en decisiones operativas.

## Cómo funciona

- **Segmentación de demanda:** clasifica ingredientes mediante análisis ABC-XYZ, combinando impacto económico y variabilidad de consumo para priorizar modelos de pronóstico.
- **Forecasting:** utiliza modelos SARIMA estacionales para predecir la demanda futura de cada ingrediente, evaluando su desempeño mediante métricas como MAE, RMSE y MAPE.
- **Optimización:** un modelo matemático desarrollado con Pyomo e ipopt calcula cantidades óptimas de compra e inventario, minimizando costos operativos bajo restricciones del negocio.
- **Validación:** el modelo se contrasta con una implementación independiente en LINGO para verificar la solución obtenida.
- **Simulación:** una aplicación interactiva permite modificar parámetros de capacidad y costos para analizar escenarios alternativos sin alterar el plan original.

