package loja

class Pedido {

    Produto produto
    int quantidade
    Fornecedor fornecedor
    Date dateCreated
    float valor
    boolean cancelado

    static constraints = {
        fornecedor()
        produto()
        quantidade(min: 0)
        valor(min:0f)
        cancelado(nullable: true)
    }

    static mapping = {
        dateCreated column: 'data_pedido'
    }

}
