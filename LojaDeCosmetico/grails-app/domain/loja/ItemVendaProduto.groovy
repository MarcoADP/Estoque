package loja

import loja.Produto

class ItemVendaProduto {
    static belongsTo = [Venda,Produto]
    Venda venda
    Produto produto
    int quantidade
    double total
    
    static constraints = {
        //quantidade(min:0)
    }
    
    ItemVendaProduto(Produto produto, Venda venda , int quantidade){
        this.venda = venda
        this.produto = produto
        this.quantidade = quantidade
        this.total = produto.preco * quantidade
    }
}
