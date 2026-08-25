#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
source_root="$repo_root/art/source"

if ! command -v rsvg-convert >/dev/null 2>&1; then
  echo "rsvg-convert is required to render the SVG theme assets" >&2
  exit 1
fi

render() {
  local source="$1"
  local destination="$2"
  local width="$3"
  local height="$4"

  mkdir -p "$(dirname -- "$destination")"
  rsvg-convert -w "$width" -h "$height" "$source" -o "$destination"
}

# The wallpapers are final 1920x1080 raster art. Keep them out of this render
# pass so rebuilding the vector lock-screen and preview assets cannot replace
# the photographic background set.
render "$source_root/unlock.svg" "$repo_root/unlock.png" 800 188
render "$source_root/preview-unlock.svg" "$repo_root/preview-unlock.png" 1920 1080
render "$source_root/preview.svg" "$repo_root/preview.png" 1800 1012

echo "Rendered theme assets into $repo_root"
