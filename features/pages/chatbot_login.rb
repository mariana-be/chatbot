class LoginPage

    def faz_login(string, string2, string3, string4)
        include Capybara::DSL

        @company_name = Faker::Company.name #utilização do Faker para preenchimento randômico https://github.com/faker-ruby/faker/blob/master/doc/default/company.md
        find("#vinter-loginForm-nome").set @company_name
        find("#vinter-loginForm-cpfCnpj").set "09053395000165"
        find("#vinter-loginForm-email").set "teste@teste.com"
        find("#vinter-loginForm-telefone").set "(11) 98745-6589"
        find("#vinter-btnSend").click
    end
end