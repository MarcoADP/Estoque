package loja

import loja.Produto


class Venda extends Transacao{
    enum Status{
        EM_ABERTO, CANCELADA, FINALIZADA
    }
    
    Status status = Status.EM_ABERTO
    static hasMany = [itensProduto: ItemVendaProduto]
    List<ItemVendaProduto> itensProduto = new ArrayList<ItemVendaProduto>()
    int quantidadeTotalProdutos = 0
    double valorTotalProdutos = 0
    
    int quantidadeTotal = 0
    double valorTotal = 0
    
    String pagamento
    
    static constraints = {
        quantidadeTotal(min: 0)
        valorTotal(min:0d)
        pagamento(nullable: true)
    }
    
    boolean isEmAberto(){
        if (status == Status.EM_ABERTO){
            return true
        }
    }
    
    boolean isCancelada(){
        if (status == Status.CANCELADA){
            return true
        }
    }
    
    boolean isFinalizada(){
        if (status == Status.FINALIZADA){
            return true
        }
    }
    
    String getStatusStr(){
        if (status == Status.EM_ABERTO){
            return "Em Aberto"
        } else if (status == Status.FINALIZADA){
            return "Finalizada"
        } else {
            return "Cancelada"
        }
    }
    
    void setEmAberto(){
        status = Status.EM_ABERTO
    }
    
    void setCancelada(){
        status = Status.CANCELADA
    }
    
    void setFinalizada(){
        status = Status.FINALIZADA
    }
    
    boolean addItemProduto(Produto produto, int quantidade){
        ItemVendaProduto item = new ItemVendaProduto(produto, this, quantidade)
        
        for(ItemVendaProduto itemNaLista: this.itensProduto){
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
    
    boolean removeItemProduto(ItemVendaProduto item){
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
        for(ItemVendaProduto item : this.itensProduto){
            item.produto.quantidade -= item.quantidade
            //item.produto.quantidadeVendido += item.quantidade
            item.produto.save(flush: true)
        }
    }

    
    boolean finalizarVenda(){
        this.setFinalizada()        
        this.updateSaldoOfProducts()
        return true
    }
    
}
