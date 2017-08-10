<%@ include file="../../../import/contentType.jsp" %>
<%@ page contentType="text/html;charset=LATIN1" language="java" %>
<html>
    <head>
        <title>Cadastro de Cliente</title>
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
                        <div class="col-md-offset-3 col-md-6 col-xs-12">
                            <c:if test="${not empty mensagem}">
                                <div class="alert alert-${tipo}" style="margin-top: 5%; font-size: 16px;">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        ${mensagem}
                                </div>
                            </c:if>
                            <h2 class="text-center" style="font-size: 28px;">Cadastrar Cliente</h2>

                            <c:if test="${not empty formulario}">
                                <form:form action="cadastrar-cliente.html" method="post" commandName="cliente" style="font-size: 16px;"><br>
                                    <c:forEach items="${formulario}" var="f">
                                        <div class="form-group row">
                                            <label for="${f.path}" class="col-md-3 col-xs-4 col-form-label">${f.label}: </label>
                                            <c:if test="${f.required eq 'required'}">
                                                <div class="col-md-8 col-xs-8">
                                                    <form:input class="form-control" style="height: 50px;" type="${f.type}" id="${f.path}" name="${f.path}" placeholder="${f.placeholder}" required="true" path="${f.path}"/>
                                                </div>
                                            </c:if>
                                            <c:if test="${f.required ne 'required'}">
                                                <div class="col-md-8 col-xs-8">
                                                    <form:input class="form-control" style="height: 50px;" type="${f.type}" id="${f.path}" name="${f.path}" placeholder="${f.placeholder}" path="${f.path}"/>
                                                </div>
                                            </c:if>
                                        </div>
                                    </c:forEach>
                                    <div class="form-group row">
                                        <div class="col-lg-12 col-md-12 col-sm-12" style="margin-bottom: 3%">
                                            <button type="submit" class="btn btn-success submitButton" value="Enviar" name="form">Cadastrar</button>
                                        </div>
                                    </div>
                                </form:form>
                            </c:if>
                            <c:if test="${empty formulario}">
                                <div class="alert alert-danger" style="margin-top: 2%; font-size: 16px;">
                                        Erro! Formulário não inicializado!
                                </div>
                            </c:if>
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
