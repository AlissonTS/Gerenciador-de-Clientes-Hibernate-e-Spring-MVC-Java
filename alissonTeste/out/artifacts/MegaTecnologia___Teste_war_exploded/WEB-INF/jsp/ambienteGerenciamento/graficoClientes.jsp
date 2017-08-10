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
                            <li class="active"><a href="pagina-principal.html">Página Principal</a></li>
                            <li class="dropdown active"><a class="dropdown-toggle" data-toggle="dropdown">Gerenciamento de Clientes <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="cadastro-cliente.html.html">Cadastrar Cliente</a></li>
                                    <li><a href="lista-clientes.html">Lista de Clientes Cadastrados</a></li>
                                    <li class="active"><a href="grafico-clientes.html">Gráficos</a></li>
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
                        <h2 class="text-center" style="font-size: 28px;">Página Principal</h2>

                    </div>
                </div>
            </div>
        </div>

        <%@ include file="../../../import/footer.jsp" %>
    </div>

    <%@ include file="../../../import/js.jsp" %>
    </body>
</html>