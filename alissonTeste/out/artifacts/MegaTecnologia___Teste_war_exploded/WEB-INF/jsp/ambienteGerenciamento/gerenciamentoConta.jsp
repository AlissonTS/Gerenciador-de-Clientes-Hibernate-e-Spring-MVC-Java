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
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Clientes <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="cadastro-cliente.html.html">Cadastrar Cliente</a></li>
                                    <li><a href="lista-clientes.html">Lista de Clientes Cadastrados</a></li>
                                    <li><a href="grafico-clientes.html">Gráficos</a></li>
                                </ul>
                            </li>
                            <li class="active"><a href="alterar-conta.html"><span class="glyphicon glyphicon-cog"></span> Gerenciamento de Conta</a></li>
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
                        <h2 class="text-center" style="font-size: 28px;">Gerenciamento de Conta</h2>

                        <form:form action="alterar-conta.html" method="post" commandName="usuario" style="font-size: 16px;">
                            <div class="form-group row" style="margin-top: 5%;">
                                <label for="nomeUsuario" class="col-md-3 col-xs-4 col-form-label">Nome Completo: </label>
                                <div class="col-md-8 col-xs-8">
                                    <form:input class="form-control" style="height: 50px;" id="nomeUsuario" name="nomeUsuario" placeholder="Digite o seu nome" required="true" path="nomeUsuario"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="senhaUsuario" class="col-md-3 col-xs-4 col-form-label">Digite a sua nova senha: </label>
                                <div class="col-md-8 col-xs-8">
                                    <form:password class="form-control" style="height: 50px;" id="senhaUsuario" name="senhaUsuario" placeholder="Digite a sua nova senha" required="true" path="senhaUsuario"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="senhaN" class="col-md-3 col-xs-4 col-form-label">Confirme sua nova senha: </label>
                                <div class="col-md-8 col-xs-8">
                                    <input class="form-control" type="password" id="senhaN" name="senhaN" placeholder="Digite novamente sua senha" required="true"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-12 col-md-12 col-sm-12" style="margin-bottom: 3%">
                                    <button type="submit" class="btn btn-primary submitButton" value="Enviar" name="form">Alterar</button>
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
    </body>
</html>