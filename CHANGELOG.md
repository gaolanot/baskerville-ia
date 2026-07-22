# Changelog

Todos los cambios notables de este proyecto se documentan en este archivo.

El formato sigue [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/),
y este proyecto intenta adherirse a [Versionado Semántico](https://semver.org/lang/es/).

## [1.2.0] - 2026-07-22
### Agregado
- Integración de logros profesionales en formato STAR (STAR.md) como parte del contexto que el 🧠 Agente Analista lee desde Perfil/
- SOUL.md: la dimensión "Transferibilidad de habilidades" ahora debe sustentarse con logros reales de STAR.md cuando exista uno relevante
- SOUL.md: las preguntas de entrevista ahora deben anclarse a un logro STAR concreto cuando exista, en vez de preguntas genéricas
- Plantilla Plantilla STAR.md en blanco para que otros usuarios completen sus propios logros
### Cambiado
- README.md: árbol de instalación actualizado con STAR.md dentro de Perfil/
- README.md: STAR.md pasó de mención "opcional" ambigua a archivo explícito con su propósito documentado en "Configura tu perfil antes de usarlo"

## [1.1.1] - 2026-07-20
- Se agrega al SOUL instrucciones para extraer keyworkds útiles en la postulación
### Cambiado
- Se modifica la plantilla de Curriculum para que sea más adecuada para ATS y se 
  agregan ejemplos que hagan más claro como llenar los datos.
- Se modifica el archivo Curriculum Vitae.md en Perfil/ para que sea coherente con 
  la plantilla

## [1.1.0] - 2026-07-17

### Agregado
- Nuevo agente de triage (🔎 Agente Filtro) que descarta ofertas por criterios
  explícitos antes de activar el análisis completo, reduciendo costo en uso
  de alto volumen
- Protocolo de filtro rápido en `AGENTS.md` y plantilla `Registro Rápido.md`
  para registrar ofertas descartadas sin generar documento completo
- Nuevas secciones en `Criterios de Evaluación.md`: Roles Objetivo,
  Industrias Objetivo, Tipo de Empresa Objetivo, Habilidades Fuertes,
  Propuesta de Valor
- Regla de reinicio de ciclo en `AGENTS.md` para sesiones con múltiples
  postulaciones, evitando contaminación cruzada entre análisis
- Logo del proyecto (`logo-baskerville.svg`)
- Este archivo `CHANGELOG.md`

### Cambiado
- Renombrado el sistema a **Baskerville** en `AGENTS.md`, `SOUL.md` y `README.md`
- `SOUL.md`: la dimensión "Alineación con trayectoria" ahora compara contra
  Roles/Industrias/Tipo de Empresa Objetivo declarados por el usuario
- `SOUL.md`: la dimensión "Transferibilidad de habilidades" ahora se ancla
  a las Habilidades Fuertes declaradas, no a "experiencia" genérica
- `SOUL.md`: las preguntas de entrevista ahora deben incluir al menos una
  que valide la Propuesta de Valor del usuario
- `README.md`: estructura de instalación actualizada para reflejar que el
  repositorio replica la organización del vault (sin pasos de copiado
  sueltos entre carpetas)

### Corregido
- Referencias desactualizadas en `README.md` a la carpeta "Estrategia Laboral"
  (consolidada dentro de `Perfil/`)
- Nombres de archivo inconsistentes entre `SOUL.md` y el vault real
  (tildes, mayúsculas)
- Rutas relativas sin extensión `.md` en referencias a la plantilla de postulación

## [1.0.0] - 2026-07-16

### Agregado
- Primera versión pública: `AGENTS.md` (orquestador de flujo) y `SOUL.md`
  (personalidad y metodología) para el sistema original de análisis de
  ofertas laborales
- Tres agentes iniciales: 🧠 Analista, 📝 Documentador, 🗂️ Bitácora
- Plantilla `Plantilla Postulación Laboral.md`
- Plantilla `Criterios de Evaluación.md`
- `README.md`, `LICENSE` (MIT), `.gitignore`
