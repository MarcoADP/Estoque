<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>Comprovante</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="http://localhost:8080/LojaDeCosmetico/assets/bootstrap.css" />
    <link rel="stylesheet" href="http://localhost:8080/LojaDeCosmetico/assets/bootstrap-theme.css" />
    <link rel="stylesheet" href="http://localhost:8080/LojaDeCosmetico/assets/application.css" />

    %{--<link rel="stylesheet" type="text/css" href="${grailsApplication.config.grails.serverURL}/css/pdf.css" media="all" />--}%
    %{--<link rel="stylesheet" href="${resource(dir:'css',file:'application.css')}" />--}%
    %{--<asset:stylesheet src="application.css"/>--}%
    %{--<r:require modules="bootstrap"/>--}%
    %{--<r:layoutResources/>--}%
    %{--<g:layoutHead/>--}%

    <style  type="text/css">
    @page {
        size: A4 portrait;

    }
    .pad {
        padding-left: 175px;
    }
    .dll-horizontal dt {
        float: left;
        width: 160px;
        overflow: hidden;
        clear: left;
        text-align: left;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .dll-horizontal dd {
        margin-left: 180px;
    }

    hr {
        border-color: #afafaf;
    }

    </style>
</head>
<body>

<hr></hr>
<div class="pad">
    <dl class="dll-horizontal">
        <dt>Recibo Nº:</dt>
        <dd>${formatNumber(number: pagamento?.id, format: '0000')}</dd>
    </dl>

    <dl class="dll-horizontal">
        <dt>Emissor:</dt>
        <dd>Loja de Cosmético</dd>
    </dl>

    <dl class="dll-horizontal">
        <dt>CNPJ:</dt>
        <dd>05.466.251/0001-80</dd>
    </dl>

    <dl class="dll-horizontal">
        <dt>Cliente</dt>
        <dd>${pagamento?.cliente?.encodeAsHTML()}</dd>
    </dl>

    <dl class="dll-horizontal">
        <dt>Valor:</dt>
        <dd>R$ ${formatNumber(number: fieldValue(bean: pagamento, field: "valorTotal"), format: '##0.00')}</dd>
    </dl>

    <dl class="dll-horizontal">
        <dt>Data de emissão</dt>
        <dd><g:formatDate date="${pagamento?.dateCreated}" /></dd>
    </dl>

</div>
<hr></hr>

</body>
</html>