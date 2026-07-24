---
title: "Demand Forecasting and Inventory Optimization for a Bakery"
code: "PRJ-06"
summary: "A Data Science pipeline that turns historical sales data into an optimal replenishment plan, combining ABC-XYZ classification, SARIMA forecasting, and mathematical optimization of inventory costs."
year: "2024"
role: "Data Scientist"
status: "Demo"
category: "Data / ML"
stack: ["Python", "Pandas", "statsmodels", "Pyomo", "ipopt", "Streamlit", "Plotly"]
order: 6
repo: "https://github.com/enzodp9/bakery-demand-inventory"
link: "https://bakery-demand-inventory.streamlit.app/"
---

## Goal

Build an inventory planning system able to determine how much to order of each ingredient, accounting for seasonal demand, forecast uncertainty, and costs tied to purchasing, storage, and ordering. The main challenge is integrating predictive models with an optimization model that turns estimates into operational decisions.

## How it works

- **Demand segmentation:** classifies ingredients through ABC-XYZ analysis, combining economic impact and consumption variability to prioritize forecasting models.
- **Forecasting:** uses seasonal SARIMA models to predict each ingredient's future demand, evaluating performance with metrics such as MAE, RMSE, and MAPE.
- **Optimization:** a mathematical model built with Pyomo and ipopt calculates optimal purchase and inventory quantities, minimizing operating costs under business constraints.
- **Validation:** the model is cross-checked against an independent LINGO implementation to verify the solution obtained.
- **Simulation:** an interactive app allows adjusting capacity and cost parameters to analyze alternative scenarios without altering the original plan.
