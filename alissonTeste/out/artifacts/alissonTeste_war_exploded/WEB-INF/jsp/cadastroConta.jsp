<%@ include file="../../import/contentType.jsp" %>
<%@ page contentType="text/html;charset=LATIN1" language="java" %>
<html>
    <head>
        <title>Gerenciamento de Clientes</title>
        <%@ include file="../../import/head.jsp" %>
        <link rel="stylesheet" href="css/cadastroConta.css">
    </head>
    <body>
    <div class="container" >
        <div class="row">
            <div class="col-lg-offset-4 col-md-offset-3 col-sm-offset-2 col-lg-4 col-md-6 col-sm-8">
                <div class="logo">
                    <img src="imagens/logo.png" alt="Logo">
                    <h1 class="text-center">Gerenciamento de Clientes</h1>
                </div>
                <c:if test="${not empty mensagem}">
                    <div class="alert alert-${tipo}" style="margin-bottom: 1%; margin-top: 2%;">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            ${mensagem}
                    </div>
                </c:if>
                <div class="row">
                    <div class="col-md-12 col-xs-12" id="avisoDiv">
                        <div class="alert alert-danger" style="margin-bottom: 1%; margin-top: 2%;">
                            <a data-dismiss="alert"></a><p id="avisoContent"></p>
                        </div>
                    </div>
                </div>
                <div class="row cadastrobox">
                    <a href="pagina-inicial.html">Voltar</a><br><br>
                    <div class="col-lg-12">
                        <span class="singtext">Cadastrar Conta </span>
                    </div>
                    <form:form id="form" action="cadastrar-conta.html" method="post" commandName="usuario">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <form:input class="form-control" id="nome" name="nome" placeholder="Digite seu nome completo" required="true" path="nomeUsuario"/>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <form:input class="form-control" type="email" id="email" name="email" placeholder="Digite seu E-mail" required="true" path="emailUsuario"/>
                        </div>
                        <div class="col-lg-12  col-md-12 col-sm-12">
                            <form:password class="form-control" id="senha" name="senha" placeholder="Digite sua senha" required="true" path="senhaUsuario"/>
                        </div>
                        <div class="col-lg-12  col-md-12 col-sm-12">
                            <input class="form-control" type="password" id="senhaN" name="senhaN" placeholder="Digite novamente sua senha" required="true"/>
                        </div>
                        <div class="col-lg-12  col-md-12 col-sm-12">
                            <button type="submit" class="btn  submitButton" value="Enviar" name="form">Cadastrar</button>
                        </div>
                    </form:form>

                </div><br><br>
                <footer class="footer">
                    <p>©2017 Company All rights reserved - AlissonTS7 </p>
                </footer>

            </div>
        </div>
    </div>

    <%@ include file="../../import/js.jsp" %>
    <script type="text/javascript" src="js/cadastroConta.js"></script>

    </body>
</html>