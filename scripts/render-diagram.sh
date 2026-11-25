#!/usr/bin/env bash
# Render docs/system.d2 -> docs/system.svg (+ docs/system.png) and keep both fresh.
#   SVG: light + dark themes embedded, for GitHub README (media-query aware).
#   PNG: single image the gpm desktop app prefers (instant, no SVG rasterizing).
# Usage: scripts/render-diagram.sh [path/to/system.d2]
set -euo pipefail

cd "$(dirname "$0")/.."
src="${1:-docs/system.d2}"
out="${src%.d2}"

if ! command -v d2 >/dev/null 2>&1; then
  echo "d2 not found — install: https://d2lang.com (and the TALA plugin: 'd2 layout')" >&2
  exit 1
fi

# TALA gives the clean orthogonal routing this diagram relies on; fall back to
# ELK when the plugin isn't installed so CI/dev boxes without it don't break.
layout=tala
d2 layout 2>/dev/null | grep -q '^ *tala ' || layout=elk

# SVG keeps both themes: --theme=0 light, --dark-theme=200 for dark viewers.
d2 --layout="$layout" --theme=0 --dark-theme=200 "$src" "$out.svg"
echo "rendered $out.svg (layout: $layout, light+dark)"

# PNG is a single raster, so it uses the dark palette the desktop app renders
# against; 0.5 scale is ~2500px wide, sharp on hidpi without a 5k canvas.
d2 --layout="$layout" --theme=200 --scale 0.5 "$src" "$out.png"
echo "rendered $out.png (layout: $layout, dark, scale 0.5)"
