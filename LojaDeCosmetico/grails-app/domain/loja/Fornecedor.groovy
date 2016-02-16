package loja

class Fornecedor {

    String nome;
    String cnpj;
    int codFor;
    String empresa;
    boolean cancelado

    static constraints = {
        nome();
        cnpj(cnpj: true, unique: true);
        codFor();
        empresa();
        cancelado(nullable: true)
    }

    String toString(){
        return nome;
    }
}
