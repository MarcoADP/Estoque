package loja

class Pagamento {
    enum SituacaoPagamento{
        A_VENCER, CANCELADO, PAGO, VENCIDO, EM_ABERTO
    }

    int id_venda
    float valorTotal
    Date dateCreated
    Date dataVencimento
    Cliente cliente
    SituacaoPagamento situacao = SituacaoPagamento.EM_ABERTO
    String tipoPagamento


    static constraints = {
        valorTotal scale: 2, min: 0F
        //data vencimento pode ser null se for em dinheiro por exemplo
        dataVencimento (min: new Date().clearTime())
        tipoPagamento inList: ["Dinheiro", "Cartão de Crédito à Vista", "Cartão de Crédito à Prazo"]
    }

    static mapping = {
        dateCreated column: 'data_emissao'
    }

    boolean isAVencer(){
        return situacao == SituacaoPagamento.A_VENCER
    }

    boolean isCancelado(){
        return situacao == SituacaoPagamento.CANCELADO
    }

    boolean isPago(){
        return situacao == SituacaoPagamento.PAGO
    }

    boolean isVencido(){
        return situacao == SituacaoPagamento.VENCIDO
    }

    boolean isEmAberto(){
        return situacao == SituacaoPagamento.EM_ABERTO
    }

    String getStrSituacao(){
        switch (situacao){
            case SituacaoPagamento.CANCELADO: return "Cancelado"
            case SituacaoPagamento.VENCIDO: return "Vencido"
            case SituacaoPagamento.A_VENCER: return "A vencer"
            case SituacaoPagamento.PAGO: return "Pago"
            case SituacaoPagamento.EM_ABERTO: return "Em Aberto"
        }
    }

    void setAVencer(){
        situacao = SituacaoPagamento.A_VENCER
    }

    void setCancelado(){
        situacao = SituacaoPagamento.CANCELADO
    }

    void setPago(){
        situacao = SituacaoPagamento.PAGO
    }

    void setVencido(){
        situacao = SituacaoPagamento.VENCIDO
    }

    void setEmAberto(){
        situacao = SituacaoPagamento.EM_ABERTO
    }

    boolean efetuarPagamento(Venda venda, double valor_total){
        if (venda == null){
            return false
        }
        if (venda.hasErrors()){
            return false
        }
        if (valor_total < 0.0){
            return false;
        }
        venda.setFinalizada()
        venda.setPagamento(this)
        venda.save flush: true

        situacao.pagar(valor_total)
        return true
    }
}
