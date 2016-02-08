<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Loja de Cosmético</title>
		<%@ page import="loja.*" %>
	</head>
	<body>
	<div id="page-body" role="main">
		<h1 class="titulo-main">Bem Vindo <sec:username/></h1>

		<hr>
		<div class="row">
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="row tile tile-info">
							<div class="col-xs-3">
								<div class="circle circle-lg"><i class="glyphicon glyphicon-user"></i></div>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">${Cliente.count()}</div>
								<div class="sub-text">CLIENTES</div>
							</div>
						</div>
					</div>
					%{--<a href="#">--}%
						%{--<div class="panel-heading">--}%
							%{--<span class="pull-left">View Details</span>--}%
							%{--<span class="pull-right"><i class="glyphicon glyphicon-circle-arrow-right"></i></span>--}%
							%{--<div class="clearfix"></div>--}%
						%{--</div>--}%
					%{--</a>--}%
				</div>
			</div>

			<div class="col-lg-3 col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="row tile tile-warning">
							<div class="col-xs-3">
								<div class="circle circle-lg"><i class="glyphicon glyphicon-tag"></i></div>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">${Venda.count()}</div>
								<div class="sub-text">VENDAS</div>
							</div>
						</div>
					</div>
					%{--<a href="#">--}%
					%{--<div class="panel-heading">--}%
					%{--<span class="pull-left">View Details</span>--}%
					%{--<span class="pull-right"><i class="glyphicon glyphicon-circle-arrow-right"></i></span>--}%
					%{--<div class="clearfix"></div>--}%
					%{--</div>--}%
					%{--</a>--}%
				</div>
			</div>

			<div class="col-lg-3 col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="row tile tile-success">
							<div class="col-xs-3">
								<div class="circle circle-lg"><i class="glyphicon glyphicon-list-alt"></i></div>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">${Produto.count()}</div>
								<div class="sub-text">PRODUTOS</div>
							</div>
						</div>
					</div>
					%{--<a href="#">--}%
					%{--<div class="panel-heading">--}%
					%{--<span class="pull-left">View Details</span>--}%
					%{--<span class="pull-right"><i class="glyphicon glyphicon-circle-arrow-right"></i></span>--}%
					%{--<div class="clearfix"></div>--}%
					%{--</div>--}%
					%{--</a>--}%
				</div>
			</div>

			<div class="col-lg-3 col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="row tile tile-danger">
							<div class="col-xs-3">
								<div class="circle circle-lg"><i class="glyphicon glyphicon-globe"></i></div>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">${Fornecedor.count()}</div>
								<div class="sub-text">FORNECEDORES</div>
							</div>
						</div>
					</div>
					%{--<a href="#">--}%
					%{--<div class="panel-heading">--}%
					%{--<span class="pull-left">View Details</span>--}%
					%{--<span class="pull-right"><i class="glyphicon glyphicon-circle-arrow-right"></i></span>--}%
					%{--<div class="clearfix"></div>--}%
					%{--</div>--}%
					%{--</a>--}%
				</div>
			</div>
		</div>

		<br>
		<div class="row">
			<div class="col-lg-4">
				<div class="list-group">
					<a href="#" class="list-group-item disabled">Ações rápidas</a>
					<g:link controller="cliente" action="create" class="list-group-item">Cadastrar cliente<i class="pull-right glyphicon glyphicon-user"></i></g:link>
					<g:link controller="venda" action="create" class="list-group-item">Nova venda<i class="pull-right glyphicon glyphicon-tag"></i></g:link>
					<g:link controller="devolverProduto" class="list-group-item">Devolução de produto<i class="pull-right glyphicon glyphicon-new-window"></i></g:link>
					<g:link controller="produto" action="create" class="list-group-item">Cadastrar Produto<i class="pull-right glyphicon glyphicon-list-alt"></i></g:link>
					<g:link controller="pagamento" class="list-group-item">Pagamentos<i class="pull-right glyphicon glyphicon-credit-card"></i></g:link>
				</div>
			</div>
		</div>

		<hr>
		</div>
	</body>
</html>
