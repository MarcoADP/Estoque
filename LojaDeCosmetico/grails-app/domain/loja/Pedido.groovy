package loja

class Pedido extends Transacao{

    Produto produto
    int quantidade
    Fornecedor fornecedor
    Date dateCreated
    float valor

    static constraints = {
        fornecedor()
        produto()
        quantidade(min: 0)
        valor(min:0f)
    }

    static mapping = {
        dateCreated column: 'data_pedido'
    }

}
