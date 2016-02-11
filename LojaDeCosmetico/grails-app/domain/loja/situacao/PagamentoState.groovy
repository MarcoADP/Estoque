package loja.situacao

import loja.Pagamento

enum PagamentoState {
    A_VENCER {
        @Override
        boolean mostrarAlerta() {
            return true
        }

        @Override
        boolean habilitarImpressao() {
            return false
        }

        @Override
        PagamentoState pagar(float valor, Pagamento pagamento) {
            return PagamentoState.PAGO
        }

        @Override
        String getStrSituacao() {
            return "A Vencer"
        }
    },

    CANCELADO {
        @Override
        boolean mostrarAlerta() {
            return false
        }

        @Override
        boolean habilitarImpressao() {
            return false
        }

        @Override
        PagamentoState pagar(float valor, Pagamento pagamento) {
            return this
        }

        @Override
        String getStrSituacao() {
            return "Cancelado"
        }
    },

    EM_ABERTO {
        @Override
        boolean mostrarAlerta() {
            return true
        }

        @Override
        boolean habilitarImpressao() {
            return false
        }

        @Override
        PagamentoState pagar(float valor, Pagamento pagamento) {
            return PagamentoState.PAGO
        }

        @Override
        String getStrSituacao() {
            return "Em Aberto"
        }
    },

    VENCIDO {
        @Override
        boolean mostrarAlerta() {
            return false
        }

        @Override
        boolean habilitarImpressao() {
            return false
        }

        @Override
        PagamentoState pagar(float valor, Pagamento pagamento) {
            return this
        }

        @Override
        String getStrSituacao() {
            return "Vencido"
        }
    },

    PAGO {
        @Override
        boolean mostrarAlerta() {
            return false
        }

        @Override
        boolean habilitarImpressao() {
            return true
        }

        @Override
        PagamentoState pagar(float valor, Pagamento pagamento) {
            return this
        }

        @Override
        String getStrSituacao() {
            return "Pago"
        }
    }


    abstract boolean mostrarAlerta()

    abstract boolean habilitarImpressao()

    abstract PagamentoState pagar(float valor, Pagamento pagamento)

    abstract String getStrSituacao()
}