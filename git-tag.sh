#!/usr/bin/env bash
set -euo pipefail

PREFIX=$1  # mn, ms など
DATE_TAG=v$(date +%y%m%d)
FULL_TAG="${PREFIX}-${DATE_TAG}"

git tag "$FULL_TAG"
echo "Tagged: $FULL_TAG"
