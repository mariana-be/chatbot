After do |scenario|
    xote = page.save_screenshot("data/reports/log/screenshots/#{scenario.__id__}.png")
    embed(xote, "image/png", "Evidência")
  end

After do |scenario|
  nome_cenario = scenario.name.gsub(/[^A-Za-z0-9 ]/, '')
  nome_cenario = nome_cenario.gsub(' ', '_').downcase!
  screenshot = "data/reports/log/screenshots/#{nome_cenario}.png"
  page.save_screenshot(screenshot)
  #embed(screenshot, 'image/png', 'Evidência')
end

  #After('@validacaoinicial') do
    #click_link "Olá, #{@company_name}! Sou a Assistente Virtual da Stelo."
    #click_link "Clique aqui para responder nossa pesquisa e fechar o Chat"
  #end