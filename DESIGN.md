---
name: Portfolio — Enzo Prediger
description: Registro técnico / datasheet — display geométrico, cuerpo sans legible, mono reservado para datos/códigos, un único acento cobalto.
colors:
  ink: "#14161b"
  ink-soft: "#46484c"
  paper: "#f6f6f4"
  surface: "#ffffff"
  muted: "#6e6e73"
  line: "#ddddd8"
  cobalto-blueprint: "#2a4ddb"
  cobalto-soft: "#2a4ddb0f"
typography:
  display:
    fontFamily: "Space Grotesk, sans-serif"
    fontSize: "clamp(2.1rem, 8vw, 4.25rem)"
    fontWeight: 700
    lineHeight: 1.05
    letterSpacing: "-0.035em"
  headline:
    fontFamily: "Space Grotesk, sans-serif"
    fontSize: "clamp(1.8rem, 5vw, 2.6rem)"
    fontWeight: 700
    lineHeight: 1.08
    letterSpacing: "-0.03em"
  title:
    fontFamily: "Space Grotesk, sans-serif"
    fontSize: "1.02rem"
    fontWeight: 600
    lineHeight: 1.2
    letterSpacing: "-0.005em"
  body:
    fontFamily: "IBM Plex Sans, sans-serif"
    fontSize: "0.95rem"
    fontWeight: 400
    lineHeight: 1.75
    letterSpacing: "normal"
  mono:
    fontFamily: "IBM Plex Mono, ui-monospace, monospace"
    fontSize: "0.72rem"
    fontWeight: 500
    lineHeight: 1.4
    letterSpacing: "0.04em"
  label:
    fontFamily: "IBM Plex Mono, ui-monospace, monospace"
    fontSize: "0.64rem"
    fontWeight: 600
    lineHeight: 1.2
    letterSpacing: "0.14em"
rounded:
  sm: "2px"
  md: "6px"
spacing:
  pad: "1.5rem"
  pad-wide: "2.5rem"
  maxw: "1120px"
  rhythm: "clamp(4rem, 10vw, 7rem)"
components:
  card:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.ink}"
    rounded: "{rounded.md}"
    padding: "1.15rem 1.35rem"
  card-hover:
    borderColor: "{colors.cobalto-blueprint}"
    shadow: "0 14px 28px -18px rgba(20,22,27,0.18)"
  timeline-dot:
    borderColor: "{colors.cobalto-blueprint}"
    backgroundColor: "{colors.paper}"
  chip:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.ink}"
    rounded: "{rounded.md}"
    padding: "0.28rem 0.6rem"
  nav-link:
    textColor: "{colors.muted}"
  nav-link-hover:
    textColor: "{colors.cobalto-blueprint}"
---

# Design System: Portfolio — Enzo Prediger

## 1. Overview

**Creative North Star: "La Ficha Técnica"**

El sitio se comporta como el datasheet de un componente: cada proyecto es una ficha con código de registro (`PRJ-01`), especificaciones tabuladas (año, rol, estado, stack) y un estado declarado. Nada se vende; todo se cataloga. La personalidad es la de un ingeniero que documenta con el mismo rigor con que construye — preciso, calmo, senior.

**v2 — de "full mono" a display + sans + mono.** La v1 del sistema era monoespaciada de punta a punta. En esta revisión el display pasó a Space Grotesk (geométrico, sans, con carácter propio para títulos) y el cuerpo de lectura a IBM Plex Sans (más cómodo en párrafos largos); IBM Plex Mono se conserva pero baja de rango — ya no es "la fuente", es el registro reservado para datos, códigos, fechas y etiquetas (`PRJ-01`, `dt` de ficha, nav, badges). El efecto buscado: los títulos respiran como headings reales, el cuerpo se lee más rápido, y el mono sigue marcando "esto es un dato" cada vez que aparece — su contraste con el resto es parte de la señalización, igual que el cobalto.

Las superficies también se abrieron un poco: tarjetas de proyecto y chips ahora usan `--surface` (blanco puro) sobre `--paper` (crema apagado), con radios de 6px (`--radius-md`) — un paso atrás del "casi cuadrado" estricto de la v1, pero sin llegar a redondeado suave. La estructura sigue dibujándose con hairlines de 1px donde no hay tarjeta de por medio (headers de sección, filas de ficha, timeline).

