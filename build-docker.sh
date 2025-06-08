#!/bin/bash
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "Checking build prerequisites..."

# Check if current commit has a tag
CURRENT_TAG=$(git describe --exact-match --tags 2>/dev/null || true)

if [ -z "$CURRENT_TAG" ]; then
    echo -e "${RED}Error: No tag found on current commit${NC}"
    echo "Please tag your release first with: git tag vX"
    exit 1
fi

echo -e "${GREEN}✓ Found tag: $CURRENT_TAG${NC}"

# Check if tag exists in changelog.json
if ! grep -q "\"tag\": \"$CURRENT_TAG\"" changelog.json 2>/dev/null; then
    echo -e "${RED}Error: Tag $CURRENT_TAG not found in changelog.json${NC}"
    echo "Please update changelog.json with release notes for $CURRENT_TAG"
    exit 1
fi

echo -e "${GREEN}✓ Tag $CURRENT_TAG found in changelog${NC}"

# Check if working directory is clean
if [ -n "$(git status --porcelain)" ]; then
    echo -e "${YELLOW}Warning: You have uncommitted changes${NC}"
    read -p "Continue anyway? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Build the Docker image
echo -e "${GREEN}Building Docker image for $CURRENT_TAG...${NC}"
docker build -t dagolden/replay-sanitizer:$CURRENT_TAG -t dagolden/replay-sanitizer:latest .

echo -e "${GREEN}✓ Docker image built successfully${NC}"
echo "Tagged as:"
echo "  - dagolden/replay-sanitizer:$CURRENT_TAG"
echo "  - dagolden/replay-sanitizer:latest"
