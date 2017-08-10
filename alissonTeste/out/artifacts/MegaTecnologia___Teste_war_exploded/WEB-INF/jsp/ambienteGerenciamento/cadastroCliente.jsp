<%@ include file="../../../import/contentType.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Página Principal</title>
        <%@ include file="../../../import/head.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@ include file="../../../import/header.jsp" %>

            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <%@ include file="../../../import/menu.jsp" %>
                        <div class="collapse navbar-collapse" id="menu">
                            <ul class="nav navbar-nav">
                                <li><a href="pagina-principal.html">Página Principal</a></li>
                                <li class="dropdown active"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Clientes <span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li class="active"><a href="cadastro-cliente.html">Cadastrar Cliente</a></li>
                                        <li><a href="lista-clientes.html">Lista de Clientes Cadastrados</a></li>
                                        <li><a href="grafico-clientes.html">Gráficos</a></li>
                                    </ul>
                                </li>
                                <li><a href="alterar-conta.html"><span class="glyphicon glyphicon-cog"></span> Gerenciamento de Conta</a></li>
                                <li><a href="logout-sistema.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <div class="container-fluid">
                    <div class="row" style="margin-left: 0px; margin-right: 0px">
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <c:if test="${not empty mensagem}">
                                <div class="alert alert-${tipo}" style="margin-top: 5%; font-size: 16px;">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        ${mensagem}
                                </div>
                            </c:if>
                            <h2 class="text-center" style="font-size: 28px;">Cadastrar Cliente</h2>

                            <form:form action="cadastrar-cliente.html" method="post" commandName="cliente" style="font-size: 16px;">
                                <div class="form-group row" style="margin-top: 5%;">
                                    <label for="nomeCliente" class="col-md-3 col-xs-4 col-form-label">Nome Completo: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <form:input class="form-control" style="height: 50px;" id="nomeCliente" name="nomeCliente" placeholder="Digite o nome do cliente" required="true" path="nomeCliente"/>                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="dataNasc" class="col-md-3 col-xs-4 col-form-label">Data de Nascimento: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <form:input class="form-control" style="height: 50px;" id="dataNasc" name="dataNasc" placeholder="Digite a data de nascimento do cliente" required="true" path="dataNasc"/>                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="cep" class="col-md-3 col-xs-4 col-form-label">CEP: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <form:input class="form-control" style="height: 50px;" id="cep" name="cep" placeholder="Digite o CEP do cliente" required="true" path="cep"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="logradouro" class="col-md-3 col-xs-4 col-form-label">Logradouro: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <form:input class="form-control" style="height: 50px;" id="logradouro" name="logradouro" placeholder="Digite o logradouro do cliente" required="true" path="logradouro"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="bairro" class="col-md-3 col-xs-4 col-form-label">Bairro: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <form:input class="form-control" style="height: 50px;" id="bairro" name="bairro" placeholder="Digite o bairro do cliente" required="true" path="bairro"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="municipio" class="col-md-3 col-xs-4 col-form-label">Município: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <form:input class="form-control" style="height: 50px;" id="municipio" name="municipio" placeholder="Digite o município do cliente" required="true" path="municipio"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="estado" class="col-md-3 col-xs-4 col-form-label">Estado: </label>
                                    <div class="col-md-8 col-xs-8">
                                        <form:input class="form-control" style="height: 50px;" id="estado" name="estado" placeholder="Digite o Estado do cliente" required="true" path="estado"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-12 col-md-12 col-sm-12" style="margin-bottom: 3%">
                                        <button type="submit" class="btn btn-success submitButton" value="Enviar" name="form">Cadastrar</button>
                                    </div>
                                </div>
                            </form:form>

                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="../../../import/footer.jsp" %>
        </div>

        <%@ include file="../../../import/js.jsp" %>
        <script type="text/javascript" src="js/mask.js"></script>
        <script type="text/javascript" src="js/buscaCEP.js"></script>
    </body>
</html>
