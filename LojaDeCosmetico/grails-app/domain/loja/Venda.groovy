package loja

class Venda {

    int codigo;
    Date dataVenda;
    Cliente cliente;
    //static hasOne = [cliente: Cliente];
    //static hasOne = [pagamento: Pagamento];
    static hasMany = [produto: Produto]
    String status;
    Double precoTotal;

    static constraints = {
        codigo();
        produto();
        precoTotal();
        cliente();
        status(inList: ["A pagar", "Pago"]);
        dataVenda();
    }
}
