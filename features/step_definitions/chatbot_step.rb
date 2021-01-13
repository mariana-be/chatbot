Dado('que estou na tela de autenticacao do chatbot da Stelo') do
  visit("https://avi.stelo.com.br/pt_BR/avi.html?id=102&source=1&target=1&channel=1&launchType=popup&ms=1587582677897##forward")
  end
  
  #validacaoinicial
  Quando('preencher as informacoes de {string}, {string}, {string}, {string}') do |string, string2, string3, string4|
  
  @company_name = Faker::Company.name #utilização do Faker para preenchimento randômico https://github.com/faker-ruby/faker/blob/master/doc/default/company.md
  #login = LoginPage.new
  #login.faz_login(string, string2, string3, string4) 
  find("#vinter-loginForm-nome").set @company_name
  find("#vinter-loginForm-cpfCnpj").set "09053395000165"
  find("#vinter-loginForm-email").set "teste@teste.com"
  find("#vinter-loginForm-telefone").set "(11) 98745-6589"
  end
  
  E('clicar para entrar no Chatbot') do
  find("#vinter-btnSend").click
  sleep 25
  end
  
  Entao('devo acessar a conversa com o assistente virtual') do
  expect(page).to have_text "Olá, #{@company_name}! Sou a Assistente Virtual da Stelo." #vai inspecionar a página e procurar por essa mensagem
  end

  E('encerrar a sessão') do
  find("#vinter-btn-PopUp-CloseChat").click
  find("#vinter-dialog-exit > div > a:nth-child(1)").click
  find("#vinter-assistente-chat-again-btn").click
  sleep 10
  end

  #fluxoNomeEstabelecimento
  Quando('preencher as informacoes de {string}, {string}, {string} com dados validos') do |string, string2, string3|

    @company_cnpj = Faker::Company.brazilian_company_number(formatted: true)
    find("#vinter-loginForm-cpfCnpj").set @company_cnpj
    find("#vinter-loginForm-email").set "teste@teste.com"
    find("#vinter-loginForm-telefone").set "(11) 98745-6589"
  end
  
  Quando('não preencher as informações de {string}') do |string|
    find("#vinter-loginForm-nome").click
  end
  
  Quando('clicar para entrar no chatbot') do
    find("#vinter-btnSend").click
  end
  
  Entao('deve ser notificado na tela de autenticacao {string}') do |string|
    expect(page).to have_text "Os campos identificados com asteriscos (*) são de preenchimento obrigatório."
    sleep 10
  end

  #fluxoTentativaLoginCpfCnpj
  Quando('preencher as informações de {string} com dados invalidos') do |cpfCnpj|
    find("#vinter-loginForm-cpfCnpj").set cpfCnpj
  end
  
  Quando('clicar para entrar no chat') do
    find("#vinter-btnSend").click
  end
  
  Entao('deve ser mostrado a mensagem {string}') do |string|
    expect(page).to have_text "CPF/CNPJ inválido"
    sleep 10
  end

#fluxoTentativaLoginEmail
Quando('preencher as informações de {string} com dados nao validos') do |email|
  find("#vinter-loginForm-email").set email
end

Entao('deve mostrar a mensagem {string}') do |string|
  expect(page).to have_text "Email inválido"
  sleep 10
end

#fluxoTentativaLoginTelefone
Quando('preencher as informações de {string} com informacao nao valido') do |telefone|
  find("#vinter-loginForm-telefone").set telefone
end

Entao('devo ver a mensagem {string}') do |string|
  expect(page).to have_text "Telefone inválido"
  sleep 10
end

#fluxoDuvidaSolicitacao
Quando('informar a duvida ou solicitacao no campo {string}') do |string|
  find("#vinter-pergunta").set "Saldo"
  find("#vinter-btnSendMessage").click
  sleep 10
end

Entao('clique para encerrar o chat informando a nota com a {string} do atendimento') do |string|
  find("#vinter-btn-PopUp-CloseChat").click
  find("#vinter-dialog-exit > div > a:nth-child(1)").click
  find("#vinter-customersatisfaction-step1-option-05-li").click
  find("#vinter-aval-out1-text").set "Dúvida Respondida"
  sleep 5
  find("#vinter-btnSendCloseSurvey1").click
  sleep 5
  find("#vinter-assistente-chat-again-btn").click
  sleep 5
end

#fluxoAtendimentoHumano
Quando('digitar {string} para que possa ter o atendimento em tempo real') do |string|
  find("#vinter-pergunta").set "Atendimento Humano"
  sleep 5
  find("#vinter-btnSendMessage").click
  sleep 5
  find("#vinter-pergunta").set "Atendente Humano"
  sleep 5
  find("#vinter-btnSendMessage").click
  sleep 5
end

Então('sera direcionado para o atendimento personalizado se estiver dentro do dia e horario estabelecido') do
  expect(page).to have_text "clique aqui"
  #find("#utterance-1610490206421 > p > a").click
  click_link 'clique aqui'
  sleep 10
end


