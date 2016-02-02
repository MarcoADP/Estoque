package loja

class Fornecedor {

    String nome;
    int cnpj;
    int codFor;
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
