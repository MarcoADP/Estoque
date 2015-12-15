package loja

class Produto {

    int codigo;
    String nome;
    float preco;
    int quantidade_in_stock;
    int quantidade_vendido;
    Date dataFabricacao;
    Date dataVencimento;

    static constraints = {
        codigo unique: true
        nome blank: false
        preco blank: false, min: 0F
        quantidade_in_stock blank: false, min: 0
        quantidade_vendido blank:false, min: 0
        dataFabricacao blank: false, validator: {val, obj ->
            val.before(obj.dataVencimento)
        }
        dataVencimento blank: false
    }

    String toString(){
        return nome;
    }

    /**
     * marca a venda de produtos, registrando quantos produtos de um tipo foram vendidos
     * @param quantidade: numero de produtos vendidos
     * @return false se nao havia produtos o bastante em estoque
     */
    boolean sellFromStock(int quantidade){
        if(this.quantidade_in_stock > quantidade) {
            this.quantidade_in_stock -= quantidade;
            this.quantidade_vendido += quantidade;
            this.save(flush: true);
            return true; //talvez esse boleano nao seja necessario
        }

        return false;
    }
}
