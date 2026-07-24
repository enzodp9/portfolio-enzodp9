---
title: "Aggregate Logistics and Dispatch Management Portal"
code: "PRJ-07"
summary: "A low-code portal on Microsoft Dataverse that digitizes the full aggregate and mineral dispatch cycle — orders, fleet, dispatch, unloading, and invoicing — with granular role-based security and automation of regulatory processes via Power Automate."
year: "2026"
role: "Power Platform Developer (Dataverse / Power Pages)"
status: "In production"
category: "Power Platform"
stack: ["Microsoft Power Pages", "Microsoft Dataverse", "Power Automate", "Liquid Templates", "JavaScript", "Bootstrap", "YAML (site as code)"]
order: 7
link: "https://logistica.canteralachola.com.ar"
---

## Goal

The project handles the operational management of an aggregate quarry:
orders, fleet and driver assignment, dispatch, unloading, and rates, with
differentiated access for internal staff, clients, and external carriers. The
core technical challenge is implementing granular access control by table
and role over Dataverse (95 permission rules) and delegating regulatory
processes — certificates, the mining guide — to Power Automate, avoiding a
custom backend and reducing maintenance surface.

## How it works

- **Data model:** the full domain (orders, dispatch orders, fleet, drivers,
  rates, documentation) lives in custom Dataverse tables, with relationships
  between clients, carriers, and trips.
- **Role-based security:** 95 table permission rules define, for each
  entity-role combination (administrator, dispatch scale operator,
  unloading scale operator, client, carrier, logistics department), which
  operations and data scope each user has.
- **Multi-step forms:** order creation is handled with advanced forms
  broken into steps (order → dispatch → unloading), with variants
  depending on the product type (aggregate/sand) and the requester type
  (client/carrier company).
- **External automation:** critical process actions — sending
  certificates, obtaining the mining guide — are delegated to Power
  Automate flows invoked from the portal instead of being solved with
  custom logic.
- **Site rendering:** reusable Liquid templates (header, footer,
  breadcrumbs, pagination, search) drive the experience across the
  portal's 47 pages.