Este sistema rechaza explícitamente lo que satura los portfolios de dev en 2026: las plantillas genéricas de tarjetas idénticas (icono decorativo + título + texto repetidos como andamiaje), el glassmorphism decorativo, el texto con gradiente, el template hero-metric de SaaS, las eyebrows en mayúscula tracked como andamiaje sobre cada sección, y todo tono de marketing ("revolucionario", "passionate developer", emojis). Los íconos funcionales (GitHub, enlace externo, ubicación, mail, CV) en acciones puntuales no violan esta regla — señalizan una acción real, no decoran un encabezado. Si se ve "hecho por un generador", falló: la calidad de la ejecución ES la credencial.

**Key Characteristics:**
- Tres roles tipográficos con jerarquía clara: Space Grotesk (títulos/headings), IBM Plex Sans (cuerpo de lectura), IBM Plex Mono (datos, códigos, labels, nav).
- Cobalto Blueprint como único acento — presente en más puntos que en la v1 (barra de scroll del header, marcador de eyebrow, badges, botones de ícono, timeline, hairlines de encabezado) pero siempre como trazo fino, marcador chico o borde, nunca como fondo grande y estático.
- Elevación mixta: hairlines de 1px para la estructura general; tarjetas y chips en `--surface` blanco con una única excepción de sombra — restringida, sutil, solo en hover de tarjeta (ver Elevation).
- Radios de 2px (`--radius-sm`, elementos chatos: badges pequeños, inputs) y 6px (`--radius-md`, tarjetas y chips) — nunca pills ni esquinas muy redondeadas.
- Aire generoso, ancho de medida ~52–68ch para prosa, columna central de 1120px.

## 2. Colors

Paleta casi monocroma de tinta sobre papel/superficie, interrumpida por una voz cobalto. Estrategia **Restrained, amplificada**: un único acento, presente en más lugares que en la v1, siempre puntual.

