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

## Local Testing with Docker Compose

To test the application locally using Docker:

```bash
# Start the web server
docker-compose up

# The application will be available at http://localhost:8080
```

To stop the server:

```bash
docker-compose down
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

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.