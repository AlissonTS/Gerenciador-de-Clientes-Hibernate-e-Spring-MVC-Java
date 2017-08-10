<%@ include file="../../../import/contentType.jsp" %>
<%@ page contentType="text/html;charset=LATIN1" language="java" %>
<html>
    <head>
        <title>Ver Cliente</title>
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
                            <li><a href="gerenciar-conta.html"><span class="glyphicon glyphicon-cog"></span> Gerenciamento de Conta</a></li>
                            <li><a href="logout-sistema.html"><span class="glyphicon glyphicon-log-out"></span> Sair do Sistema</a></li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div class="container-fluid">
                <div class="row" style="margin-left: 0px; margin-right: 0px">
                    <div class="col-md-offset-3 col-md-6 col-xs-12" style="margin-bottom: 5%;">
                        <div class="row">
                            <div class="col-md-3 col-xs-5">
                                <a style="font-size: 16px;" href="pagina-principal.html">Voltar</a>
                            </div>
                        </div>

                        <c:if test="${not empty formulario}">
                            <form:form commandName="cliente" style="font-size: 16px;"><br>
                                <h2 class="text-center" style="font-size: 28px;">Informações do Cliente</h2><br>
                                <c:forEach items="${formulario}" var="f">
                                    <div class="form-group row">
                                        <c:if test="${f.other ne 'readonly'}">
                                            <label for="${f.path}" class="col-md-3 col-xs-4 col-form-label">${f.label}: </label>
                                            <c:if test="${f.required eq 'required'}">
                                                <div class="col-md-8 col-xs-8">
                                                    <form:input class="form-control" style="font-size: 16px; box-shadow: 0 0 0 0; border: 0 none; outiline: 0; background-color: white;" type="${f.type}" id="${f.path}" name="${f.path}" required="true" path="${f.path}" readonly="true"/>
                                                </div>
                                            </c:if>
                                            <c:if test="${f.required ne 'required'}">
                                                <div class="col-md-8 col-xs-8">
                                                    <form:input class="form-control" style="font-size: 16px; box-shadow: 0 0 0 0; border: 0 none; outiline: 0; background-color: white;" type="${f.type}" id="${f.path}" name="${f.path}" path="${f.path}" readonly="true"/>
                                                </div>
                                            </c:if>
                                        </c:if>
                                    </div>
                                </c:forEach>
                            </form:form>
                        </c:if>
                        <c:if test="${empty formulario}">
                            <div class="alert alert-danger" style="margin-top: 2%; font-size: 16px;">
                                Erro do Sistema!
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="confirmAlterar" tabindex="-1" role="dialog" aria-labelledby="confirmLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Alterar Cliente</h4>
                    </div>
                    <div class="modal-body">
                        <p style="font-size: 17px;">Deseja confirmar a alteração do cliente?</p>
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
    <script type="text/javascript" src="js/mask.js"></script>
    <script type="text/javascript" src="js/buscaCEP.js"></script>
    <script type="text/javascript" src="js/modalAcao.js"></script>
    </body>
</html>