### Primary
- **Cobalto Blueprint** (#2a4ddb): la única voz de color. Marca lo accionable o lo indexado: códigos de registro (`PRJ-01`), flechas, el cursor `▍`/`_` del hero, el anillo de foco, hovers de links/chips/tarjetas, la barra de scroll del header, el marcador de cada eyebrow, badges, botones de ícono y los puntos de la timeline de experiencia.
- **Cobalto Soft** (#2a4ddb0f, ~6%): relleno de fondo en hover de filas/badges.

### Neutral
- **Tinta** (#14161b): texto principal.
- **Tinta suave** (#46484c, `--ink-soft`): texto de cuerpo secundario que se lee completo (descripciones de tarjeta, summary de proyecto, párrafos de timeline) — más oscuro que `--muted`, siempre AA sobre papel y superficie.
- **Papel** (#f6f6f4): fondo de página.
- **Superficie** (#ffffff, `--surface`): fondo de tarjetas de proyecto y chips — un escalón por encima del papel, sin textura ni gradiente.
- **Apagado / Muted** (#6e6e73): solo labels cortos y metadata (`dt`, fechas, org en itálica) — nunca texto de cuerpo continuo.
- **Línea** (#ddddd8): hairlines y divisores de 1px.

### Named Rules
**La Regla de Una Sola Voz.** Nunca se suma un segundo color. El cobalto puede aparecer en más elementos que antes siempre que cada aparición sea puntual (línea, marcador chico, borde, ícono, punto de timeline) y no un fondo grande y estático.

**La Regla del Contraste Honesto.** `--muted` es solo para labels/metadata cortos. Cualquier texto que el lector deba leer completo (descripciones, summaries, párrafos) va en `--ink` o `--ink-soft` — nunca en `--muted`.

## 3. Typography

**Display:** Space Grotesk (500/600/700) — títulos, headings, nombre del hero, títulos de tarjeta/entrada.
**Body:** IBM Plex Sans (400/500/600) — párrafos, descripciones, texto de lectura continua.
**Mono:** IBM Plex Mono (400/500/600) — códigos de registro, fechas, `dt` de ficha, nav, chips de stack, badges. Clase utilitaria `.mono` y variable `--font-mono`.

**Character:** display + body en contraste de familia (geométrico sans vs. humanista sans) es el eje principal; mono entra como tercera voz deliberadamente distinta (monoespaciada) para marcar "esto es un dato", no para narrar. La tagline del hero es una excepción intencional: va en mono para sostener el guiño "terminal" sin que todo el sitio lo sea.

### Hierarchy
- **Display** (700, clamp(2.1rem, 8vw, 4.25rem), lh 1.05, ls -0.035em): nombre en el hero. Una vez por home.
- **Headline** (700, clamp(1.8rem, 5vw, 2.6rem), lh 1.08, ls -0.03em): `h1` de la ficha de proyecto.
- **Title** (600, ~1rem, lh 1.2, ls -0.005em): título de tarjeta de proyecto, rol en timeline/formación.
- **Body** (400, 0.95rem, lh 1.75): párrafos y descripciones. Medida máxima 52–68ch.
- **Mono** (500, 0.7–0.75rem): códigos, fechas, chips.
- **Label** (600, 0.64rem, ls 0.14em, mayúsculas, mono): eyebrows y `dt` de ficha.

### Named Rules
**La Regla de la Jerarquía sin Color.** Tamaño, peso, familia y aire establecen la jerarquía. El cobalto no se usa para "destacar" un encabezado: señaliza acción, no importancia.

**La Regla del Tracking de Etiqueta.** Las mayúsculas solo viven en labels cortos (eyebrows, `dt`, nav) en mono con tracking ≥0.06em. Prohibido el texto de cuerpo en mayúsculas.

## 4. Elevation

Sistema mayormente plano: hairlines de 1px para toda la estructura que no es tarjeta (headers de sección, filas de ficha, timeline, header del sitio). **Única excepción de sombra:** las tarjetas de proyecto (`.card`), que en hover levantan (`translateY(-3px)`) y suman una sombra restringida (`0 14px 28px -18px rgba(20,22,27,.18)`) junto con un borde que vira a cobalto — es un hover de tarjeta blanca sobre papel, acotado a un elemento y a un estado, no una sombra decorativa estática en todo el sitio. Fuera de ese caso puntual, sigue sin haber `box-shadow` en ningún lado. El header sticky usa `backdrop-filter: blur(8px)` sobre papel translúcido — funcional, no decorativo.

### Named Rules
**La Regla de la Hairline (con una excepción con nombre).** La estructura por defecto se dibuja con líneas de 1px, no con cajas ni sombras. La única sombra permitida del sistema es la de `.card:hover` — si se necesita "profundidad" en cualquier otro lado, se resuelve con hairline y aire.

## 5. Components

### Cards (tarjetas de proyecto)
- **Fondo:** `--surface` (blanco) sobre `--paper`.
- **Borde:** 1px `--line`; en hover/focus-within pasa a `color-mix(cobalto 35%, --line)`.
- **Radio:** `--radius-md` (6px).
- **Hover:** `translateY(-3px)` + sombra restringida (ver Elevation) — sin bordes de acento lateral, sin franjas de color.
- **Estructura:** código (mono, cobalto) + título (Space Grotesk 600) en una fila; descripción debajo en `--ink-soft`; acciones (repo/demo) como botones de ícono cuadrados a la derecha, con `z-index` propio para que sigan siendo clickeables aunque el título use un link "stretched" (`::after` con `inset:0`) para cubrir toda la tarjeta.
- **Sin flecha de salida:** el lift + cambio de borde ya comunican interactividad; se sacó la flecha `→` que usaba la v1 (fila plana) para no duplicar la señal.

### Icon Buttons (acciones de repo/demo)
- Cuadrado ~2rem, radio `--radius-md`, borde 1px `--line`, ícono `--muted`.
- **Hover/focus:** borde y color pasan a cobalto — sin relleno sólido (a diferencia de la v1, que sí rellenaba; se simplificó porque ahora el lift de la tarjeta ya es la señal principal de interacción).

### Timeline (Experiencia)
- Línea vertical: `border-left: 1px solid var(--line)` en el `<ol>`, con `padding-left` para dejar espacio a los puntos.
- Punto por entrada: círculo de 9px, fondo `--paper`, borde 2px cobalto, posicionado absoluto sobre la línea (`left` negativo + `translateX(-50%)`).
- Cada entrada es un `<li position:relative>` sin hairline propia — la línea + los puntos reemplazan los separadores horizontales que usaba la v1.
- Formación Académica **no** usa timeline — sigue con filas separadas por hairline (`border-top`), es una lista de hechos puntuales, no una secuencia narrada.

### Chips (stack tags)
- **Style:** fondo `--surface`, borde 1px `--line`, radio `--radius-md`, mono 0.72–0.74rem, padding ~0.28rem 0.6rem.
- **Hover:** borde y texto a cobalto + `translateY(-1px)` sutil. Blanco sobre papel es intencional — separa visualmente el chip de su fondo sin necesitar relleno de color.

### Links
- **Texto (.link):** color heredado, `border-bottom` transparente → cobalto en hover.
- **Nav (.nav-link):** mono uppercase tracked, `--muted` → cobalto en hover con hairline inferior.
- **Prosa de Markdown:** links en cobalto con `border-bottom` al 35% de opacidad.

### Navigation
- **Header:** sticky, borde inferior `--line`, papel translúcido + blur. Marca `EP` (Space Grotesk 700) + punto cobalto de 5px.
- **Barra de registro (`::before`, 3px):** su ancho (`scaleX`) refleja el progreso de scroll de la página en vivo. Fallback sin JS/reduced-motion: `--scroll-progress` no seteada → `1` → barra completa y quieta.
- **Nav items:** solo secciones de la página (Formación, Experiencia, Proyectos, Sobre mí). Los perfiles externos (GitHub, LinkedIn) viven en el hero, no en el header — el header es navegación interna, el hero es la ficha de identidad.
- **Mobile (≤460px):** la nav reduce gap y tamaño de fuente.

### Hero — sin cajitas
- El spec strip (ubicación / contacto / cv / perfiles) es una sola hairline arriba de las 4 columnas, sin bordes verticales entre campos ni caja de fondo. Cada campo lleva un ícono cobalto de 0.95em antes del label mono.
- La tagline va en IBM Plex Mono (excepción deliberada, ver Typography).

### Eyebrows
- Todo `.eyebrow` lleva un marcador cobalto de 7×7px antes del texto (mismo lenguaje que el punto de marca del header).

### Hairlines de encabezado ligadas al scroll (`[data-reveal="rule"]`)
- Los encabezados de "Formación Académica", "Experiencia Profesional" y "Proyectos" dibujan su hairline inferior en cobalto con `transform: scaleX(var(--progress, 1))`, recalculado en cada frame de scroll según la cercanía del encabezado al centro del viewport.
- **Fallback sin JS o con reduced-motion:** `--progress` nunca se pisa → cae en `1` → línea completa y estática. No depende de ninguna media query.
- No usar `transition` CSS sobre ese `transform` — el refresco a 60fps vía `requestAnimationFrame` ya es la fuente de la suavidad.

### Signature: el Cursor del Hero
El `▍` cobalto que parpadea junto al nombre. Respeta `prefers-reduced-motion` vía el reset global.

## 6. Do's and Don'ts

### Do:
- **Do** usar Space Grotesk para títulos, IBM Plex Sans para cuerpo, IBM Plex Mono para datos/labels — cada uno en su rol, sin mezclarlos.
- **Do** usar el Cobalto Blueprint con frecuencia (barra de header, marcadores, badges, botones de ícono, timeline, hairlines) siempre en trazos finos, marcadores chicos o bordes — nunca como fondo grande y estático.
- **Do** usar `--surface` blanco + `--radius-md` (6px) para tarjetas y chips; todo lo demás sigue con hairlines de 1px y `--radius-sm` (2px).
- **Do** reservar la sombra de `.card:hover` como única excepción de elevación del sistema.
- **Do** poner el texto que se lee completo en `--ink` o `--ink-soft`; reservar `--muted` para labels cortos.
- **Do** usar íconos funcionales (GitHub, enlace externo, ubicación, mail, CV) exclusivamente para acciones reales — nunca como decoración de sección.
- **Do** dar alternativa de `prefers-reduced-motion` a toda animación.

### Don't:
- **Don't** volver a "full mono" — Space Grotesk y IBM Plex Sans son parte comprometida de la identidad v2, no un experimento.
- **Don't** introducir plantillas genéricas de "dev portfolio": grillas de tarjetas idénticas icono + título + texto, o íconos decorativos sobre cada encabezado.
- **Don't** usar glassmorphism decorativo, texto con gradiente, ni el template hero-metric de SaaS.
- **Don't** poner eyebrows en mayúscula tracked como andamiaje sobre cada sección, ni marcadores numerados (01/02/03) que no sean una secuencia real.
- **Don't** agregar sombras en ningún lado fuera de `.card:hover` — esa es la única excepción con nombre, no un precedente general.
- **Don't** usar `--muted` para texto de cuerpo continuo.
- **Don't** usar el cobalto como relleno sólido grande ni para jerarquizar encabezados.
- **Don't** usar `border-left`/`border-right` >1px como franja de acento, ni pills, ni tono de marketing.
