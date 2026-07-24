---
title: "Production Management Portal for an Aggregate Quarry"
code: "PRJ-08"
summary: "A portal built on Microsoft Power Platform that digitizes a quarry's operational management, implementing a Dataverse data model, granular access control, and a royalty settlement engine with custom business logic."
year: "2026"
role: "Power Platform Developer · Cantera La Chola II"
status: "In production"
category: "Power Platform"
stack: ["Microsoft Power Pages", "Microsoft Dataverse", "Power Automate", "Liquid Templates", "JavaScript", "Bootstrap", "YAML (Site as Code)"]
order: 8
link: "https://produccion.canteralachola.com.ar"
---

## Goal

Digitize an aggregate quarry's operational management using Microsoft
Power Platform, centralizing production, inventory, laboratory,
maintenance, and HR processes. The main challenge was implementing
complex business rules and a granular security model on a low-code
platform, avoiding the development of a traditional backend.

## How it works

- **Data model:** operational data is stored in custom Microsoft
  Dataverse tables representing production, inventory, laboratory,
  maintenance, employee, and settlement processes.
- **Security:** a table- and role-based permission model controls access
  to each entity and operation, ensuring each profile can only view and
  modify authorized information.
- **Settlement engine:** automatically calculates mining royalties,
  historical accruals, and tax withholdings by applying domain-specific
  business rules.
- **Automation:** regulatory processes and integrations, such as the
  digital signing of lab reports, run through Power Automate flows.
- **Architecture:** a service layer centralizes the business logic over
  Dataverse, decoupling the interface from data access and favoring
  code reuse.
