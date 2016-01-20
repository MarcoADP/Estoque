package loja

class Pagamento {

    double preco
    Date dataEmissao
    Date dataVencimento
    Cliente cliente
    String situacao
    String tipoPagamento


    static constraints = {
        situacao inList: ["A Vencer", "Vencido", "Pago"]
        tipoPagamento inList: ["Dinheiro", "Cartão de Crédito à Vista", "Cartão de Crédito à Prazo"]
    }
}
