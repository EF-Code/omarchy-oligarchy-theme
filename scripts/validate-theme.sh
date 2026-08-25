#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
python_bin="${PYTHON_BIN:-/home/hiro/.venv/bin/python}"

required_files=(
  colors.toml
  icons.theme
  chromium.theme
  hyprland.lua
  btop.theme
  unlock.png
  preview-unlock.png
  preview.png
)

for required_file in "${required_files[@]}"; do
  if [[ ! -f "$repo_root/$required_file" ]]; then
    echo "Missing required theme file: $required_file" >&2
    exit 1
  fi
done

background_count=$(find "$repo_root/backgrounds" -maxdepth 1 -type f -iregex '.*\.\(jpg\|jpeg\|png\|gif\|bmp\|webp\)$' | wc -l)
if (( background_count < 4 )); then
  echo "Expected at least four Omarchy-compatible backgrounds; found $background_count" >&2
  exit 1
fi

check_dimensions() {
  local path="$1"
  local expected="$2"
  local actual

  if ! command -v identify >/dev/null 2>&1; then
    echo "ImageMagick identify is required for asset validation" >&2
    exit 1
  fi

  actual=$(identify -format '%wx%h' "$path")
  if [[ "$actual" != "$expected" ]]; then
    echo "Unexpected dimensions for ${path#$repo_root/}: $actual (expected $expected)" >&2
    exit 1
  fi
}

check_dimensions "$repo_root/unlock.png" "800x188"
check_dimensions "$repo_root/preview-unlock.png" "1920x1080"
check_dimensions "$repo_root/preview.png" "1800x1012"

while IFS= read -r background; do
  check_dimensions "$background" "1920x1080"
done < <(find "$repo_root/backgrounds" -maxdepth 1 -type f -name '*.png' | sort)

"$python_bin" - "$repo_root/colors.toml" <<'PY'
from __future__ import annotations

import re
import sys
import tomllib
from pathlib import Path

colors_path = Path(sys.argv[1])
with colors_path.open("rb") as handle:
    colors = tomllib.load(handle)

required = {
    "mode",
    "accent",
    "selection",
    "muted",
    "background",
    "dark_background",
    "darker_background",
    "lighter_background",
    "foreground",
    "dark_foreground",
    "light_foreground",
    "bright_foreground",
    "red",
    "yellow",
    "orange",
    "green",
    "cyan",
    "blue",
    "magenta",
    "brown",
    "bright_red",
    "bright_yellow",
    "bright_green",
    "bright_cyan",
    "bright_blue",
    "bright_magenta",
}
missing = sorted(required - colors.keys())
if missing:
    raise SystemExit(f"Missing palette keys: {', '.join(missing)}")

hex_color = re.compile(r"^#[0-9a-fA-F]{6}$")
for name in required - {"mode"}:
    value = colors[name]
    if not isinstance(value, str) or not hex_color.fullmatch(value):
        raise SystemExit(f"{name} must be a six-digit hex color, got {value!r}")

if colors["mode"] != "dark":
    raise SystemExit("Oligarchy must remain a dark theme")


def channel(value: int) -> float:
    value /= 255
    return value / 12.92 if value <= 0.04045 else ((value + 0.055) / 1.055) ** 2.4


def luminance(value: str) -> float:
    red, green, blue = (int(value[index : index + 2], 16) for index in (1, 3, 5))
    return 0.2126 * channel(red) + 0.7152 * channel(green) + 0.0722 * channel(blue)


def contrast(first: str, second: str) -> float:
    light = max(luminance(first), luminance(second))
    dark = min(luminance(first), luminance(second))
    return (light + 0.05) / (dark + 0.05)


background = colors["background"]
for foreground in ("foreground", "bright_foreground", "accent"):
    ratio = contrast(colors[foreground], background)
    if ratio < 4.5:
        raise SystemExit(f"{foreground} has insufficient contrast against background: {ratio:.2f}:1")

print(f"Validated {colors_path.name}: {len(colors)} keys, dark mode, readable primary colors")
PY

echo "Validated Omarchy theme contract and $(find "$repo_root/backgrounds" -maxdepth 1 -type f -name '*.png' | wc -l) backgrounds"
