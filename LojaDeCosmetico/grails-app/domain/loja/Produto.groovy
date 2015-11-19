package loja

class Produto {

    int codigo;
    String nome;
    float preco;
    int quantidade;
    Date dataFabricacao;
    Date dataVencimento;

    static constraints = {
        codigo unique: true
        nome blank: false
        preco blank: false, min: 0F
        quantidade blank: false, min: 0
        dataFabricacao blank: false, validator: {val, obj ->
            val.before(obj.dataVencimento)
        }
        dataVencimento blank: false
    }
}
