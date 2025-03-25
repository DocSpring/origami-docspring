# Release Process for origami-docspring

This document outlines the process for releasing new versions of the origami-docspring gem.

## Version Numbers

We use [Semantic Versioning](https://semver.org/):

- **MAJOR** version for incompatible API changes
- **MINOR** version for backward-compatible functionality additions
- **PATCH** version for backward-compatible bug fixes

## Release Steps

### 1. Update Version Number

Choose the appropriate version bump based on the changes made:

```bash
# For patch-level changes (bug fixes):
rake version:patch

# For minor changes (new features, backward-compatible):
rake version:minor

# For major changes (breaking changes):
rake version:major
```

### 2. Update CHANGELOG.md

- Add a new section for the new version
- List all notable changes, grouped by type:
  - Added (new features)
  - Changed (changes in existing functionality)
  - Deprecated (features that will be removed in upcoming releases)
  - Removed (removed features)
  - Fixed (bug fixes)
  - Security (security fixes)

### 3. Commit Changes

```bash
git add lib/origami/version.rb CHANGELOG.md
git commit -m "Bump version to X.Y.Z"
```

### 4. Run the Release Process

This command will:
- Run tests
- Check for uncommitted changes
- Create a git tag
- Build the gem
- Push the tag to GitHub
- Push the gem to RubyGems.org

```bash
rake release_gem
```

### 5. Verify the Release

- Check that the new version is available on [RubyGems.org](https://rubygems.org/gems/origami-docspring)
- Verify the git tag has been pushed to GitHub

## Bundler's Built-in Tasks

The project also includes Bundler's built-in gem tasks:

- `rake build` - Build the gem into the pkg directory
- `rake install` - Build and install the gem locally
- `rake release` - Create tag and push gem to RubyGems (alternative to our custom task)

## Troubleshooting

If you encounter issues during the release process:

- Ensure you have proper permissions on RubyGems.org
- Verify your Git credentials are set up correctly
- Check that all tests pass before attempting a release