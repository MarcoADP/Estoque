package loja

class Cliente {

    String nome;
    String cpf;
    String endereco;
    String telefone;
    Date dataNascimento;
    int idade;
    Date dateCreated;

    static constraints = {
        nome();
        cpf(cpf: true, unique: true);
        endereco();
        telefone();
        dataNascimento(max: new Date());
        idade(nullable: true);
    }

    static mapping = {
        dateCreated column: 'data_criacao'
    }

    String toString(){
        return nome;
    }
}
