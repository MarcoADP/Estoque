package loja

import grails.test.*

class TesteCaixaBrancaEfetuarPagamentoSpec extends GrailsUnitTestCase {

    protected void setUp() {super.setUp()}

    protected void tearDown() {super.tearDown()}

    void testeCaminho1() {
        mockDomain Venda
        mockDomain Pagamento
        mockDomain Cliente

        Venda venda = null
        Pagamento pagamento = new Pagamento(id_venda: 0, dateCreated: new Date(),
                                dataVencimento: new Date(), cliente: new Cliente(),
                                tipoPagamento: "Dinheiro")
        double valorTotal = 10.0

        assertFalse pagamento.efetuarPagamento(venda, valorTotal)
    }

    void testeCaminho2() {
        mockDomain Venda
        mockDomain Pagamento
        mockDomain Cliente

        Venda venda = new Venda(valorTotal: -1)
        Pagamento pagamento = new Pagamento(id_venda: 0, dateCreated: new Date(), dataVencimento: new Date(), cliente: new Cliente(), tipoPagamento: "Dinheiro")
        double valorTotal = 10.0

        assertFalse pagamento.efetuarPagamento(venda, valorTotal)
    }

    void testeCaminho3() {
        mockDomain Venda
        mockDomain Pagamento
        mockDomain Cliente

        Venda venda = new Venda(valorTotal: 10.0)
        Pagamento pagamento = new Pagamento(id_venda: 0, dateCreated: new Date(), dataVencimento: new Date(), cliente: new Cliente(), tipoPagamento: "Dinheiro")
        double valorTotal = -10.0

        assertFalse pagamento.efetuarPagamento(venda, valorTotal)
    }

    void testeCaminho4() {
        mockDomain Venda
        mockDomain Pagamento
        mockDomain Cliente

        Venda venda = new Venda(valorTotal: 10.0)
        Pagamento pagamento = new Pagamento(id_venda: 0, dateCreated: new Date(), dataVencimento: new Date(), cliente: new Cliente(), tipoPagamento: "Dinheiro")
        double valorTotal = 10.0

        assertTrue pagamento.efetuarPagamento(venda, valorTotal)
    }
}


