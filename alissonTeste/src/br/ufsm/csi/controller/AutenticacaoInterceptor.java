package br.ufsm.csi.controller;

import br.ufsm.csi.model.Usuario;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AutenticacaoInterceptor extends HandlerInterceptorAdapter {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception, IOException {

        Usuario u = (Usuario) request.getSession().getAttribute("us"); // Recupera dados de usuário presentes na sessão

        String uri = request.getRequestURI(); // Url

        if (u != null) { // Se o usuário estiver logado
            if (uri.endsWith("pagina-inicial.html") || // Usuário logado não pode entrar em páginas para usuários deslogados
                    uri.endsWith("cadastro-conta.html") ||
                    uri.endsWith("cadastrar-conta.html") ||
                    uri.endsWith("login-sistema.html")) {
                response.sendRedirect("pagina-principal.html");
                return false;
            } else { // Páginas do gerenciamento de clientes
                return true;
            }
        } else { // Se o usuário não estiver logado ele pode entrar apenas em páginas de cadastro de conta e página inicial da aplicação (formulário de login)
            if (uri.endsWith("pagina-inicial.html") ||
                    uri.endsWith("cadastro-conta.html") ||
                    uri.endsWith("cadastrar-conta.html")||
                    uri.endsWith("login-sistema.html")) {
                return true;
            }else{ // Usuário deslogado não pode entrar em páginas do gerenciamento de clientes
                response.sendRedirect("pagina-inicial.html");
                return false;
            }
        }
    }
}