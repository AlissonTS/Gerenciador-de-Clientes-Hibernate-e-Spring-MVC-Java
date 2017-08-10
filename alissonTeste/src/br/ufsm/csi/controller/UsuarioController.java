package br.ufsm.csi.controller;

import br.ufsm.csi.dao.ClienteDAO;
import br.ufsm.csi.dao.UsuarioDAO;
import br.ufsm.csi.model.Cliente;
import br.ufsm.csi.model.Usuario;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.security.MessageDigest;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Map;

@Controller
public class UsuarioController {

    @Autowired
    private UsuarioDAO dao; // Singleton

    @Autowired
    private ClienteDAO cdao; // Singleton

    @RequestMapping(value="logout-sistema.html")
    public String logoutSistema(HttpServletRequest request, Map<String, Object> model){
        model.put("usuario", new Usuario()); // Seta new Usuario no formulário com spring form
        request.getSession().invalidate(); // Invalida a sessão para efetuação do logout
        return "login";
    }

    @RequestMapping(value="login-sistema.html", method = RequestMethod.POST)
    @Transactional
    public ModelAndView loginSistema(Usuario us, String form, HttpServletRequest request, Map<String, Object> model) throws SQLException {
        ModelAndView mv = new ModelAndView("login");
        model.put("usuario", new Usuario()); // Seta new Usuario no formulário com spring form para caso o logar esteja inválido

        if(us!=null && form!=null && form.length()>0){ // Se recebe parâmetros do formulário de login
            try{
                Usuario u = dao.getUsuario(us.getEmailUsuario()); // Busca usuário (único) a partir do email informado no formulário de login

                if(u!=null){ // Se houve retorno a partir do email informado

                    // Criptografia da senha
                    byte[] senhaByte = us.getSenhaUsuario().getBytes();

                    MessageDigest md = MessageDigest.getInstance("SHA-256");
                    byte[] hashSenha = md.digest(senhaByte);

                    byte[] hashSenhaBase = Base64.encodeBase64(hashSenha);
                    String valorSenha = new String(hashSenhaBase, "ISO-8859-1");

                    if(valorSenha.equals(u.getSenhaUsuario())){ // Compara senha informada no formulário de login criptografada com senha salva no banco de dados, caso sejam iguais
                        request.getSession().invalidate(); // Invalida a sessão
                        request.getSession().setAttribute("us", u); // Seta usuário na sessão
                        mv = new ModelAndView("ambienteGerenciamento/paginaPrincipal");

                        Collection<Cliente> retorno = cdao.getClientes(); // Busca e cria uma lista de todos os clientes cadastrados no sistema

                        mv.addObject("clientes", retorno); // Coloca a lista de clientes no ModelAndView para serem mostrados na página

                    }else{ // Se a senha informada e a senha salva no banco de dados forem diferentes
                        mv.addObject("mensagem", "Usuário ou senha inválido!"); // Mensagem de alerta a ser mostrado
                        mv.addObject("tipo", "danger"); // Tipo do alerta na classe alert do bootstrap
                    }
                }else{ // Se o email informado no formulário de login não for encontrado no banco de dados
                    mv.addObject("mensagem", "Usuário ou senha inválido!"); // Mensagem de alerta a ser mostrado
                    mv.addObject("tipo", "danger"); // Tipo de alerta na classe alert do bootstrap
                }
            }catch(Exception e){ // Excessão
                mv.addObject("mensagem", "Usuário ou senha inválido!"); // Mensagem de alerta a ser mostrado
                mv.addObject("tipo", "danger"); // Tipo de alerta na classe alert do bootstrap
            }
        }
        return mv;
    }

    @RequestMapping(value="login-sistema", method = RequestMethod.GET)
    public String loginSistema(Map<String, Object> model){ // Método de login mapeado para requisições GET, login não é feito
        model.put("usuario", new Usuario()); // Seta new Usuario no formulário com spring form
        return "login";
    }

