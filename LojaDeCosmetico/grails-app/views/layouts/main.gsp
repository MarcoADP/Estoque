<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Loja"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">

    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <r:require modules="bootstrap"/>
    <r:layoutResources/>
    <g:layoutHead/>
</head>
<body>

<div class="page-container">
    <div class="sidebar-menu">
        <div class="sidebar-header">
            <div class="logo">
                <a href="${createLink(uri: '/')}">Controle de Estoque</a>
            </div>
            <h6>Loja de Cosméticos</h6>
            <sec:ifLoggedIn>
                <h6>Logado como: <sec:username /></h6>
            </sec:ifLoggedIn>
        </div>
        <ul class="nav nav-sidebar">
            <li class="${controllerName == null ? 'active' : ''}"><a href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span>Principal</a></li>
            <sec:ifAllGranted roles="ROLE_GERENTE">
                <li class="${controllerName == 'usuario' ? 'active' : ''}"><g:link controller="usuario"><span class="glyphicon glyphicon-user"></span>Usuários</g:link></li>
            </sec:ifAllGranted>
            <li class="${controllerName == 'cliente' ? 'active' : ''}"><g:link controller="cliente"><span class="glyphicon glyphicon-user"></span>Cliente</g:link></li>
            <li class="nav-sidebar divider"></li>
            <li class="${controllerName == 'venda' ? 'active' : ''}"><g:link controller="venda"><span class="glyphicon glyphicon-tag"></span>Vendas</g:link></li>
            <li class="${controllerName == 'pagamento' ? 'active' : ''}"><g:link controller="pagamento"><span class="glyphicon glyphicon-credit-card"></span>Pagamentos</a></g:link></li>
            <li class="nav-sidebar divider"></li>
            <li class="${controllerName == 'produto' ? 'active' : ''}"><g:link controller="produto"><span class="glyphicon glyphicon-list-alt"></span>Estoque</g:link></li>
            <li class="${controllerName == 'devolverProduto' ? 'active' : ''}"><g:link controller="devolverProduto"><span class="glyphicon glyphicon-new-window"></span>Devolver produto</g:link></li>
            <sec:ifAllGranted roles="ROLE_GERENTE">
                <li class="nav-sidebar divider"></li>
                <li class="${controllerName == 'fornecedor' ? 'active' : ''}"><g:link controller="fornecedor"><span class="glyphicon glyphicon-globe"></span>Fornecedor</g:link></li>
                <li class="${controllerName == 'pedido' ? 'active' : ''}"><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span>Compras</a></li>
                <!--<li class="${controllerName == 'retornarCompra' ? 'active' : ''}"><a href=""><span class="glyphicon glyphicon-new-window"></span>Retornar compra</a></li>-->
            </sec:ifAllGranted>
            <li class="nav-sidebar divider"></li>
            <li><a href="${createLink(uri: '/ajuda')}"><span class="glyphicon glyphicon-question-sign"></span>Ajuda</a></li>
        </ul>
        <ul class="nav nav-sidebar nav-bottom">
            <li><a href="${createLink(uri: '/logout')}"><span class="glyphicon glyphicon-log-out"></span><g:message code="springSecurity.logout.name"/></a></li>
        </ul>
    </div>
    <div class="main-content">

            <g:layoutBody/>

    </div>
</div>

<r:layoutResources/>
</body>
</html>
