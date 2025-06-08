# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Netrunner Replay Sanitizer - a web-based tool for anonymizing player names in Netrunner replay files for privacy purposes.

### Purpose
The tool allows users to:
- Upload Netrunner replay JSON files
- Replace runner and corp player names with custom values
- Remove email hashes to prevent Gravatar lookups
- Download sanitized replay files

### Technical Stack
- **Frontend**: Vue 3 (via CDN)
- **File Format**: JSON replay files from Netrunner games
- **Deployment**: Static HTML file that can be served from any web server or opened locally

### Key Features
- Drag-and-drop file upload
- Automatic player name extraction from replay files
- Deep object traversal for comprehensive name replacement
- Email hash removal for privacy
- Clean, cyberpunk-themed UI

## Code Standards

### Comments
Add comments that clarify non-obvious code or mark section boundaries. Include doc comments for types/functions when idiomatic.

### Documentation
Propose new docs when important context would be lost. Consider language-specific docs when idiomatic.

### Git Commits
Follow these rules for commit messages:
1. Subject: 50 chars max, capitalized, imperative mood, no period
2. Blank line between subject and body
3. Body: wrap at 72 chars, explain why not how
4. Test: "If applied, this commit will [subject]"
5. Include `Co-Authored-By: Claude <noreply@anthropic.com>` if appropriate
6. No emojis or "Generated with" attribution text

Focus on context and motivation. Make atomic commits for single logical changes.

### White space

- ALWAYS avoid trailing white space. Remove it if detected.

## Changelog Management

### Updating changelog.json
When making user-visible changes to the application:

1. **Add a new release entry** at the beginning of the `releases` array in `changelog.json`
2. **Release entry format**:
   ```json
   {
     "tag": "vX",
     "date": "YYYY-MM-DD",
     "note": "Brief description of the change (keep under 60 chars)"
   }
   ```
3. **Guidelines**:
   - Increment the version number (v1, v2, v3, etc.)
   - Use today's date in ISO format (YYYY-MM-DD)
   - Write clear, user-focused descriptions (e.g., "Add feature X" not "Refactor code")
   - Only the 3 most recent entries are displayed in the UI
   - Keep notes concise - they're shown in a small changelog section

### When to Update
Update the changelog for:
- New features
- Bug fixes that affect user experience
- UI/UX improvements
- Changes to file processing behavior

Don't update for:
- Internal refactoring with no user impact
- Documentation changes
- Development tooling updates

## Agent Tools

If desired CLI tools aren't available, suggest a way to `brew install` them.
