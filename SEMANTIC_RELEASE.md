# Semantic Release Setup Guide

This document explains the semantic release configuration for this monorepo with multiple Quarto templates.

## Overview

This project uses **semantic-release** to automatically version each template independently based on commit messages. Each template (like `assigment`, `exam`, etc.) has its own:

- Version number in `<template>/_extensions/<template>/_extension.yml`
- Changelog in `<template>/CHANGELOG.md`
- Git tags with format `<template>-v1.0.0`
- GitHub releases

Versions are only bumped when:
1. Changes are made to files in the template's folder
2. Commits use the correct scope (e.g., `feat(assigment):`)

## Quick Start

### 1. Configure GitHub Repository

Ensure your repository has:
- Permissions for GitHub Actions to create releases
- `main` as the default branch

### 2. Commit Convention

All commits that should trigger a release must follow this format with the template name as scope:

```
<type>(<template-name>): <description>
```

Examples:
- `feat(assigment): add new rubric format` → Minor version bump for assigment
- `fix(exam): correct footer spacing` → Patch version bump for exam
- `feat(report)!: change YAML structure` → Major version bump for report

See [CONTRIBUTING.md](CONTRIBUTING.md) for complete details.

## How It Works

### Workflow Trigger

The semantic release workflow (`.github/workflows/semantic-release.yml`) runs when:
1. Code is pushed to `main` or `alpha` branch
2. The workflow detects which templates have changed
3. Runs semantic-release for each changed template that has a release config

### Change Detection

The workflow automatically:
1. Finds all available templates (folders with `_extensions` subfolder)
2. Detects which files changed since the last commit
3. Determines which templates were modified
4. Runs semantic-release independently for each changed template

### Version Detection

Each template has its own `.releaserc.<template>.yml` configuration that:
- Analyzes commits with `scope: <template>`
- Determines version bump based on commit type
- Ignores commits with other scopes
- Uses git tags with format `<template>-v1.0.0`

### Files Updated

When a release is triggered for a template:
1. `<template>/_extensions/<template>/_extension.yml` - Version field updated
2. `<template>/CHANGELOG.md` - Release notes added
3. Git tag created (e.g., `assigment-v1.1.0`)
4. GitHub release published with template name

### Version Sync Script

The `scripts/sync-template-version.mjs` script:
- Takes template name and version as arguments
- Updates the version in the template's `_extension.yml`
- Works for any template in the repository

You can test it locally:
```bash
node scripts/sync-template-version.mjs assigment 1.2.3
node scripts/sync-template-version.mjs exam 2.0.0
```

## Configuration Files

| File | Purpose |
|------|---------|
| `.releaserc.<template>.yml` | Release config for each template |
| `.releaserc.template.yml` | Template file for creating new configs |
| `.github/workflows/semantic-release.yml` | GitHub Actions workflow with change detection |
| `scripts/sync-template-version.mjs` | Generic version synchronization script |
| `CONTRIBUTING.md` | Commit message guidelines |
| `<template>/CHANGELOG.md` | Auto-generated release notes per template |

## Adding More Templates

To add semantic release for another template (e.g., `exam`):

1. **Copy the template file**:
   ```bash
   cp .releaserc.template.yml .releaserc.exam.yml
   ```

2. **Replace all `TEMPLATE_NAME` with `exam`** in the file

3. **Create the template's changelog**:
   ```bash
   mkdir -p exam
   echo "# Changelog - Exam Template" > exam/CHANGELOG.md
   ```

4. **Update `CONTRIBUTING.md`** to list `exam` as a valid scope

5. **Create the template structure** with `_extensions/exam/` folder

6. **Make commits with the new scope**:
   ```bash
   git commit -m "feat(exam): initial template"
   ```

The workflow will automatically detect and release the new template!

## Testing Locally

You can test the sync script locally for any template:

```bash
# Test assigment template
node scripts/sync-template-version.mjs assigment 1.2.3
git diff assigment/_extensions/assigment/_extension.yml

# Test another template
node scripts/sync-template-version.mjs exam 2.0.0
git diff exam/_extensions/exam/_extension.yml

# Restore changes
git checkout -- .
```

## Troubleshooting

### Release Not Triggering

Check:
- Commits use correct template scope: `feat(assigment): ...`, `fix(exam): ...`
- Changes are in the template's folder (e.g., `assigment/`)
- Pushing to `main` branch (not other branches)
- GitHub Actions is enabled in repository settings
- Release config exists: `.releaserc.<template>.yml`

### Version Not Updating

Check:
- `scripts/sync-template-version.mjs` exists and is readable
- Template structure: `<template>/_extensions/<template>/_extension.yml`
- The `_extension.yml` file has format `version: X.X.X`
- Correct arguments passed to script in `.releaserc.<template>.yml`

### Permission Errors

Ensure GitHub Actions has permissions:
```yaml
permissions:
  contents: write
  issues: write
  pull-requests: write
```

## Resources

- [Semantic Release Documentation](https://semantic-release.gitbook.io/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Keep a Changelog](https://keepachangelog.com/)
