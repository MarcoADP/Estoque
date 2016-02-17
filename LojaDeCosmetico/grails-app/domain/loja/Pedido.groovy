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

    boolean fechaPedido(Produto produto, float valor, int quantidade){
        if (quantidade < 0){
            return false
        }
        if (valor < 0){
            return false
        }
        produto.validate()
        if (produto.hasErrors()){
            return false
        }
        this.valor = valor
        this.quantidade = quantidade
        this.produto = produto
        return true
    }

}
