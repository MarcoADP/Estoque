package util

import grails.transaction.Transactional
import loja.Produto
import loja.situacao.PagamentoState

@Transactional
class ObserverService {

    static map = [:]

    static cadastrar(Map map1){
        map.putAll(map1)
    }

    def msgPagAVencer() {
        def cont = map.pagamento?.findAllByState(PagamentoState.A_VENCER).size()
        def msg
        if (cont != null && cont > 0){
            if (cont == 1){
                msg = cont + " pagamento está prestes a vencer."
            }
            else {
                msg = cont + " pagamentos estão prestes a vencer."
            }
        }
        else {
            msg = null
        }

        return msg
    }

    def msgProdutoSemEstoque() {
        def cont = map.produto?.findAllByQuantidade(0).size()
        def msg
        if (cont != null && cont > 0){
            if (cont == 1){
                msg = cont + " produto está sem estoque."
            }
            else {
                msg = cont + " produtos estão sem estoque."
            }
        }
        else {
            msg = null
        }

        return msg
    }
}
