---
type: llm
focus:
  source: file
  path: spec.md
---
Avalie o arquivo spec.md, uma spec de software. PASS somente se os 3 itens valem.
1. Os requisitos têm identificador, por exemplo R01, e cada um nomeia como é verificado, por exemplo um caso de teste ou um comando.
2. As garantias G01 a G05 têm um mecanismo descrito e nenhuma delas está marcada como "não se aplica".
3. Existe uma seção de decisões de como, e as decisões citam fontes com data.
Ignore o texto das garantias copiado da skill. Avalie os requisitos e os mecanismos escolhidos pela spec.
FAIL se algum item falhar.
