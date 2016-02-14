package loja

import grails.test.*

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
class PagamentoSpec extends GrailsUnitTestCase {
    protected void setUp() {super.setUp()}

    protected void tearDown() {super.tearDown()}

    void testeValidacao() {
        mockDomain Pagamento
        mockDomain Cliente

        Cliente cliente = new Cliente(nome: "Joao")

        def pagamento1 = new Pagamento(id_venda: 1, cliente: cliente, dataVencimento: new Date(), dateCreated: new Date(), valorTotal: -10, tipoPagamento: "Boleto")
        assertFalse pagamento1.validate()

        def pagamento2 = new Pagamento(id_venda: 1, cliente: cliente, dataVencimento: new Date().plus(7), dateCreated: new Date(), valorTotal: 10.5, tipoPagamento: "Dinheiro")
        assertTrue pagamento2.validate()
    }

    void testeEfetuarPagamento(){
        mockDomain Venda
        mockDomain Pagamento
        mockDomain Cliente

        Venda venda = new Venda(dataTransacao: new Date())
        Cliente cliente = new Cliente(nome: "Joao")


        Pagamento pagamento = new Pagamento(id_venda: venda.id, dateCreated: new Date(), dataVencimento: new Date().plus(7), cliente: cliente, tipoPagamento: "Dinheiro")

        assertTrue pagamento.isEmAberto()

        float valorTotal_fail = -10.0
        assertFalse pagamento.efetuarPagamento(venda, valorTotal_fail)

        float valorTotal_ok = 5.5
        assertTrue pagamento.efetuarPagamento(venda, valorTotal_ok)

        assertTrue pagamento.isPago()
    }
}
