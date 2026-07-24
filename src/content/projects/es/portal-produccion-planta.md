---
title: "Portal de Gestión de Producción para Cantera de Áridos"
code: "PRJ-08"
summary: "Portal desarrollado sobre Microsoft Power Platform que digitaliza la gestión operativa de una cantera, implementando un modelo de datos en Dataverse, control de acceso granular y un motor de liquidación de regalías con lógica de negocio personalizada."
year: "2026"
role: "Power Platform Developer · Cantera La Chola II"
status: "En producción"
category: "Power Platform"
stack: ["Microsoft Power Pages", "Microsoft Dataverse", "Power Automate", "Liquid Templates", "JavaScript", "Bootstrap", "YAML (Site as Code)"]
order: 8
link: "https://produccion.canteralachola.com.ar"
---

## Objetivo

Digitalizar la gestión operativa de una cantera de áridos mediante Microsoft
Power Platform, centralizando procesos de producción, stock, laboratorio,
mantenimiento y recursos humanos. El principal desafío fue implementar
reglas de negocio complejas y un modelo de seguridad granular sobre una
plataforma low-code, evitando el desarrollo de un backend tradicional.

## Cómo funciona

- **Modelo de datos:** la información operativa se almacena en tablas
  personalizadas de Microsoft Dataverse que representan los procesos de
  producción, stock, laboratorio, mantenimiento, empleados y liquidaciones.
- **Seguridad:** un modelo de permisos por tablas y roles controla el acceso
  a cada entidad y operación, garantizando que cada perfil visualice y
  modifique únicamente la información autorizada.
- **Motor de liquidación:** calcula automáticamente regalías mineras,
  acumulados históricos y retenciones impositivas aplicando reglas de
  negocio específicas del dominio.
- **Automatización:** procesos regulatorios e integraciones, como la firma
  digital de informes de laboratorio, se ejecutan mediante flujos de Power
  Automate.
- **Arquitectura:** una capa de servicios centraliza la lógica de negocio
  sobre Dataverse, desacoplando la interfaz del acceso a datos y
  favoreciendo la reutilización del código.
