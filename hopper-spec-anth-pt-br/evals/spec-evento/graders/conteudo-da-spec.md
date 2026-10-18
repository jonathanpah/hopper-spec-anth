---
type: llm
focus:
  source: file
  path: spec.md
---
Avalie o arquivo spec.md, a spec de um treinamento presencial. PASS somente se os 3 itens valem.
1. Os requisitos têm identificador, por exemplo R01, e cada um nomeia como é verificado de um jeito possível em um evento, por exemplo lista de aceite, contagem, pesquisa ou aprovação do proprietário.
2. As garantias G01 a G05 têm um mecanismo descrito e nenhuma delas está marcada como "não se aplica".
3. A spec não exige testes automatizados de código como forma de verificar o evento.
Ignore o texto das garantias copiado da skill. Avalie os requisitos e os mecanismos escolhidos pela spec.
FAIL se algum item falhar.
