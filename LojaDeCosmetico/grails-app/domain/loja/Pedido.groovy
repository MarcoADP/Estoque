package loja

import loja.Produto

class Pedido extends Transacao{

    static hasMany = [itensProduto: ItemCompra]
    List<ItemCompra> itensProduto = new ArrayList<ItemCompra>()
    int quantidadeTotalProdutos = 0
    double valorTotalProdutos = 0

    int quantidadeTotal = 0
    double valorTotal = 0

    Pagamento pagamento

    static constraints = {
        quantidadeTotal(min: 0)
        valorTotal(min:0d)
        pagamento(nullable: true)
    }

    boolean addItemProduto(Produto produto, int quantidade){
        ItemCompra item = new ItemCompra(produto, this, quantidade)

        for(ItemCompra itemNaLista: this.itensProduto){
            if(itemNaLista.produto.id == produto.id){
                return false
            }
        }

        if(quantidade < 0){
            return false
        }

        if(item.hasErrors()){
            return false
        }

        this.itensProduto.add(item)

        this.quantidadeTotalProdutos += item.quantidade
        this.valorTotalProdutos += item.total

        this.quantidadeTotal += item.quantidade
        this.valorTotal += item.total

        return true
    }

    boolean removeItemProduto(ItemCompra item){
        if(this.itensProduto.remove(item)){
            this.quantidadeTotalProdutos -= item.quantidade
            this.valorTotalProdutos -= item.total
            this.quantidadeTotal -= item.quantidade
            this.valorTotal -= item.total
            return true
        }else{
            return false
        }
    }


    void updateSaldoOfProducts(){
        for(ItemCompra item : this.itensProduto){
            item.produto.quantidade -= item.quantidade
            //item.produto.quantidadeVendido += item.quantidade
            item.produto.save(flush: true)
        }
    }

    boolean finalizarPedido(){
        this.setFinalizada()
        this.updateSaldoOfProducts()
        return true
    }

}
