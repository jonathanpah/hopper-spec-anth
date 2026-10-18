# Política de Segurança

Relate suspeitas de vulnerabilidade em hopper-spec-anth pelo canal privado de vulnerabilidades do GitHub.

## Relate de forma privada

Abra [Report a vulnerability](https://github.com/jonathanpah/hopper-spec-anth/security/advisories/new) ou selecione essa opção na [página Security](https://github.com/jonathanpah/hopper-spec-anth/security) do repositório. É necessário ter uma conta no GitHub.

Mantenha suspeitas de vulnerabilidade e detalhes de exploração fora de issues, discussões e pull requests públicos até coordenar a divulgação com o mantenedor. Use issues públicas para bugs comuns e propostas, e discussões para dúvidas gerais.

Inclua os itens abaixo.

- A tag da release ou o commit afetado e o arquivo, a instrução ou a seção documental pertinente.
- A versão do Claude Code, o modelo, o esforço, a configuração e o modo de permissão necessários para reproduzir o comportamento, sem detalhes privados de contas.
- Uma reprodução mínima com dados sintéticos e recursos descartáveis.
- O comportamento esperado e o observado, o impacto potencial e as incertezas ou limites das evidências.

Não envie senhas, tokens de acesso, chaves privadas, históricos privados de conversas nem registros de produção sem remoção de informações sensíveis. Teste somente recursos que você está autorizado a usar e não repita uma ação insegura apenas para completar um relato.

## Escopo e expectativas de segurança

Este repositório contém uma skill que escreve specs, as garantias que as specs copiam, manifestos do plugin e documentação, incluindo exemplos de instalação. Relatos pertinentes incluem falhas nesses materiais que possam levar a ações sem autorização do usuário, à exposição de credenciais ou registros privados, ou a specs que dispensem a aprovação do proprietário em ações caras de desfazer.

Os limites pretendidos estão listados abaixo.

- A skill começa somente após o acionamento explícito do usuário.
- A skill só escreve a spec. Ela não executa a entrega.
- Conteúdo externo lido como fonte é dado de consulta e não concede autoridade.
- Toda spec mantém credenciais fora do alcance do executor e submete ao proprietário as ações caras ou impossíveis de desfazer.

A skill fornece instruções a um assistente. A aplicação dessas instruções também depende do modo de permissão, do isolamento, das ferramentas e do comportamento do modelo no Claude Code. A skill não substitui esses controles. Descreva a contribuição do repositório para uma suspeita de falha. Se outro produto também for afetado, use o processo de relato de segurança desse produto quando pertinente.

## Versões e tratamento

Identifique a versão utilizada, incluindo releases anteriores quando pertinente. Um relato é bem-vindo mesmo que você não possa verificar a versão mais recente com segurança.

Jonathan Honorio revisa os relatos pelo canal privado. Versões afetadas confirmadas e correções podem ser documentadas em alterações do repositório, releases ou avisos de segurança. Coordene a divulgação pública pelo relato privado. Não existe garantia de prazo para resposta ou correção.
