package tarefas

import loja.Pagamento
import org.springframework.transaction.annotation.Transactional
import groovy.time.TimeCategory

@Transactional
class VencimentoTask {

    def sessionFactory
    static int cont = 0

    void executarTarefa(){
        Pagamento.withSession { session ->
            def listaPagamento = Pagamento.list()
            Date hoje = new Date().clearTime()
            for (Pagamento pagamento: listaPagamento){
                def dif = TimeCategory.minus(hoje, pagamento.dataVencimento)
                //println dif

                if (pagamento.isAVencer() && (cont >= 5 || pagamento.dataVencimento.compareTo(hoje.next()) >= 0)){
                    //println "VENCEU: "+pagamento
                    pagamento.setVencido()
                    pagamento.save(flush: true, failOnError: true, validate: false)
                }
                else if (pagamento.isEmAberto() && dif.days <= 7){
                    //println "A VENCER: "+pagamento
                    pagamento.setAVencer()
                    println pagamento.save(flush: true, failOnError: true, validate: false)
                }
            }
            cont++
        }
    }
}
