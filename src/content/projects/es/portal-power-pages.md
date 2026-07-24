---
title: "Portal de Gestión Logística y Despacho de Áridos"
code: "PRJ-07"
summary: "Portal low-code sobre Microsoft Dataverse que digitaliza el ciclo completo de despacho de áridos y minerales —pedidos, flota, despacho, descarga y facturación— con seguridad granular por rol y automatización de procesos regulatorios vía Power Automate."
year: "2026"
role: "Power Platform Developer (Dataverse / Power Pages)"
status: "En producción"
category: "Power Platform"
stack: ["Microsoft Power Pages", "Microsoft Dataverse", "Power Automate", "Liquid Templates", "JavaScript", "Bootstrap", "YAML (site as code)"]
order: 7
link: "https://logistica.canteralachola.com.ar"
---

## Objetivo

El proyecto resuelve la gestión operativa de una cantera de áridos: pedidos,
asignación de flota y choferes, despacho, descarga y tarifas, con accesos
diferenciados para personal interno, clientes y transportistas externos. El
desafío técnico central es implementar control de acceso granular por tabla
y rol sobre Dataverse (95 reglas de permisos) y delegar procesos
regulatorios —certificados, guía minera— a Power Automate, evitando backend
propio y reduciendo superficie de mantenimiento.

## Cómo funciona

- **Modelo de datos:** el dominio completo (pedidos, órdenes de despacho,
  flota, choferes, tarifas, documentación) vive en tablas custom de
  Dataverse, con relaciones entre clientes, transportistas y viajes.
- **Seguridad por rol:** 95 reglas de table permissions definen, para cada
  combinación de entidad y rol (administrador, balancero de despacho,
  balancero de descarga, cliente, transportista, departamento de
  logística), qué operaciones y qué alcance de datos tiene cada usuario.
- **Formularios multi-paso:** la creación de órdenes se resuelve con
  advanced forms segmentados en pasos (orden → despacho → descarga), con
  variantes según el tipo de producto (áridos/arena) y el tipo de
  solicitante (cliente/empresa de transporte).
- **Automatización externa:** acciones críticas del proceso —envío de
  certificados, obtención de la guía minera— se delegan a flujos de Power
  Automate invocados desde el portal en lugar de resolverse con lógica
  propia.
- **Renderizado del sitio:** templates Liquid reutilizables (header, footer,
  breadcrumbs, paginación, búsqueda) parametrizan la experiencia en las 47
  páginas del portal.
