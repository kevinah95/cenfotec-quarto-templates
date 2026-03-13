# Contributing to CENFOTEC Quarto Templates

Thank you for your interest in contributing! This project uses semantic versioning with automated releases for each template independently.

## Monorepo Structure

Each template in this repository is versioned independently:
- `assigment/` - Assignment template
- Future templates (e.g., `exam/`, `report/`, etc.)

Each template has its own:
- Version in `<template>/_extensions/<template>/_extension.yml`
- Changelog in `<template>/CHANGELOG.md`
- Git tags like `<template>-v1.0.0`
- GitHub releases

## Commit Message Convention

This project uses [Conventional Commits](https://www.conventionalcommits.org/) with a **required scope** to identify which template is being modified.

### Format

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### Scopes

Each template has its own scope. **You must use the correct scope** for semantic release to work:

- `assigment` - For changes to the assigment template
- Add more scopes as new templates are added (e.g., `exam`, `report`)

**Important:** Only commits with the template's scope will trigger a release for that template.

### Types

- `feat` - A new feature (triggers MINOR version bump)
- `fix` - A bug fix (triggers PATCH version bump)
- `perf` - Performance improvement (triggers PATCH version bump)
- `docs` - Documentation only changes (no version bump)
- `refactor` - Code refactoring (no version bump)
- `style` - Formatting changes (no version bump)
- `test` - Adding tests (no version bump)
- `chore` - Maintenance tasks (no version bump)

### Breaking Changes

To trigger a MAJOR version bump, add `BREAKING CHANGE:` in the commit footer:

```
feat(assigment)!: redesign template structure

BREAKING CHANGE: The YAML structure has changed. Users need to update their documents.
```

Or use the `!` suffix after the scope:
```
feat(assigment)!: redesign template structure
```

### Examples

#### New Feature (Minor Version Bump)
```
feat(assigment): add support for group activities

Added new YAML options for group-based assignments.
```

#### Bug Fix (Patch Version Bump)
```
fix(assigment): correct header alignment issue

Fixed the header that was misaligned on odd pages.
```

#### Breaking Change (Major Version Bump)
```
feat(assigment)!: restructure YAML configuration

BREAKING CHANGE: The course-info section is now nested under metadata.
Users must update their YAML frontmatter.
```

#### Documentation (No Version Bump)
```
docs(assigment): update README with examples
```

## How Semantic Release Works

1. **Push to `main` branch**: Only pushes to main will trigger a release
2. **Commits analyzed**: Semantic release reads commit messages since the last release
3. **Version determined**: Based on commit types:
   - `feat` → MINOR version bump (1.0.0 → 1.1.0)
   - `fix` / `perf` → PATCH version bump (1.0.0 → 1.0.1)
   - `BREAKING CHANGE` → MAJOR version bump (1.0.0 → 2.0.0)
4. **Files updated**:
   - `CHANGELOG.md` - Generated with release notes
   - `assigment/_extensions/assigment/_extension.yml` - Version updated
   - `package.json` - Version updated
5. **Release created**: Git tag and GitHub release are created
6. **Commit pushed**: Changes are committed back to the repository

## Important Notes

### Scope is Required!

❌ **Wrong** - Will NOT trigger a release:
```
feat: add new feature
fix: correct bug
```

✅ **Correct** - Will trigger a release:
```
feat(assigment): add new feature
fix(assigment): correct bug
```

### Only Assigment Changes Trigger Releases

Changes to files outside the `assigment/` folder with `assigment` scope will still trigger releases. Be precise with your commits.

## Development Workflow

1. Create a feature branch:
   ```bash
   git checkout -b feature/my-feature
   ```

2. Make your changes to the assigment template

3. Commit with proper convention:
   ```bash
   git commit -m "feat(assigment): add new feature"
   ```

4. Push and create a Pull Request:
   ```bash
   git push origin feature/my-feature
   ```

5. Once merged to `main`, semantic release will automatically:
   - Determine the version bump
   - Update version files
   - Generate changelog
   - Create a GitHub release
   - Push the changes back

## Local Testing

Test the version sync script locally for any template:
```bash
node scripts/sync-template-version.mjs assigment 1.2.3
git diff  # Check what changed
git checkout -- .  # Restore files
```

## Adding a New Template

To add semantic release for a new template (e.g., `exam`):

1. **Create the template structure**:
   ```bash
   mkdir -p exam/_extensions/exam
   ```

2. **Copy the template release config**:
   ```bash
   cp .releaserc.template.yml exam/.releaserc.yml
   ```

3. **Replace all `TEMPLATE_NAME` with `exam`** in `exam/.releaserc.yml`:
   ```bash
   sed -i '' 's/TEMPLATE_NAME/exam/g' exam/.releaserc.yml
   ```

4. **Create the template's CHANGELOG**:
   ```bash
   echo "# Changelog - Exam Template" > exam/CHANGELOG.md
   ```

5. **Update `CONTRIBUTING.md`** to add `exam` to the list of scopes

6. **Commit with the new scope**:
   ```bash
   git add .
   git commit -m "feat(exam): initial template"
   ```

The workflow will automatically detect the new template and handle releases!

## Questions?

If you're unsure about how to format your commit message, check:
- [Conventional Commits](https://www.conventionalcommits.org/)
- Recent commits in the repository
- The [CHANGELOG.md](CHANGELOG.md) for examples
