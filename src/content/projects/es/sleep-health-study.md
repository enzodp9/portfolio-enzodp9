---
title: "Predicción de Trastornos del Sueño"
code: "PRJ-10"
summary: "Pipeline de Machine Learning clásico que predice el trastorno de sueño de una persona (insomnio, apnea o ninguno) a partir de datos fisiológicos y de estilo de vida, comparando cinco modelos bajo dos formulaciones del problema."
year: "2026"
role: "ML Engineer"
status: "Demo"
category: "Datos / ML"
stack: ["Python", "pandas", "NumPy", "scikit-learn", "matplotlib", "Jupyter", "pytest"]
order: 10
repo: "https://github.com/enzodp9/sleep-health-study"
link: "https://sleep-health-study-bemwcspo4jmkvcceeb5x38.streamlit.app"
---

## Objetivo

El proyecto predice si una persona sufre un trastorno de sueño a partir de variables fisiológicas y de estilo de vida, sobre un dataset real con errores de carga, valores fuera de rango y datos faltantes. El desafío central es doble: una limpieza de datos reproducible, y decidir entre una formulación binaria y una multiclase evaluando el trade-off entre exactitud e interpretabilidad del modelo final.

## Cómo funciona

- **Limpieza determinística:** corrección de errores de carga (typos en categorías, presión arterial mal formateada, valores fuera de rango) e imputación de faltantes, aislada en un módulo propio y cubierta por tests automatizados.
- **Exploración sistemática:** generación programática de gráficos univariados y de correlación para caracterizar el dataset antes de modelar, en lugar de un análisis ad-hoc.
- **Modelado comparativo:** cinco modelos (regresión logística, dos árboles de decisión, dos SVM) entrenados bajo dos formulaciones del target -binaria y multiclase- para contrastar enfoques.
- **Validación cruzada estratificada:** evaluación con K-fold y métricas por clase (recall, precisión, especificidad) en vez de accuracy global, evitando conclusiones sesgadas por una única partición.
- **Selección por interpretabilidad:** el modelo final se elige no por la máxima exactitud, sino por su capacidad de discriminar el tipo de trastorno, priorizando una salida accionable sobre el score.
