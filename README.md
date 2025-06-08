# Netrunner Replay Sanitizer

A web-based tool for anonymizing player names in Netrunner replay files for privacy purposes.

## Overview

The Netrunner Replay Sanitizer allows you to upload replay JSON files from Netrunner games and replace player names with custom values. This is useful for sharing replays publicly while maintaining player privacy.

## Features

- 🎯 Drag-and-drop file upload interface
- 🔄 Automatic player name extraction from replay files
- 🔍 Deep object traversal for comprehensive name replacement
- 🔒 Email hash removal to prevent Gravatar lookups
- 💾 Download sanitized replay files
- 🎨 Clean, cyberpunk-themed UI

## Usage

1. Open `index.html` in your web browser or serve it from a web server
2. Drag and drop your `replay.json` file onto the upload area
3. Enter replacement names for the runner and corp players
4. Click "Download Sanitized" to get your anonymized replay file

## Local Development with Docker Compose

To run the application locally for development:

```bash
# Start the web server with live reloading
docker-compose up

# The application will be available at http://localhost:8080
# Any changes to index.html, changelog.json, or favicon files will be reflected immediately
```

To stop the server:

```bash
docker-compose down
```

## Building Docker Images

To build a production Docker image, use the provided build script:

```bash
./build-docker.sh
```

This script enforces two requirements:
1. The current commit must be tagged (e.g., `git tag v5`)
2. The tag must have a corresponding entry in `changelog.json`

If these requirements aren't met, the build will fail with instructions on what needs to be done.

The script will create two Docker tags:
- `dagolden/replay-sanitizer:VERSION` (where VERSION is your git tag)
- `dagolden/replay-sanitizer:latest`

To push the image to Docker Hub after building:

```bash
docker push dagolden/replay-sanitizer:VERSION
docker push dagolden/replay-sanitizer:latest
```

## Technical Details

- **Frontend**: Vue 3 (loaded via CDN)
- **File Format**: JSON replay files from Netrunner games
- **Deployment**: Static HTML file - no backend required

## How It Works

The sanitizer performs the following operations on replay files:

1. Validates the JSON structure to ensure it's a valid replay file
2. Extracts original player names from the first history entry
3. Recursively traverses the entire JSON structure
4. Replaces all occurrences of player names with the specified replacements
5. Removes `emailhash` fields to prevent Gravatar lookups
6. Outputs a sanitized JSON file ready for sharing

## Example

An example replay file is provided in the `example/` directory for testing purposes.

## License

This project is licensed under the Apache License, Version 2.0 - see the [LICENSE](LICENSE) file for details.