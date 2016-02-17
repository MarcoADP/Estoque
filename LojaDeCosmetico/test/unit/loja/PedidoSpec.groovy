package loja

import grails.test.*

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
class PedidoSpec extends GrailsUnitTestCase {
    protected void setUp() {super.setUp()}

    protected void tearDown() {super.tearDown()}

    void testaConstraints() {
        mockDomain Produto
        mockDomain Pedido
        mockDomain Fornecedor

        Fornecedor fornecedor = new Fornecedor(nome: "Fornecedor1", empresa: "Empresa1", cnpj: "68.767.527/0001-80")
        Produto produto = new Produto(nome: "Produto1", dataFabricacao: new Date(), dataVencimento: new Date().plus(7))

        Pedido pedido_fail = new Pedido(fornecedor: fornecedor, produto: produto, quantidade: -10, valor: -5)
        assertFalse pedido_fail.validate()

        Pedido pedido_ok = new Pedido(fornecedor: fornecedor, produto: produto, quantidade: 5, valor: 20.29)
        assertTrue pedido_ok.validate()
    }

    void testaFecharProduto(){
        mockDomain Produto
        mockDomain Pedido
        mockDomain Fornecedor

        Fornecedor fornecedor = new Fornecedor(nome: "Fornecedor1", empresa: "Empresa1", cnpj: "68.767.527/0001-80")
        Produto produto = new Produto(nome: "Produto1", dataFabricacao: new Date(), dataVencimento: new Date().plus(7))
        Pedido pedido = new Pedido(fornecedor: fornecedor)

        int quantidade_ok = 10
        float valor_ok = 10.49
        int quantidade_fail = -10
        float valor_fail = -10.49

        assertTrue pedido.fechaPedido(produto, valor_ok, quantidade_ok)

        assertFalse pedido.fechaPedido(produto, valor_ok, quantidade_fail)

        assertFalse pedido.fechaPedido(produto, valor_fail, quantidade_ok)

        assertFalse pedido.fechaPedido(produto, valor_fail, quantidade_fail)
    }
}
