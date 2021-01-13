# language: pt
Funcionalidade: Chatbot
  Como um usuario na pagina de Chatbot
  e visualiza a tela de atendimento virtual inteligente
  Para tirar duvidas ou obter informacao sobre o servico prestado

Contexto: Página Principal
  Dado que estou na tela de autenticacao do chatbot da Stelo 

  @validacaoinicial
  Cenario: Deve entrar no sistema do Chatbot para obter o atendimento
    Quando preencher as informacoes de "NOME/ESTABELECIMENTO", "CPF/CNPJ", "E-MAIL", "TELEFONE" 
    E clicar para entrar no Chatbot
    Entao devo acessar a conversa com o assistente virtual
    E encerrar a sessão

  @fluxoNomeEstabelecimento
  Cenario: Tentativa de Login de NOME/ESTABELECIMENTO invalido
    Quando preencher as informacoes de "CPF/CNPJ", "E-MAIL", "TELEFONE" com dados validos
    E não preencher as informações de "NOME/ESTABELECIMENTO" 
    E clicar para entrar no chatbot
    Entao deve ser notificado na tela de autenticacao "Os campos identificados com asteriscos (*) são de preenchimento obrigatório."
  
@fluxoTentativaLoginCpfCnpj
  Esquema do Cenario: Tentativa de Login de CPF/CNPJ invalido
    Quando preencher as informacoes de "NOME/ESTABELECIMENTO", "E-MAIL", "TELEFONE" com dados validos
    E preencher as informações de "<cpfCnpj>" com dados invalidos
    E clicar para entrar no chat
    Entao deve ser mostrado a mensagem "CPF/CNPJ invalido"

    Exemplos:
      |       cpfCnpj        |
      |   545.645.456-54     |
      |       326.222        |
      |     545.645.456-d    |
      |  22.222.222/2222-22  |
      |          ""          |

 @fluxoTentativaLoginEmail
  Esquema do Cenario: Tentativa de Login E-MAIL invalido
    Quando preencher as informacoes de "NOME/ESTABELECIMENTO", "CPF/CNPJ", "TELEFONE" com dados validos
    E preencher as informações de "<email>" com dados nao validos
    E clicar para entrar no chat
    Entao deve mostrar a mensagem "Email invalido"

    Exemplos:
      |   email   |
      |   teste   |
      |   @teste  |
      |     ""    |

  @fluxoTentativaLoginTelefone 
  Esquema do Cenario: Tentativa de Login TELEFONE invalido
    Quando preencher as informacoes de "NOME/ESTABELECIMENTO", "CPF/CNPJ", "EMAIL" com dados validos
    E preencher as informações de "<telefone>" com informacao nao valido
    E clicar para entrar no chat
    Entao devo ver a mensagem "Telefone invalido"

    Exemplos:
      |     telefone      |
      |   (11) 99753      |
      |  (11) 99753-55    |

   @fluxoDuvidaSolicitacao
  Cenario: Solicitacoes ou duvidas com a Assistente Virtual
    Quando preencher as informacoes de "NOME/ESTABELECIMENTO", "CPF/CNPJ", "E-MAIL", "TELEFONE" 
    E clicar para entrar no Chatbot
    E informar a duvida ou solicitacao no campo "pergunta"
    Entao clique para encerrar o chat informando a nota com a "sugestao, elogio e critica" do atendimento

  @fluxoAtendimentoHumano
  Cenario: Solicitacoes ou duvidas com o Atendimento Humano
    Quando preencher as informacoes de "NOME/ESTABELECIMENTO", "CPF/CNPJ", "E-MAIL", "TELEFONE" 
    E clicar para entrar no Chatbot
    E digitar "Atendimento Humano" para que possa ter o atendimento em tempo real
    Então sera direcionado para o atendimento personalizado se estiver dentro do dia e horario estabelecido
