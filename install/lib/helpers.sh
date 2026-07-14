if [[ -n "${DOTFILES_HELPERS_LOADED:-}" ]]; then
  return 0 2>/dev/null || exit 0
fi

DOTFILES_HELPERS_LOADED=1

log() {
  printf '\033[1;32m[dotfiles]\033[0m %s\n' "$*"
}

warn() {
  printf '\033[1;33m[warning]\033[0m %s\n' "$*"
}

die() {
  printf '\033[1;31m[error]\033[0m %s\n' "$*" >&2
  exit 1
}

is_installed() {
  local command_name="${1:-}"

  [[ -n "$command_name" ]] && command -v "$command_name" >/dev/null 2>&1
}

source_if_readable() {
  local file="${1:-}"

  [[ -n "$file" && -r "$file" ]] && source "$file"
}

detect_os() {
  case "$(uname -s)" in
    Darwin) echo "macos" ;;
    Linux)
      if grep -qi microsoft /proc/version 2>/dev/null; then
        echo "wsl"
      else
        echo "linux"
      fi
      ;;
    *) echo "unknown" ;;
  esac
}

run_if_exists() {
  local script="${1:-}"

  if [[ -z "$script" ]]; then
    warn "No script given to run_if_exists"
    return 1
  fi

  if [[ -x "$script" ]]; then
    log "Running $script"
    "$script"
  elif [[ -f "$script" ]]; then
    log "Running $script"
    bash "$script"
  else
    warn "Skipping missing script: $script"
  fi
}
