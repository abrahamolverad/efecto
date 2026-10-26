#!/usr/bin/env bash
# Preparación única de la skill efecto. Se puede correr otra vez: imprime READY cuando todo está listo.
set -e
cd "$(dirname "$0")/.."

if ! command -v ffmpeg >/dev/null 2>&1 || ! command -v ffprobe >/dev/null 2>&1; then
  echo "NEED_FFMPEG: primero instala ffmpeg (Mac: brew install ffmpeg, Windows: winget install ffmpeg)"; exit 1
fi
if [ -x .venv/bin/python ] && .venv/bin/python -c "import mediapipe, cv2, PIL, numpy" 2>/dev/null; then echo READY; exit 0; fi

PY=""
for v in python3.12 python3.11 python3.13 python3.10 python3; do
  if command -v "$v" >/dev/null 2>&1 && "$v" -c 'import sys; sys.exit(0 if sys.version_info[:2] >= (3, 10) else 1)' 2>/dev/null; then PY="$v"; break; fi
done

if [ -n "$PY" ]; then
  "$PY" -m venv .venv
  .venv/bin/python -m pip install -q --upgrade pip
  .venv/bin/python -m pip install -q -r requirements.txt
elif command -v uv >/dev/null 2>&1; then
  uv venv -q -p 3.12 .venv
  uv pip install -q -p .venv/bin/python -r requirements.txt
else
  echo "NEED_PYTHON: instala Python 3.10 o más nuevo (python.org/downloads) y vuelve a correr esto"; exit 1
fi

.venv/bin/python -c "import mediapipe, cv2, PIL, numpy; print('READY')"
