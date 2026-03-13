# Plantillas Quarto - Universidad CENFOTEC

Colección de plantillas Quarto para la creación de documentos académicos de la Universidad CENFOTEC con formato profesional.

## 📚 Plantillas Disponibles

### 📝 Consignas de Actividades ([assigment](assigment/))

Plantilla para crear consignas de actividades académicas en formato PDF.

**Instalación:**
```bash
quarto use template kevinah95/cenfotec-quarto-templates/assigment
```

**Características:**
- Header, footer y logo institucionales embebidos
- Formato profesional de Universidad CENFOTEC
- Tablas prediseñadas para objetivos y rúbricas
- Configuración completa desde YAML

**[Ver documentación completa →](assigment/README.md)**

---

## 🚀 Inicio Rápido

1. **Instala Quarto** (si aún no lo tienes):
   https://quarto.org/docs/get-started/

2. **Elige una plantilla** de las disponibles arriba

3. **Instálala** usando el comando correspondiente

4. **Personaliza** el archivo `.qmd` generado con tu contenido

5. **Renderiza** el documento:
   ```bash
   quarto render tu-archivo.qmd
   ```

## 📖 Documentación

Cada plantilla tiene su propia documentación con ejemplos detallados. Consulta el README de cada subcarpeta.

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Este proyecto usa **versionado semántico automático** mediante conventional commits.

**Importante:** Al contribuir, usa el formato de commit correcto:
```bash
feat(assigment): descripción del cambio
```

📚 **Lee la guía completa:**
- [CONTRIBUTING.md](CONTRIBUTING.md) - Convenciones de commits
- [SEMANTIC_RELEASE.md](SEMANTIC_RELEASE.md) - Cómo funciona el versionado automático

## 🔖 Versionado

Cada plantilla se versiona independientemente usando [Semantic Release](https://semantic-release.gitbook.io/):
- **MAJOR** (X.0.0) - Cambios incompatibles (breaking changes)
- **MINOR** (0.X.0) - Nuevas funcionalidades compatibles
- **PATCH** (0.0.X) - Correcciones de bugs

Las versiones se actualizan automáticamente al hacer push a `main` con commits que siguen [Conventional Commits](https://www.conventionalcommits.org/).

## 📄 Licencia

Este proyecto es mantenido para uso de la comunidad de Universidad CENFOTEC.
