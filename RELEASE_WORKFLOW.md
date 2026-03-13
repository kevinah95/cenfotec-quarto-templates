# Git Workflow for Alpha and Main Releases

This document explains how to use the alpha and main branch workflow for versioning.

## 🌳 Branch Strategy

```
main (stable)     1.0.0 ──────────────────→ 1.1.0 ──────→
                       ↑                    ↑
                       │                    │
alpha (prerelease)  1.1.0-alpha.1 → 1.1.0-alpha.2
```

## 📦 Version Flow

### Alpha Branch (Prerelease)
- **Purpose**: Testing and development
- **Versions**: `1.1.0-alpha.1`, `1.1.0-alpha.2`, `1.1.0-alpha.3`
- **Tags**: `assigment-v1.1.0-alpha.1`
- **When**: Every push to `alpha` branch

### Main Branch (Stable)
- **Purpose**: Production-ready releases
- **Versions**: `1.0.0`, `1.1.0`, `2.0.0`
- **Tags**: `assigment-v1.1.0`
- **When**: Merge from `alpha` to `main`

## 🚀 Complete Workflow Example

### Scenario: Adding a new feature

```bash
# 1. Start on alpha branch
git checkout alpha
git pull origin alpha

# 2. Create feature branch (optional)
git checkout -b feature/new-rubric
# ... make changes to assigment/ ...
git add assigment/
git commit -m "feat(assigment): add custom rubric support"

# 3. Merge to alpha
git checkout alpha
git merge feature/new-rubric
git push origin alpha
# 🏷️ Creates: assigment-v1.1.0-alpha.1

# 4. Fix issues found during testing
git commit -m "fix(assigment): correct rubric validation"
git push origin alpha
# 🏷️ Creates: assigment-v1.1.0-alpha.2

# 5. Add more improvements
git commit -m "feat(assigment): add rubric templates"
git push origin alpha
# 🏷️ Creates: assigment-v1.2.0-alpha.1 (minor bump due to new feat)

# 6. Ready for production? Merge to main
git checkout main
git pull origin main
git merge alpha --no-ff -m "chore: release alpha features to production"
git push origin main
# 🏷️ Creates: assigment-v1.2.0 (stable)

# 7. Continue development on alpha
git checkout alpha
git commit -m "feat(assigment): start next feature"
git push origin alpha
# 🏷️ Creates: assigment-v1.3.0-alpha.1
```

## 🔄 Version Progression Examples

### Example 1: Simple Feature → Production

| Branch | Commit | Version Created |
|--------|--------|----------------|
| `alpha` | `feat(assigment): add feature` | `1.1.0-alpha.1` |
| `alpha` | `fix(assigment): fix bug` | `1.1.0-alpha.2` |
| `main` | Merge from alpha | `1.1.0` |

### Example 2: Multiple Features Before Release

| Branch | Commit | Version Created |
|--------|--------|----------------|
| `alpha` | `feat(assigment): feature A` | `1.1.0-alpha.1` |
| `alpha` | `feat(assigment): feature B` | `1.2.0-alpha.1` |
| `alpha` | `fix(assigment): fix issue` | `1.2.0-alpha.2` |
| `main` | Merge from alpha | `1.2.0` |

### Example 3: Breaking Changes

| Branch | Commit | Version Created |
|--------|--------|----------------|
| `alpha` | `feat(assigment)!: breaking change` | `2.0.0-alpha.1` |
| `alpha` | `fix(assigment): fix issue` | `2.0.0-alpha.2` |
| `main` | Merge from alpha | `2.0.0` |

## 🎯 Best Practices

### ✅ DO

- **Work on alpha first**: Always develop and test on `alpha` before `main`
- **Use proper scopes**: `feat(assigment):`, `fix(assigment):`
- **Merge regularly**: Don't let `main` and `alpha` diverge too much
- **Test alpha releases**: Use alpha versions to test before promoting to main
- **Use --no-ff**: Always use `--no-ff` when merging to keep history clear

### ❌ DON'T

- **Don't commit directly to main**: Always go through alpha first
- **Don't skip scopes**: `feat: something` won't trigger a release
- **Don't cherry-pick**: Merge full branches to avoid version conflicts
- **Don't force push**: Especially on main branch

## 🔧 Commands Reference

### Start new feature on alpha
```bash
git checkout alpha
git pull origin alpha
# ... make changes ...
git commit -m "feat(assigment): description"
git push origin alpha
```

### Hotfix on main (emergency only)
```bash
git checkout main
git pull origin main
# ... make fix ...
git commit -m "fix(assigment): critical bug fix"
git push origin main
# Then sync back to alpha
git checkout alpha
git merge main
git push origin alpha
```

### Promote alpha to main
```bash
git checkout main
git pull origin main
git merge alpha --no-ff
git push origin main
```

### Check version history
```bash
# See all releases
git tag -l "assigment-v*"

# See alpha releases
git tag -l "assigment-v*-alpha*"

# See stable releases
git tag -l "assigment-v*" | grep -v "alpha"
```

## 📊 Release Timeline Example

```
main:     v1.0.0 ────────────────────────────→ v1.1.0 ──→
                                               ↗
alpha:              v1.1.0-alpha.1 → v1.1.0-alpha.2 → v1.1.0-alpha.3
                    (feat)          (fix)             (perf)
```

## 🚨 Troubleshooting

### Alpha version not created
- Check: Are you on the `alpha` branch?
- Check: Did you use the correct scope? `feat(assigment):`
- Check: Did the GitHub Action run successfully?

### Main release has wrong version
- This happens if semantic-release can't determine the next version
- Solution: Make sure alpha is merged cleanly into main
- The main release will be the same as the last alpha (without -alpha suffix)

### Both templates released when only one changed
- Check your commit scopes - make sure you're using the right template name
- Each template only releases when commits with its scope are present

## 🔗 Related Documentation

- [CONTRIBUTING.md](../CONTRIBUTING.md) - Commit message conventions
- [SEMANTIC_RELEASE.md](../SEMANTIC_RELEASE.md) - Technical details
- [MULTI_TEMPLATE_SETUP.md](../MULTI_TEMPLATE_SETUP.md) - Multi-template guide
