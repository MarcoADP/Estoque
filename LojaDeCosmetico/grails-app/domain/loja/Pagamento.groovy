package loja

import loja.situacao.*

class Pagamento {

    int id_venda
    float valorTotal
    Date dateCreated
    Date dataVencimento
    Cliente cliente
    PagamentoState state = PagamentoState.EM_ABERTO
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
        return state == PagamentoState.A_VENCER
    }

    boolean isCancelado(){
        return state == PagamentoState.CANCELADO
    }

    boolean isPago(){
        return state == PagamentoState.PAGO
    }

    boolean isVencido(){
        return state == PagamentoState.VENCIDO
    }

    boolean isEmAberto(){
        return state == PagamentoState.EM_ABERTO
    }

    String getStrSituacao(){
        return state.getStrSituacao()
    }

    void setAVencer(){
        state = PagamentoState.A_VENCER
    }

    void setCancelado(){
        state = PagamentoState.CANCELADO
    }

    void setPago(){
        state = PagamentoState.PAGO
    }

    void setVencido(){
        state = PagamentoState.VENCIDO
    }

    void setEmAberto(){
        state = PagamentoState.EM_ABERTO
    }

    boolean efetuarPagamento(Venda venda, float valor_total){
        if (venda == null){
            return false
        }
        venda.validate()
        if (venda.hasErrors()){
            return false
        }
        if (valor_total < 0.0){
            return false;
        }

        venda.setFinalizada()
        venda.setPagamento(this)
        venda.save flush: true

        state = state.pagar(valor_total, this)
        return true
    }
}
