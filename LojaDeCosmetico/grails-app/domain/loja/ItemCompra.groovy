package loja

class ItemCompra {
    static belongsTo = [Pedido,Produto]
    Pedido pedido
    Produto produto
    int quantidade
    double total

    static constraints = {
        quantidade(min:0)
    }

    ItemCompra(Produto produto, Pedido pedido , int quantidade){
        this.pedido = pedido
        this.produto = produto
        this.quantidade = quantidade
        this.total = produto.preco * quantidade
    }
}
