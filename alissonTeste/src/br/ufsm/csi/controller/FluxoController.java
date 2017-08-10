package br.ufsm.csi.controller;

import br.ufsm.csi.dao.ClienteDAO;
import br.ufsm.csi.model.Cliente;
import br.ufsm.csi.model.Formulario;
import br.ufsm.csi.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Map;

@Controller
public class FluxoController {

    @Autowired
    private ClienteDAO cdao; // Singleton

    @RequestMapping(value="pagina-inicial.html")
    public String paginaInicial(Map<String, Object> model){
        model.put("usuario", new Usuario()); // New Usuário para formulário com spring form
        return "login";
    }

    @RequestMapping(value="cadastro-conta.html")
    public String cadastroConta(Map<String, Object> model){
        model.put("usuario", new Usuario()); // New Usuário para formulário com spring form
        return "cadastroConta";
    }

    @RequestMapping(value="pagina-principal.html")
    @Transactional
    public ModelAndView paginaPrincipal() throws SQLException {
        ModelAndView mv = new ModelAndView("ambienteGerenciamento/paginaPrincipal");

        Collection<Cliente> retorno = cdao.getClientes(); // Lista de todos os clientes cadastrados no sistema

        mv.addObject("clientes", retorno); // Coloca no ModelAndView a lista de clientes cadastrados a serem mostrados na página principal

        return mv;
    }

    @RequestMapping(value="gerenciar-conta.html")
    public String gerenciarConta(Map<String, Object> model, HttpServletRequest request){
        Usuario u = (Usuario) request.getSession().getAttribute("us"); // Recupera dados do usuário presente na sessão
        model.put("usuario", u); // Coloca usuário presente na sessão no formulário de gerenciamento de conta

        return "ambienteGerenciamento/gerenciamentoConta";
    }

    @RequestMapping(value="cadastro-cliente.html")
    public ModelAndView cadastroCliente(Map<String, Object> model){
        ModelAndView mv = new ModelAndView("ambienteGerenciamento/cadastroCliente");
        model.put("cliente", new Cliente()); // New Cliente para formulário com spring form

        Formulario formulario = new Formulario(); // Instancia objeto formulário para setar campos presentes no formulário de cadastro
        formulario.setAtributos(0); // Chama método para setar os campos presentes no formulário (label, type, path)
        if(formulario.getAtributos()!=null && formulario.getAtributos().size()>0){ // Se os atributos do formulário forem setados
            mv.addObject("formulario", formulario.getAtributos()); // Coloca os atributos setados no ModelAndView para a montagem do formulário dinâmico
        }
        return mv;
    }

    @RequestMapping(value="gerenciar-cliente.html")
    @Transactional
    public ModelAndView listaClientes() throws SQLException {
        ModelAndView mv = new ModelAndView("ambienteGerenciamento/gerenciarCliente");

        Collection<Cliente> retorno = cdao.getClientes(); // Lista de todos os clientes cadastrados no sistema

        mv.addObject("clientes", retorno); // Coloca a lista de todos os clientes no ModelAndView para ser mostrado na página web

        return mv;
    }

    @RequestMapping(value="grafico-clientes.html")
    public ModelAndView graficoClientes() throws SQLException {
        ModelAndView mv = new ModelAndView("ambienteGerenciamento/graficoClientes");

        Collection<Cliente> retorno = cdao.getClientes(); // Lista de todos os clientes cadastrados no sistema

        mv.addObject("clientes", retorno);

        return mv;
    }

}
