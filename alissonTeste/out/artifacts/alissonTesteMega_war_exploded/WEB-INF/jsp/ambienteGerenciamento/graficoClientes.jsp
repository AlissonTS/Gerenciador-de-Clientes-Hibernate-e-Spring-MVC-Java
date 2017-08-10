<%@ include file="../../../import/contentType.jsp" %>
<%@ page contentType="text/html;charset=LATIN1" language="java" %>
<html>
    <head>
        <title>Gráfico de Clientes</title>
        <%@ include file="../../../import/head.jsp" %>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/graficoClientes.js"></script>
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
                                    <li><a href="cadastro-cliente.html">Cadastrar Cliente</a></li>
                                    <li><a href="gerenciar-cliente.html">Gerenciar Cliente</a></li>
                                    <li class="active"><a href="grafico-clientes.html">Gráficos</a></li>
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
                        <h2 class="text-center" style="font-size: 28px;">Gráficos</h2>

                        <c:if test="${not empty clientes}">
                            <div style="margin-bottom: 5%">
                                <center>
                                    <div id="piechart_div" style="border: 1px solid #ccc"></div>
                                    <div id="barchart_div" style="border: 1px solid #ccc"></div>
                                </center>
                            </div>
                        </c:if>
                        <c:if test="${empty clientes}">
                            <div class="row">
                                <div class="col-md-12 col-xs-12">
                                    <div class="alert alert-danger" style="margin-top: 2%; font-size: 16px;">
                                        Não há clientes cadastrados no sistema! <a href="cadastro-cliente.html">Cadastrar Cliente</a>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>

        <%@ include file="../../../import/footer.jsp" %>
    </div>

    <script src="js/bootstrap/bootstrap.js"></script>
    <script type="text/javascript" src="js/dropdown.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    </body>
</html>