# 🐕 Baskerville — Asistente de Búsqueda Laboral con IA

Un sistema de agentes de IA, pensado para correr sobre [Hermes Agent](https://github.com/) y un vault de [Obsidian](https://obsidian.md/), que analiza ofertas laborales con una visión crítica de mentor de carrera y genera documentación estructurada de cada postulación.

> *En "El sabueso de los Baskerville", Holmes no se deja engañar por la leyenda — investiga hasta encontrar la verdad detrás del mito. Baskerville hace lo mismo con las ofertas laborales: separa el discurso de marketing de lo que realmente implica el rol, antes de que inviertas tiempo postulando.*

Este proyecto nace de mi propio proceso de búsqueda laboral y de mi aprendizaje experimentando con agentes de IA, prompts estructurados y flujos multi-agente. Lo comparto como aporte a la comunidad y como evidencia de ese aprendizaje — siéntete libre de usarlo, adaptarlo y mejorarlo.

## ¿Qué hace?

- Un primer filtro rápido descarta en segundos las ofertas que no cumplen tus criterios mínimos (modalidad, salario, seniority, etc.), sin gastar el análisis completo en ellas
- Si pasa el filtro, la analiza en profundidad: tipo de empresa real, rol real (no el título), requisitos explícitos vs. implícitos, riesgos ocultos, evaluación numérica de fit (1–7), estimación salarial de mercado
- Genera un documento Markdown estructurado en tu vault, listo para consultar durante todo el proceso de postulación
- Permite agregar notas de seguimiento (entrevistas, cambios de estado) a postulaciones existentes

## Arquitectura: cuatro agentes, un solo sabueso

| Agente | Rol |
|---|---|
| 🔎 **Filtro** | Descarta rápido las ofertas que no cumplen tus criterios mínimos, antes de gastar análisis completo |
| 🧠 **Analista** | Razona críticamente sobre la oferta, cuestiona supuestos, evalúa fit |
| 📝 **Documentador** | Vuelca el análisis aprobado en la plantilla, sin reinterpretar |
| 🗂️ **Bitácora** | Gestiona notas de actualización sobre postulaciones existentes |

`AGENTS.md` controla el flujo (cuándo se activa cada agente). `SOUL.md` define quién es cada agente y cómo razona — juntos conforman a Baskerville.

## Requisitos

- [Hermes Agent](https://github.com/) (u otro orquestador compatible con archivos `AGENTS.md`/`SOUL.md`)
- Un vault de Obsidian (opcional, pero recomendado — el sistema asume Markdown compatible con Obsidian)
- Acceso a un modelo de lenguaje vía OpenRouter, API directa, o modelo local

## Instalación

1. Clona este repositorio o descarga los archivos.
2. Copia `AGENTS.md` y `SOUL.md` a la raíz de tu proyecto de gestión laboral (o donde tu orquestador los espere).
3. Edita la línea `VAULT_ROOT` en `AGENTS.md` con la ruta real de tu vault:
   ```
   VAULT_ROOT: /ruta/a/tu/vault
   ```
4. Crea la siguiente estructura de carpetas y archivos dentro de tu vault:
   ```
   09 Gestión Laboral/
   ├── AGENTS.md
   ├── SOUL.md
   ├── Perfil/
   |  |── Criterios de Evaluación.md
   |  |── Curriculum.md
   └── Postulaciones/
      └── Registro Rápido.md
   99 Templates/
   ├── Plantilla Curriculum.md
   └── Plantilla Postulación Laboral.md
   Scripts
   └── sync-from-vault.sh
   ```
   
5. Copia las carpetas 09 Gestión Laboral/ y 99 Templates/ completas, tal cual vienen en el repo, directamente a la raíz de tu vault.
6. Completa Criterios de Evaluación.md y Curriculum.md con tu información real (ya están en su ubicación final — solo edítalos ahí mismo).
7. Inicia la interacción con Hermes o Antigravity-CLI

Sobre Scripts/sync-from-vault.sh: se incluye como parte del repositorio para que cualquier persona que clone este proyecto lo tenga disponible de inmediato — útil si en el futuro quieres mantener tu propia copia de trabajo (vault) separada de un repositorio público, igual que hice yo. No es un requisito para usar Baskerville; solo está ahí por si te sirve para el mismo propósito.
   
## Configura tu perfil antes de usarlo

El Agente Analista necesita contexto real tuyo para evaluar bien — sin esto, no debería (y no debe) emitir evaluaciones. Completa 09 Gestión Laboral/Perfil/Criterios de Evaluación.md con:
- Filtro rápido de descarte — descalificadores objetivos y explícitos (modalidad, salario mínimo, seniority, industria/tecnología rechazada, tipo de contrato) que usa el 🔎 Agente Filtro para el triage inicial
- Roles, Industrias y Tipo de Empresa Objetivo — hacia dónde quieres moverte, usado por el 🧠 Agente Analista para evaluar alineación con tu trayectoria
- Habilidades Fuertes y Propuesta de Valor — lo que ya puedes demostrar, usado para evaluar transferibilidad y para generar preguntas de entrevista relevantes
- Pesos de FIT, penalizaciones y bonificaciones — qué pondera más o menos en tu evaluación

Además necesitas:
- Tu CV o resumen de experiencia (Plantilla Curriculum.md incluida como base)
- Opcional: notas de estrategia de carrera, formato STAR, perfil de LinkedIn

Nada de esto se incluye en este repositorio — es información personal que cada usuario debe crear por su cuenta. El .gitignore incluido está preparado para evitar que la subas accidentalmente si trabajas dentro de una copia local de este repo.

## Uso

1. Inicia una conversación con tu orquestador (Hermes u otro).
2. El sistema pregunta si la oferta es nueva o existente.
3. Para una oferta nueva: pega el texto de la oferta y el enlace cuando se te pida. El 🔎 Agente Filtro la revisa primero — si no pasa, confirmas si la descartas o quieres análisis completo igual.
4. Si pasa el filtro (o insistes), el 🧠 Agente Analista genera un borrador de análisis.
5. Revisa y aprueba (o corrige) el análisis.
5. El Agente Documentador genera el archivo final en `09 Gestión Laboral/Postulaciones/`.
6. Para actualizaciones futuras (entrevistas, cambios de estado), vuelve a iniciar y elige "oferta existente".
 
## Personalización

Este sistema fue diseñado pensando en el mercado laboral de Chile/LATAM y en una transición de carrera hacia roles de Product Owner/Product Manager/Gestión de TI — pero está pensado para adaptarse:

- Cambia las referencias de mercado en `SOUL.md` (sección "Estimación de mercado") si tu contexto geográfico es distinto.
- Ajusta tus propios pesos de evaluación en `Criterios de Evaluación.md` — no edites `SOUL.md` para esto, ya que ahí viven solo la metodología y personalidad, no tus datos personales.
- Si quieres agregar un nuevo agente (ej. un "Agente Negociador" para la fase de oferta salarial), agrega una nueva sección en `SOUL.md` y una fila en la tabla de fases de `AGENTS.md` — no hace falta crear archivos nuevos.

## Licencia

Este proyecto se comparte bajo licencia MIT (ver `LICENSE`) — úsalo, modifícalo y compártelo libremente, con atribución apreciada pero no exigida.

## Historial de cambios

Ver CHANGELOG.md para el registro completo de versiones y cambios del proyecto.

## Aviso

Baskerville es un proyecto personal de aprendizaje, no un producto soportado. No hay garantía de que el análisis generado sea 100% preciso — es una herramienta de apoyo al pensamiento crítico, no un reemplazo del juicio propio.
