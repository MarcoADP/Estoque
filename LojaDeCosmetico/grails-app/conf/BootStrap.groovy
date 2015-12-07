import loja.*

class BootStrap {

    def init = { servletContext ->
        def papelGerente = Papel.findOrSaveWhere(authority: 'ROLE_GERENTE')
        def gerente = Usuario.findOrSaveWhere(username: 'gerente', password: 'gerente', nome: 'Joao', cpf: '671.473.226-06', cargo: 'Gerente')
        
        if (!gerente.authorities.contains(papelGerente)){
            UsuarioPapel.create(gerente, papelGerente, true)
        }
        
        def papelFuncionario = Papel.findOrSaveWhere(authority: 'ROLE_FUNCIONARIO')
        def funcionario = Usuario.findOrSaveWhere(username: 'funcionario', password: 'funcionario', nome: 'Funcionadosa', cpf: '671.473.226-06', cargo: 'Funcionario')
        
        if (!funcionario.authorities.contains(papelFuncionario)){
            UsuarioPapel.create(funcionario, papelFuncionario, true)
        }
    }
    def destroy = {
    }
}
