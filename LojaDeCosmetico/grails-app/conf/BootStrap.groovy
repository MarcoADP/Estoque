import loja.*
import util.ObserverService

class BootStrap {

    def init = { servletContext ->
        def papelGerente = Papel.findOrSaveWhere(authority: 'ROLE_GERENTE')
        def verificaGerente = Usuario.findByUsername("gerente")
        if (verificaGerente == null){
            def gerente = Usuario.findOrSaveWhere(username: 'gerente', password: 'gerente', nome: 'Gerente', cpf: '671.473.226-06', cargo: 'Gerente')

            if (!gerente.authorities.contains(papelGerente)){
                UsuarioPapel.create(gerente, papelGerente, true)
            }
        }

        
        def papelFuncionario = Papel.findOrSaveWhere(authority: 'ROLE_FUNCIONARIO')
        def verificaFuncionario = Usuario.findByUsername("funcionario")
        if (verificaFuncionario == null){
            def funcionario = Usuario.findOrSaveWhere(username: 'funcionario', password: 'funcionario', nome: 'Funcionario', cpf: '347.183.070-74', cargo: 'Funcionario')

            if (!funcionario.authorities.contains(papelFuncionario)){
                UsuarioPapel.create(funcionario, papelFuncionario, true)
            }
        }

        ObserverService.cadastrar(pagamento: Pagamento, produto: Produto)

    }
    def destroy = {
    }
}
