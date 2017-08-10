<%@ include file="../../../import/contentType.jsp" %>
<%@ page contentType="text/html;charset=LATIN1" language="java" %>
<html>
    <head>
        <title>Gerenciamento de Conta</title>
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
                                    <li><a href="cadastro-cliente.html">Cadastrar Cliente</a></li>
                                    <li><a href="gerenciar-cliente.html">Gerenciar Cliente</a></li>
                                    <li><a href="grafico-clientes.html">Gráficos</a></li>
                                </ul>
                            </li>
                            <li class="active"><a href="gerenciar-conta.html"><span class="glyphicon glyphicon-cog"></span> Gerenciamento de Conta</a></li>
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

                        <form:form id="form" action="alterar-conta.html" method="post" commandName="usuario" style="font-size: 16px;">
                            <div class="form-group row" style="margin-top: 5%;">
                                <label for="nomeUsuario" class="col-md-3 col-xs-4 col-form-label">Nome Completo: </label>
                                <div class="col-md-8 col-xs-8">
                                    <form:input class="form-control" style="height: 50px;" id="nomeUsuario" name="nomeUsuario" placeholder="Digite o seu nome" required="true" path="nomeUsuario"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="redefinir" class="col-md-3 col-xs-4 col-form-label">Redefinir Senha? </label>
                                <div class="col-md-8 col-xs-8">
                                    <select class="form-control" id="redefinir" name="redefinir" style="height: 50px;">
                                        <option value="Nao" checked>Não</option>
                                        <option value="Sim">Sim</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row" id="inputOculto">
                                <label for="senha" class="col-md-3 col-xs-4 col-form-label">Digite a sua nova senha: </label>
                                <div class="col-md-8 col-xs-8">
                                    <input class="form-control" style="height: 50px;" type="password" id="senha" name="senha" placeholder="Digite sua senha" required="true"/>                                </div>
                            </div>
                            <div class="form-group row" id="inputOculto2">
                                <label for="senhaN" class="col-md-3 col-xs-4 col-form-label">Confirme sua nova senha: </label>
                                <div class="col-md-8 col-xs-8">
                                    <input class="form-control" style="height: 50px;" type="password" id="senhaN" name="senhaN" placeholder="Digite novamente sua senha" required="true"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-xs-12" id="avisoDiv">
                                    <div class="alert alert-danger">
                                        <a data-dismiss="alert"></a><p id="avisoContent"></p>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-12 col-md-12 col-sm-12" style="margin-bottom: 3%">
                                    <button type="submit" class="btn btn-primary submitButton" value="Enviar">Alterar</button>
                                </div>
                            </div>
                        </form:form>

                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="confirmAlterar" tabindex="-1" role="dialog" aria-labelledby="confirmLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Alterar Conta</h4>
                    </div>
                    <div class="modal-body">
                        <p style="font-size: 17px;">Deseja confirmar a alteração de sua conta?</p>
                    </div>
                    <div class="modal-footer">
                        <p class="text-center">
                            <button type="button" class="btn btn-primary" id="yesAlterar">Sim</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Não</button></p>
                    </div>
                </div>
            </div>
        </div>

        <%@ include file="../../../import/footer.jsp" %>
    </div>

    <%@ include file="../../../import/js.jsp" %>
    <script type="text/javascript" src="js/hiddenForm.js"></script>

    </body>
</html>