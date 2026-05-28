# Contributing to CENFOTEC Quarto Templates

Thank you for your interest in contributing! This project uses [Release Please](https://github.com/googleapis/release-please) for automated versioning based on [Conventional Commits](https://www.conventionalcommits.org/).

## Monorepo Structure

Each template is versioned independently:
- `assigment/` - Assignment template
- Future templates (e.g., `exam/`, `report/`, etc.)

Each template has its own:
- Version in `<template>/_extensions/<template>/_extension.yml`
- Changelog in `<template>/CHANGELOG.md`
- Git tags like `<template>-v1.0.0`
- GitHub release

## Development Workflow

1. Create a feature branch:
   ```bash
   git checkout -b feature/my-feature
   ```

2. Make your changes inside the template folder (e.g., `assigment/`)

3. Commit using [Conventional Commits](https://www.conventionalcommits.org/):
   ```bash
   git commit -m "feat(assigment): add support for group activities"
   ```

4. Open a Pull Request to `main`

5. Once merged, Release Please automatically opens a release PR with:
   - Version bump based on commit types
   - Updated `CHANGELOG.md`
   - Updated `_extension.yml` version

6. Merge the release PR → tag and GitHub release are created

## Commit Types

| Type | Description | Version bump |
|------|-------------|--------------|
| `feat` | New feature | Minor (1.0.0 → 1.1.0) |
| `fix` | Bug fix | Patch (1.0.0 → 1.0.1) |
| `feat!` or `BREAKING CHANGE` | Breaking change | Major (1.0.0 → 2.0.0) |
| `docs`, `chore`, `refactor` | No release | None |

> **Note:** Release Please determines which template to version based on **which files you changed**, not the commit scope. The scope is optional but recommended for a cleaner CHANGELOG.

## Adding a New Template

1. Create the template structure under a new folder (e.g., `exam/`)
2. Add the package to `release-please-config.json`:
   ```json
   "exam": {
     "component": "exam",
     "release-type": "simple",
     "changelog-path": "CHANGELOG.md",
     "extra-files": [
       {
         "type": "yaml",
         "path": "_extensions/exam/_extension.yml",
         "jsonpath": "$.version"
       }
     ]
   }
   ```
3. Add the initial version to `.release-please-manifest.json`:
   ```json
   "exam": "1.0.0"
   ```
4. Commit and push — Release Please will handle the rest

## Questions?

Check [Conventional Commits](https://www.conventionalcommits.org/) or look at recent commits in the repository for examples.

