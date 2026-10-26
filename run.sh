#!/usr/bin/env bash
# spare-isle-tool — Microsoft engineer who works on Office shared cross plat components. Areas of interest: ReactNative, Node.JS, JS engine API, C++ libraries, multi-threading.
# 给自己省点事的小工具
set -euo pipefail

collect() { grep -v '^[[:space:]]*$' | sed 's/^[[:space:]]*//; s/[[:space:]]*$//'; }
report() { sort | uniq -c | sort -rn; echo "---"; }
main() {
  local tmp; tmp="$(mktemp)"; trap 'rm -f "$tmp"' EXIT
  cat > "$tmp"
  if [[ ! -s "$tmp" ]]; then echo "no input" >&2; exit 1; fi
  collect < "$tmp" | report
}
main
