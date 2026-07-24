---
title: "Sleep Disorder Prediction"
code: "PRJ-10"
summary: "A classic Machine Learning pipeline that predicts a person's sleep disorder (insomnia, apnea, or none) from physiological and lifestyle data, comparing five models under two problem formulations."
year: "2026"
role: "ML Engineer"
status: "Demo"
category: "Data / ML"
stack: ["Python", "pandas", "NumPy", "scikit-learn", "matplotlib", "Jupyter", "pytest"]
order: 10
repo: "https://github.com/enzodp9/sleep-health-study"
---

## Goal

The project predicts whether a person has a sleep disorder from physiological and lifestyle variables, using a real-world dataset with loading errors, out-of-range values, and missing data. The core challenge is twofold: reproducible data cleaning, and choosing between a binary and a multiclass formulation while weighing the trade-off between accuracy and the interpretability of the final model.

## How it works

- **Deterministic cleaning:** correction of loading errors (typos in categories, malformed blood pressure, out-of-range values) and missing-value imputation, isolated in its own module and covered by automated tests.
- **Systematic exploration:** programmatic generation of univariate and correlation plots to characterize the dataset before modeling, instead of ad-hoc analysis.
- **Comparative modeling:** five models (logistic regression, two decision trees, two SVMs) trained under two target formulations -binary and multiclass- to contrast approaches.
- **Stratified cross-validation:** evaluation with K-fold and per-class metrics (recall, precision, specificity) instead of overall accuracy, avoiding conclusions biased by a single split.
- **Selection by interpretability:** the final model is chosen not for the highest accuracy, but for its ability to discriminate the disorder type, prioritizing an actionable output over the raw score.
