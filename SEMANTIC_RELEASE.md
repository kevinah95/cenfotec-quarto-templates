# Semantic Release Setup Guide

This document explains the semantic release configuration for this project.

## Overview

This project uses **semantic-release** to automatically version the `assigment` template based on commit messages. Versions are only bumped when changes are made to files in the `assigment/` folder AND use the correct commit scope.

## Quick Start

### 1. Configure GitHub Repository

Ensure your repository has:
- Permissions for GitHub Actions to create releases
- `main` as the default branch (or update `.releaserc.yml` accordingly)

### 2. Commit Convention

All commits that should trigger a release must follow this format:

```
<type>(assigment): <description>
```

Examples:
- `feat(assigment): add new rubric format` → Minor version bump (1.0.0 → 1.1.0)
- `fix(assigment): correct footer spacing` → Patch version bump (1.0.0 → 1.0.1)
- `feat(assigment)!: change YAML structure` → Major version bump (1.0.0 → 2.0.0)

See [CONTRIBUTING.md](CONTRIBUTING.md) for complete details.

## How It Works

### Workflow Trigger

The semantic release workflow (`.github/workflows/semantic-release.yml`) runs when:
1. Code is pushed to the `main` branch
2. Files in `assigment/` folder are changed
3. Or semantic release configuration files are modified

### Version Detection

The `.releaserc.yml` configuration:
- Analyzes commits with `scope: assigment`
- Determines version bump based on commit type
- Ignores commits with other scopes or no scope

### Files Updated

When a release is triggered:
1. `assigment/_extensions/assigment/_extension.yml` - Version field updated
2. `CHANGELOG.md` - Release notes added
3. Git tag created (e.g., `v1.1.0`)
4. GitHub release published

### Version Sync Script

The `scripts/sync-assigment-version.mjs` script:
- Reads the new version from semantic-release
- Updates the version in `_extension.yml`

You can test it locally:
```bash
node scripts/sync-assigment-version.mjs 1.2.3
```

## Configuration Files

| File | Purpose |
|------|---------|
| `.releaserc.yml` | Semantic release configuration |
| `.github/workflows/semantic-release.yml` | GitHub Actions workflow |
| `scripts/sync-assigment-version.mjs` | Version synchronization script |
| `CONTRIBUTING.md` | Commit message guidelines |
| `CHANGELOG.md` | Auto-generated release notes |

## Adding More Templates

To add semantic release for another template (e.g., `exam`):

1. Update `.releaserc.yml` to include the new scope:
   ```yaml
   - type: feat
     scope: exam
     release: minor
   ```

2. Create a new sync script or modify the existing one

3. Update the GitHub workflow paths:
   ```yaml
   paths:
     - 'assigment/**'
     - 'exam/**'
   ```

4. Update `CONTRIBUTING.md` with the new scope

## Testing Locally

You can test the sync script locally:

```bash
node scripts/sync-assigment-version.mjs 1.2.3
git diff  # Check what changed
git checkout -- .  # Restore files
```

## Troubleshooting

### Release Not Triggering

Check:
- Commits use `assigment` scope: `feat(assigment): ...`
- Changes are in `assigment/` folder
- Pushing to `main` branch (not other branches)
- GitHub Actions is enabled in repository settings

### Version Not Updating

Check:
- `scripts/sync-assigment-version.mjs` exists and is readable
- File paths in the script are correct
- The `_extension.yml` file has format `version: X.X.X`

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