    @RequestMapping(value="cadastrar-conta.html", method = RequestMethod.POST)
    public ModelAndView cadastrarConta(Usuario us, String form, Map<String, Object> model){
        ModelAndView mv = new ModelAndView("cadastroConta");
        model.put("usuario", new Usuario()); // Seta new Usuario no formulário com spring form

        if(us!=null && form!=null && form.length()>0){ // Se recebe parâmetros  provindos do formulário de cadastro de conta de usuário
            try{

                // Criptografia da senha informada no formulário de cadastro
                byte[] senhaByte = us.getSenhaUsuario().getBytes();

                MessageDigest md = MessageDigest.getInstance("SHA-256");
                byte[] hashSenha = md.digest(senhaByte);

                byte[] hashSenhaBase = Base64.encodeBase64(hashSenha);
                String valorSenha = new String(hashSenhaBase, "ISO-8859-1");
                us.setSenhaUsuario(valorSenha); // Seta senha criptografada no objeto usuário

                dao.inserirUsuario(us); // Inserir usuário no banco de dados

                mv = new ModelAndView("login");
                mv.addObject("mensagem", "Conta cadastrada com sucesso"); // Mensagem de alerta a ser mostrado
                mv.addObject("tipo", "success"); // Tipo de alerta na classe alert do bootstrap
            }catch (Exception e){
                mv.addObject("mensagem", "Email já cadastrado no sistema!"); // Mensagem de alerta a ser mostrado
                mv.addObject("tipo", "danger");
            }
        }
        return mv;
    }

    @RequestMapping(value="cadastrar-conta.html", method = RequestMethod.GET)
    public String cadastrarConta(Map<String, Object> model){ // Método de cadastro de conta mapeado para requisições GET, cadastro não é efetuado
        model.put("usuario", new Usuario()); // Seta new Usuario no formulário com spring form
        return "cadastroConta";
    }

    @RequestMapping(value="alterar-conta.html", method = RequestMethod.POST)
    @Transactional
    public ModelAndView alterarConta(Usuario us, String redefinir, HttpServletRequest request, Map<String, Object> model) throws Exception {
        ModelAndView mv = new ModelAndView("ambienteGerenciamento/gerenciamentoConta");
        Usuario u = (Usuario) request.getSession().getAttribute("us"); // Recupera dados presentes na sessão do usuário logado no sistema

        if(us!=null && redefinir!=null && redefinir.length()>0){ // Se receber parâmetros no formulário de alteração de conta
            try{
                u.setNomeUsuario(us.getNomeUsuario()); // Seta nome informado no formulário
                if(redefinir.equals("Sim")){ // Se o usuário selecionou redefinição de senha
                    // Criptografia da senha informada
                    String senha = request.getParameter("senha");
                    byte[] senhaByte = senha.getBytes();
                    MessageDigest md = MessageDigest.getInstance("SHA-256");
                    byte[] hashSenha = md.digest(senhaByte);
                    byte[] hashSenhaBase = Base64.encodeBase64(hashSenha);
                    String valorSenha = new String(hashSenhaBase, "ISO-8859-1");

                    u.setSenhaUsuario(valorSenha); // Seta nova senha informada no formulário de alteração de conta do usuário
                }

                boolean retorno = dao.alterarUsuario(u); // Alterar usuário no banco de dados
                if(retorno){ // Se a alteração de dados do usuário for bem suscedida
                    request.getSession().invalidate(); // Invalida sessão anterior
                    request.getSession().setAttribute("us", u); // Atualiza informações do usuário logado com as informações novas alteradas a partir do formulário

                    mv.addObject("mensagem", "Conta alterada com sucesso!"); // Mensagem de alerta a ser mostrado
                    mv.addObject("tipo", "success");
                }else{ // Se a alteração não acontecer
                    mv.addObject("mensagem", "Email já cadastrado no sistema!"); // Mensagem de alerta a ser mostrado
                    mv.addObject("tipo", "danger");
                }

            }catch(Exception e){
                mv.addObject("mensagem", "Erro!"); // Mensagem de alerta a ser mostrado
                mv.addObject("tipo", "danger");
            }
        }
        u = (Usuario) request.getSession().getAttribute("us"); // Recupera dados presentes na sessão do usuário logado no sistema
        model.put("usuario", u); // Seta dados do usuário no formulário com spring forms

        return mv;
    }

    @RequestMapping(value="alterar-conta.html", method = RequestMethod.GET)
    public String alterarConta(){ // Método para alteração de conta mapeado para requisições GET, alteração de conta de usuário não é efetuada
        return "forward:gerenciar-conta.html";
    }
}
