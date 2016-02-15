import tarefas.VencimentoTask

// Place your Spring DSL code here
beans = {
    vencimentoPagamentoTask(VencimentoTask){
    }

    xmlns task: "http://www.springframework.org/schema/task"

    task.'scheduled-tasks'{
        task.scheduled(ref:'vencimentoPagamentoTask', method: 'executarTarefa', cron: '30 * * * * *')
    }
}
