#!/usr/bin/env bash

set -Eeuo pipefail

readonly SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
readonly REPOSITORY_DIR="$(cd -- "${SCRIPT_DIR}/.." && pwd)"
readonly COMPOSE_FILE="${REPOSITORY_DIR}/docker-compose.preview.yml"
readonly LOCK_FILE="${REPOSITORY_DIR}/Gemfile.lock"

lock_file_existed=false
lock_file_backup=""
if [[ -e "${LOCK_FILE}" ]]; then
  lock_file_existed=true
  lock_file_backup="$(mktemp)"
  cp --preserve=mode,timestamps -- "${LOCK_FILE}" "${lock_file_backup}"
fi

export PREVIEW_UID="$(id -u)"
export PREVIEW_GID="$(id -g)"
export PREVIEW_PORT="${PREVIEW_PORT:-8080}"
export COMPOSE_PROJECT_NAME="labicon-site-preview"

cleanup() {
  local exit_status=$?
  trap - EXIT INT TERM

  if ! docker compose --file "${COMPOSE_FILE}" down --remove-orphans; then
    :
  fi

  if [[ "${lock_file_existed}" == true ]]; then
    cp --preserve=mode,timestamps -- "${lock_file_backup}" "${LOCK_FILE}"
    rm -f -- "${lock_file_backup}"
  else
    rm -f -- "${LOCK_FILE}"
  fi
  return "${exit_status}"
}

trap cleanup EXIT
trap 'exit 130' INT
trap 'exit 143' TERM

echo "Starting private site preview at http://localhost:${PREVIEW_PORT}/"
echo "Press Ctrl+C to stop."

docker compose --file "${COMPOSE_FILE}" up --build --remove-orphans
