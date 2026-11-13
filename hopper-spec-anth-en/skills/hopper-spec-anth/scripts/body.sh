#!/bin/sh
# Assembles and checks the general body of the execution spec, without a temporary file.
#
# Usage:
#   sh body.sh insert "<project name>" <execution spec>
#     Replaces the {{BODY}} line of the file with the body from execution-body.md,
#     with {{PROJECT}} filled in with the name. No other character changes.
#   sh body.sh check "<project name>" <execution spec>
#     Compares the body of the file, from the first line of the reference body
#     to the line before the "# Annex" heading, with the reference body.
#     Exits with 0 and "body identical" when they match; otherwise shows the differences.

set -eu

folder=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
reference="$folder/execution-body.md"
slot='{{PROJECT}}'

usage() {
  echo "usage: sh body.sh insert|check \"<project name>\" <execution spec>" >&2
  exit 2
}

[ $# -eq 3 ] || usage
action=$1
name=$2
file=$3
[ -n "$name" ] || { echo "error: the project name is empty" >&2; exit 2; }
[ -f "$reference" ] || { echo "error: missing $reference" >&2; exit 2; }
[ -f "$file" ] || { echo "error: missing $file" >&2; exit 2; }

if [ "$(grep -c -F "$slot" "$reference")" -ne 1 ]; then
  echo "error: the reference body must have 1 slot $slot" >&2
  exit 2
fi

# Literal replacement of the slot with the name, without regular expressions.
fill='
  function fill(line,   out, i) {
    out = ""
    while ((i = index(line, SLOT)) > 0) {
      out = out substr(line, 1, i - 1) ENVIRON["PROJECT_NAME"]
      line = substr(line, i + length(SLOT))
    }
    return out line
  }
'

case $action in
  insert)
    marks=$(grep -c -x -F '{{BODY}}' "$file" || true)
    if [ "$marks" -ne 1 ]; then
      echo "error: $file must have 1 {{BODY}} line, and has $marks" >&2
      exit 1
    fi
    # Reads everything before writing, and writes into the file itself, at the end.
    PROJECT_NAME=$name TARGET=$file awk -v SLOT="$slot" "$fill"'
      FNR == NR { body[++nb] = fill($0); next }
      { lines[++nl] = $0 }
      END {
        target = ENVIRON["TARGET"]
        for (i = 1; i <= nl; i++) {
          if (lines[i] == "{{BODY}}") {
            for (j = 1; j <= nb; j++) print body[j] > target
          } else {
            print lines[i] > target
          }
        }
        close(target)
      }
    ' "$reference" "$file"
    echo "body inserted in $file"
    ;;
  check)
    PROJECT_NAME=$name awk -v SLOT="$slot" "$fill"'
      FNR == NR { ref[++nr] = fill($0); next }
      inside == 0 && $0 == ref[1] { inside = 1 }
      inside == 1 && /^# Annex/ { inside = 2 }
      inside == 1 {
        if ($0 == "") { empty++; next }
        while (empty > 0) { got[++ng] = ""; empty-- }
        got[++ng] = $0
      }
      END {
        if (ng == 0) { print "error: the body was not found in the file" > "/dev/stderr"; exit 1 }
        n = (nr > ng) ? nr : ng
        diff = 0
        for (i = 1; i <= n; i++) {
          r = (i <= nr) ? ref[i] : "(end of body)"
          g = (i <= ng) ? got[i] : "(end of body)"
          if (i > nr || i > ng || r != g) {
            diff++
            if (diff <= 5) printf "body line %d\n  reference: %s\n  file:      %s\n", i, r, g
          }
        }
        if (diff == 0) { print "body identical"; exit 0 }
        printf "body different: %d lines differ\n", diff
        exit 1
      }
    ' "$reference" "$file"
    ;;
  *)
    usage
    ;;
esac
