package loja

class Fornecedor {

    String nome;
    String cnpj;
    String codFor;
    String empresa;

    static constraints = {
        nome();
        cnpj(cnpj: true, unique: true);
        codFor();
        empresa();
    }

    String toString(){
        return nome;
    }
}
