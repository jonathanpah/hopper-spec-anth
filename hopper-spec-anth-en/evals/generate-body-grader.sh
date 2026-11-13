#!/bin/sh
# Writes software-spec/graders/body-identical.md from the skill's body.
# Run it again whenever execution-body.md changes.
set -eu
folder=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
body="$folder/../skills/hopper-spec-anth/execution-body.md"
out="$folder/software-spec/graders/body-identical.md"
pattern=$(sed -e 's/[]\\^$.|?*+()[{}]/\\&/g' -e 's/\\{\\{PROJECT\\}\\}/[^\\n]+/' "$body" \
  | awk 'BEGIN { ORS = "" } { if (NR > 1) print "\\n"; print }' \
  | sed "s/'/''/g")
{
  printf '%s\n' '---' 'type: regex' 'target:' '  source: file' '  path: docs/execution-spec.md'
  printf "pattern: '\\\\n%s\\\\n\\\\n# Annex'\n" "$pattern"
  printf '%s\n' '---'
} > "$out"
echo "wrote $out"
