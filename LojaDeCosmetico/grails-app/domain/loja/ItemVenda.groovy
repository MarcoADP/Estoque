package loja

class ItemVenda {
    static belongsTo = [Venda,Produto]
    Venda venda
    Produto produto
    int quantidade
    double preco_total
    
    static constraints = {
        quantidade(min:0)
    }
    
    ItemVenda(Produto produto, Venda venda , int quantidade){
        this.venda = venda
        this.produto = produto
        this.quantidade = quantidade
        this.preco_total = produto.preco * quantidade
    }

    /**
     * Seta uma nova quantidade para este ItemVenda, permitindo modificar o objeto mantendo a caracteristica do preço
     * @param quantidade
     */
    void setQuantidade(int quantidade){
        this.quantidade = quantidade
        this.preco_total = produto.preco * quantidade
    }
}
