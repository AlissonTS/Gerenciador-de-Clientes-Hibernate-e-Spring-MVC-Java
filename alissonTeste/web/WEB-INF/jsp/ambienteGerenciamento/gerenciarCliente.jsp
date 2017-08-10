<%@ include file="../../../import/contentType.jsp" %>
<%@ page contentType="text/html;charset=LATIN1" language="java" %>
<html>
    <head>
        <title>Gerenciar Cliente</title>
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
                                    <li><a href="cadastro-cliente.html">Cadastrar Cliente</a></li>
                                    <li class="active"><a href="gerenciar-cliente.html">Gerenciar Cliente</a></li>
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
                    <div class="col-md-offset-1 col-md-10 col-xs-12" style="margin-bottom: 5%;">
                        <c:if test="${not empty mensagem}">
                            <div class="row">
                                <div class="col-md-offset-2 col-md-8 col-xs-12">
                                    <div class="alert alert-${tipo}" style="margin-top: 2%; font-size: 16px;">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                            ${mensagem}
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <h2 class="text-center" style="font-size: 28px;">Gerenciar Cliente</h2><br>

                        <c:if test="${not empty clientes}">

                            <div class="row">
                                <div class="col-md-5 col-xs-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control input-search" placeholder="Buscar clientes" alt="lista-clientes">
                                            <div class="input-group-btn">
                                                <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="table-responsive">
                                <table class="table table-bordered lista-clientes" id="tblClientes">
                                    <thead>
                                        <tr>
                                            <th>Nome do Cliente</th>
                                            <th>Data de Nascimento</th>
                                            <th>CEP</th>
                                            <th>Logradouro</th>
                                            <th>Bairro</th>
                                            <th>Município</th>
                                            <th>Estado</th>
                                            <th>Alterar</th>
                                            <th>Excluir</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${clientes}" var="c">
                                            <tr>
                                                <th data-idcliente="${c.idCliente}"><c:out value="${c.nomeCliente}" escapeXml="true"/></th>
                                                <td><c:out value="${c.dataNasc}" escapeXml="true"/></td>
                                                <td><c:out value="${c.cep}" escapeXml="true"/></td>
                                                <td><c:out value="${c.logradouro}" escapeXml="true"/></td>
                                                <td><c:out value="${c.bairro}" escapeXml="true"/></td>
                                                <td><c:out value="${c.municipio}" escapeXml="true"/></td>
                                                <td><c:out value="${c.estado}" escapeXml="true"/></td>
                                                <td><form action="altera-cliente.html" method="POST" role="form">
                                                    <input type="hidden" value="${c.idCliente}" name="id" required="true" readonly>
                                                    <button type="submit" value="enviar" name="form" class="btn btn-primary">Alterar</button>
                                                </form></td>
                                                <td><button type="button" id="excluirCliente" name="excluir" class="btn btn-danger" data-toggle="modal" data-target="#confirmExcluir">Excluir</button></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:if>
                        <c:if test="${empty clientes}">
                            <div class="row">
                                <div class="col-md-offset-2 col-md-8 col-xs-12">
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

        <!-- Modal -->
        <div class="modal fade" id="confirmExcluir" tabindex="-1" role="dialog" aria-labelledby="confirmExcluir">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Excluir Cliente</h4>
                    </div>
                    <div class="modal-body">
                        <p style="font-size: 17px;">Deseja confirmar a exclusão do cliente?</p>
                    </div>
                    <div class="modal-footer">
                        <form id="formularioExcluir" action="excluir-cliente.html" method="POST" role="form">
                            <input type="hidden" id="id" name="id" required="true" readonly>
                            <p class="text-center"><button type="submit" name="form" value="enviar" class="btn btn-danger">Sim</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Não</button></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <%@ include file="../../../import/footer.jsp" %>
    </div>

    <%@ include file="../../../import/js.jsp" %>
    <script type="text/javascript" src="js/modalAcao.js"></script>
    <script type="text/javascript" src="js/buscaCliente.js"></script>
    </body>
</html>