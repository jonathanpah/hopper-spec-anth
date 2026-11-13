#!/bin/sh
# Grava spec-software/graders/corpo-igual.md a partir do corpo da skill.
# Rode de novo sempre que corpo-da-execucao.md mudar.
set -eu
pasta=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
corpo="$pasta/../skills/hopper-spec-anth/corpo-da-execucao.md"
saida="$pasta/spec-software/graders/corpo-igual.md"
padrao=$(sed -e 's/[]\\^$.|?*+()[{}]/\\&/g' -e 's/\\{\\{PROJETO\\}\\}/[^\\n]+/' "$corpo" \
  | awk 'BEGIN { ORS = "" } { if (NR > 1) print "\\n"; print }' \
  | sed "s/'/''/g")
{
  printf '%s\n' '---' 'type: regex' 'target:' '  source: file' '  path: docs/spec-de-execucao.md'
  printf "pattern: '\\\\n%s\\\\n\\\\n# Anexo'\n" "$padrao"
  printf '%s\n' '---'
} > "$saida"
echo "gravado $saida"
