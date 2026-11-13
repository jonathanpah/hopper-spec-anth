#!/bin/sh
# Monta e confere o corpo geral da spec de execução, sem arquivo temporário.
#
# Uso:
#   sh corpo.sh inserir "<nome do projeto>" <spec de execução>
#     Troca a linha {{CORPO}} do arquivo pelo corpo de corpo-da-execucao.md,
#     com {{PROJETO}} preenchido pelo nome. Nenhum outro caractere muda.
#   sh corpo.sh conferir "<nome do projeto>" <spec de execução>
#     Compara o corpo do arquivo, da linha "## 0. O que é este documento"
#     até a linha antes do título "# Anexo", com o corpo de referência.
#     Sai com 0 e "corpo igual" quando são iguais; senão mostra as diferenças.

set -eu

pasta=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
referencia="$pasta/corpo-da-execucao.md"
lacuna='{{PROJETO}}'

uso() {
  echo "uso: sh corpo.sh inserir|conferir \"<nome do projeto>\" <spec de execução>" >&2
  exit 2
}

[ $# -eq 3 ] || uso
acao=$1
nome=$2
arquivo=$3
[ -n "$nome" ] || { echo "erro: o nome do projeto está vazio" >&2; exit 2; }
[ -f "$referencia" ] || { echo "erro: falta $referencia" >&2; exit 2; }
[ -f "$arquivo" ] || { echo "erro: falta $arquivo" >&2; exit 2; }

if [ "$(grep -c -F "$lacuna" "$referencia")" -ne 1 ]; then
  echo "erro: o corpo de referência deve ter 1 lacuna $lacuna" >&2
  exit 2
fi

# Troca literal da lacuna pelo nome, sem expressão regular.
preencher='
  function preencher(linha,   saida, i) {
    saida = ""
    while ((i = index(linha, LACUNA)) > 0) {
      saida = saida substr(linha, 1, i - 1) ENVIRON["PROJETO_NOME"]
      linha = substr(linha, i + length(LACUNA))
    }
    return saida linha
  }
'

case $acao in
  inserir)
    marcas=$(grep -c -x -F '{{CORPO}}' "$arquivo" || true)
    if [ "$marcas" -ne 1 ]; then
      echo "erro: $arquivo deve ter 1 linha {{CORPO}}, e tem $marcas" >&2
      exit 1
    fi
    # Lê tudo antes de gravar e grava no próprio arquivo, no fim.
    PROJETO_NOME=$nome DESTINO=$arquivo awk -v LACUNA="$lacuna" "$preencher"'
      FNR == NR { corpo[++nc] = preencher($0); next }
      { linhas[++nl] = $0 }
      END {
        destino = ENVIRON["DESTINO"]
        for (i = 1; i <= nl; i++) {
          if (linhas[i] == "{{CORPO}}") {
            for (j = 1; j <= nc; j++) print corpo[j] > destino
          } else {
            print linhas[i] > destino
          }
        }
        close(destino)
      }
    ' "$referencia" "$arquivo"
    echo "corpo inserido em $arquivo"
    ;;
  conferir)
    PROJETO_NOME=$nome awk -v LACUNA="$lacuna" "$preencher"'
      FNR == NR { ref[++nr] = preencher($0); next }
      dentro == 0 && /^## 0\. O que é este documento$/ { dentro = 1 }
      dentro == 1 && /^# Anexo/ { dentro = 2 }
      dentro == 1 {
        if ($0 == "") { vazias++; next }
        while (vazias > 0) { arq[++na] = ""; vazias-- }
        arq[++na] = $0
      }
      END {
        if (na == 0) { print "erro: o corpo não foi achado no arquivo" > "/dev/stderr"; exit 1 }
        n = (nr > na) ? nr : na
        dif = 0
        for (i = 1; i <= n; i++) {
          r = (i <= nr) ? ref[i] : "(fim do corpo)"
          a = (i <= na) ? arq[i] : "(fim do corpo)"
          if (i > nr || i > na || r != a) {
            dif++
            if (dif <= 5) printf "linha %d do corpo\n  referência: %s\n  arquivo:    %s\n", i, r, a
          }
        }
        if (dif == 0) { print "corpo igual"; exit 0 }
        printf "corpo diferente: %d linhas diferem\n", dif
        exit 1
      }
    ' "$referencia" "$arquivo"
    ;;
  *)
    uso
    ;;
esac
