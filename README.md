# 🧭 Asistente de Búsqueda Laboral (AGENTS.md + SOUL.md)

Un sistema de agentes de IA, pensado para correr sobre [Hermes Agent](https://github.com/) y un vault de [Obsidian](https://obsidian.md/), que analiza ofertas laborales con una visión crítica de mentor de carrera y genera documentación estructurada de cada postulación.

Este proyecto nace de mi propio proceso de búsqueda laboral y de mi aprendizaje experimentando con agentes de IA, prompts estructurados y flujos multi-agente. Lo comparto como aporte a la comunidad y como evidencia de ese aprendizaje — siéntete libre de usarlo, adaptarlo y mejorarlo.

## ¿Qué hace?

- Recibe el texto de una oferta laboral y la url. 
- La analiza en profundidad: tipo de empresa real, rol real (no el título), requisitos explícitos vs. implícitos, riesgos ocultos, evaluación numérica de fit (1–7), estimación salarial de mercado
- Genera un documento Markdown estructurado en tu vault, listo para consultar durante todo el proceso de postulación
- Permite agregar notas de seguimiento (entrevistas, cambios de estado) a postulaciones existentes

## Arquitectura: tres agentes, un solo sistema

| Agente | Rol |
|---|---|
| 🧠 **Analista** | Razona críticamente sobre la oferta, cuestiona supuestos, evalúa fit |
| 📝 **Documentador** | Vuelca el análisis aprobado en la plantilla, sin reinterpretar |
| 🗂️ **Bitácora** | Gestiona notas de actualización sobre postulaciones existentes |

`AGENTS.md` controla el flujo (cuándo se activa cada agente). `SOUL.md` define quién es cada agente y cómo razona.

## Requisitos

- [Hermes Agent](https://github.com/) (u otro orquestador compatible con archivos `AGENTS.md`/`SOUL.md`)
- Un vault de Obsidian (opcional, pero recomendado — el sistema asume Markdown compatible con Obsidian)
- Acceso a un modelo de lenguaje vía OpenRouter, API directa, o modelo local

## Instalación

1. Clona este repositorio o descarga los archivos.
2. Copia `AGENTS.md` y `SOUL.md` a la raíz de tu vault (o donde tu orquestador los espere).
3. Edita la línea `VAULT_ROOT` en `AGENTS.md` con la ruta real de tu vault:
   ```
   VAULT_ROOT: /ruta/a/tu/vault
   ```
4. Crea la siguiente estructura de carpetas dentro de tu vault:
   ```
   09 Gestión Laboral/
   ├── Perfil/
   └── Postulaciones/
   99 Templates/
   └── Plantilla Postulación Laboral.md
   ```
5. Copia `plantillas/Plantilla Postulación Laboral.md` a `99 Templates/` dentro de tu vault.
6. Copia `plantillas/Criterios de Evaluación.md` a `09 Gestión Laboral/Perfil/` y complétalo con tu propio contexto profesional (ver siguiente sección).
7. Agrega también a `09 Gestión Laboral/Perfil/` tu CV o resumen de trayectoria, y cualquier otra nota de estrategia de carrera que quieras que el sistema considere.

## Configura tu perfil antes de usarlo

El Agente Analista necesita contexto real tuyo para evaluar bien — sin esto, no debería (y no debe) emitir evaluaciones. Como mínimo necesitas en `09 Gestión Laboral/Perfil/`:

- **Criterios de Evaluación.md** — tus pesos de fit, penalizaciones y bonificaciones (plantilla incluida)
- Tu **CV** o resumen de experiencia
- Opcional: notas de estrategia de carrera, formato STAR, perfil de LinkedIn

Nada de esto se incluye en este repositorio — es información personal que cada usuario debe crear por su cuenta. El `.gitignore` incluido está preparado para evitar que la subas accidentalmente si trabajas dentro de una copia local de este repo.

## Uso

1. Inicia una conversación con tu orquestador (Hermes u otro).
2. El sistema pregunta si la oferta es nueva o existente.
3. Para una oferta nueva: pega el texto de la oferta y el enlace cuando se te pida. El Agente Analista generará un borrador de análisis.
4. Revisa y aprueba (o corrige) el análisis.
5. El Agente Documentador genera el archivo final en `09 Gestión Laboral/Postulaciones/`.
6. Para actualizaciones futuras (entrevistas, cambios de estado), vuelve a iniciar y elige "oferta existente".

## Personalización

Este sistema fue diseñado pensando en el mercado laboral de Chile/LATAM y en una transición de carrera hacia roles de Product Owner/Product Manager/Gestión de TI — pero está pensado para adaptarse:

- Cambia las referencias de mercado en `SOUL.md` (sección "Estimación de mercado") si tu contexto geográfico es distinto.
- Ajusta tus propios pesos de evaluación en `Criterios de Evaluación.md` — no edites `SOUL.md` para esto, ya que ahí viven solo la metodología y personalidad, no tus datos personales.
- Si quieres agregar un nuevo agente (ej. un "Agente Negociador" para la fase de oferta salarial), agrega una nueva sección en `SOUL.md` y una fila en la tabla de fases de `AGENTS.md` — no hace falta crear archivos nuevos.

## Licencia

Este proyecto se comparte bajo licencia MIT (ver `LICENSE`) — úsalo, modifícalo y compártelo libremente, con atribución apreciada pero no exigida.

## Aviso

Este es un proyecto personal de aprendizaje, no un producto soportado. No hay garantía de que el análisis generado sea 100% preciso — es una herramienta de apoyo al pensamiento crítico, no un reemplazo del juicio propio.
