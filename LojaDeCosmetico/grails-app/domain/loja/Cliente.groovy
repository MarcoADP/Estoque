package loja

class Cliente {

    String nome;

    String endereco;
    int telefone;
    Date dataNascimento;
    int idade;
    Date dataCadastro;

    static constraints = {
        nome();
        endereco();
        telefone();
        dataNascimento();
        idade();
        dataCadastro();
    }
}
