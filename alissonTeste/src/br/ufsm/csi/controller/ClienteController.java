package br.ufsm.csi.controller;

import br.ufsm.csi.dao.ClienteDAO;
import br.ufsm.csi.model.Cliente;
import br.ufsm.csi.model.Formulario;
import br.ufsm.csi.model.Grafico;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * Created by Alisson on 01/08/2017.
 */
@Controller
public class ClienteController {

    @Autowired
    private ClienteDAO cdao;

    @RequestMapping(value = "cadastrar-cliente.html", method = RequestMethod.POST)
    @Transactional
    public ModelAndView cadastrarCliente(Cliente cliente, String form, Map<String, Object> model) {
        ModelAndView mv = new ModelAndView("ambienteGerenciamento/cadastroCliente");
        model.put("cliente", new Cliente()); // New Cliente para formulário com tag spring (spring forms)

        if (cliente != null && form != null && form.length() > 0) { // Se receber parâmetros provindos do formulário de cadastro de cliente
            try {
                cdao.inserirCliente(cliente); // Inserir cliente com dados informados no formulário de cadastro da página

                mv = new ModelAndView("ambienteGerenciamento/paginaPrincipal");
                mv.addObject("mensagem", "Cliente cadastrado com sucesso!"); // Mensagem de alerta a ser mostrado
                mv.addObject("tipo", "success"); // Tipo de alerta da classe alert do bootstrap

                Collection<Cliente> retorno = cdao.getClientes(); // Lista com todos os clientes cadastrados

                mv.addObject("clientes", retorno); // Coloca lista de clientes no ModelAndView para serem mostrados na página

            } catch (Exception e) {
                mv.addObject("mensagem", "Erro!"); // Mensagem de alerta a ser mostrado
                mv.addObject("tipo", "danger");
            }
        }

        return mv;
    }

    @RequestMapping(value = "cadastrar-cliente.html", method = RequestMethod.GET)
    public String cadastrarCliente(Map<String, Object> model) { // Método cadastrar cliente mapeado para requisições GET, cadastro não é efetuado
        model.put("cliente", new Cliente()); // New Cliente para formulário com tag spring (spring forms)

        return "ambienteGerenciamento/cadastroCliente";
    }

    @RequestMapping(value = "altera-cliente.html", method = RequestMethod.POST)
    @Transactional
    public ModelAndView buscarCliente(Long id, Map<String, Object> model) throws SQLException {
        ModelAndView mv = new ModelAndView("ambienteGerenciamento/gerenciarCliente");

        Collection<Cliente> retorno = cdao.getClientes(); // Lista com todos os clientes cadastrados no sistema

        mv.addObject("clientes", retorno); // Coloca a lista de clientes no ModelAndView para serem mostrados na página

        if (id != null && id > 0) { // Se for passado o ID do cliente a ser alterado
            try {
                Cliente cliente = cdao.getCliente(id); // Busca cliente pelo identificador

                if (cliente != null) { // Se houver cliente com o id informado
                    Formulario formulario = new Formulario(); // Instanciação do formulário para montagem do formulário dinâmico de alteração
                    formulario.setAtributos(1); // Passa 1 para a criação do campo com o ID do cliente a ser alterado

                    if (formulario.getAtributos() != null && formulario.getAtributos().size() > 0) { // Se o formulário for inicializado
                        mv = new ModelAndView("ambienteGerenciamento/alteraCliente");
                        model.put("cliente", cliente); // Coloca o cliente buscado no model para a alteração dos dados do mesmo
                        mv.addObject("formulario", formulario.getAtributos()); // Coloca no ModelAndView os atributos inicializados do formulário dinâmico
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return mv;
    }

    @RequestMapping(value = "altera-cliente.html", method = RequestMethod.GET)
    public String buscarCliente() { // Método para buscar cliente mapeado para requisições GET, busca de cliente não é efetuada
        return "forward:gerenciar-cliente.html";
    }

    @RequestMapping(value = "alterar-cliente.html", method = RequestMethod.POST)
    @Transactional
    public ModelAndView alterarCliente(Cliente cliente, String form) throws SQLException {
        ModelAndView mv = new ModelAndView("ambienteGerenciamento/gerenciarCliente");

        if (cliente != null && form != null && form.length() > 0) { // Se forem passados parâmetros dos dados do cliente a ser alterado
            try {
                Cliente clientePersiste = cdao.getCliente(cliente.getIdCliente()); // Busca cliente pelo ID
                if (clientePersiste != null) { // Se houver cliente com ID passado pelo formulário
                    cdao.alterarCliente(cliente); // Efetuar alteração do cliente com dados passados pelo formulário

                    mv.addObject("mensagem", "Cliente alterado com sucesso!"); // Mensagem de alerta a ser mostrado
                    mv.addObject("tipo", "success");
                }
            } catch (Exception e) { // Exceção
                mv.addObject("mensagem", "Erro ao alterar cliente!"); // Mensagem de alerta a ser mostrado
                mv.addObject("tipo", "danger");
                e.printStackTrace();
            }
        }
        Collection<Cliente> retorno = cdao.getClientes(); // Lista de todos os clientes cadastrados no sistema

        mv.addObject("clientes", retorno); // Coloca a lista de todos os clientes cadastrados no sistema no ModelAndView para retorno

        return mv;
    }

    @RequestMapping(value = "alterar-cliente.html", method = RequestMethod.GET)
    public String alterarCliente() { // Método para alteração de cliente mapeado para requisições GET, alteração não é efetuada
        return "forward:gerenciar-cliente.html";
    }

    @RequestMapping(value = "excluir-cliente.html", method = RequestMethod.POST)
    @Transactional
    public ModelAndView excluirCliente(Long id) throws SQLException {
        ModelAndView mv = new ModelAndView("ambienteGerenciamento/gerenciarCliente");

        if (id != null && id > 0) { // Se houver ID do cliente a ser excluído
            Cliente cliente = cdao.getCliente(id); // Busca cliente pelo ID passado na página
            if (cliente != null) { // Cliente com identificador encontrado
                try {
                    cdao.excluirCliente(cliente); // Efetuar a exclusão do cliente

                    mv.addObject("mensagem", "Cliente excluído com sucesso!"); // Mensagem de alerta a ser mostrado
                    mv.addObject("tipo", "success");
                } catch (Exception e) { // Exceção
                    mv.addObject("mensagem", "Erro ao excluir cliente!"); // Mensagem de alerta a ser mostrado
                    mv.addObject("tipo", "danger");
                    e.printStackTrace();
                }
            }
        }
        Collection<Cliente> retorno = cdao.getClientes(); // Lista de todos os clientes cadastrados no sistema

        mv.addObject("clientes", retorno); // Coloca a lista de todos os clientes cadastrados no sistema no ModelAndView para retorno

        return mv;
    }

    @RequestMapping(value = "excluir-cliente.html", method = RequestMethod.GET)
    public String excluirCliente() { // Método para exclusão de cliente mapeado para requisições GET, exclusão não é efetuada
        return "forward:gerenciar-cliente.html";
    }

    @RequestMapping(value = "visualizar-cliente.html", method = RequestMethod.POST)
    @Transactional
    public ModelAndView visualizarCliente(Long id, Map<String, Object> model) throws SQLException {
        ModelAndView mv = new ModelAndView("ambienteGerenciamento/paginaPrincipal");

        Collection<Cliente> retorno = cdao.getClientes(); // Lista com todos os clientes cadastrados no sistema

        mv.addObject("clientes", retorno); // Coloca a lista de clientes no ModelAndView para serem mostrados na página

        if (id != null && id > 0) { // Se for passado o ID do cliente a ser visualizado
            try {
                Cliente cliente = cdao.getCliente(id); // Busca cliente pelo identificador

                if (cliente != null) { // Se houver cliente com o id informado
                    Formulario formulario = new Formulario(); // Instanciação do formulário para montagem do formulário dinâmico de visualização
                    formulario.setAtributos(0);

                    if (formulario.getAtributos() != null && formulario.getAtributos().size() > 0) { // Se o formulário for inicializado
                        mv = new ModelAndView("ambienteGerenciamento/visualizarCliente");
                        model.put("cliente", cliente); // Coloca o cliente buscado no model para a visualização dos dados do mesmo
                        mv.addObject("formulario", formulario.getAtributos()); // Coloca no ModelAndView os atributos inicializados do formulário dinâmico
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return mv;
    }

    @RequestMapping(value = "visualizar-cliente.html", method = RequestMethod.GET)
    public String visualizarCliente() { // Método para exclusão de cliente mapeado para requisições GET, exclusão não é efetuada
        return "forward:pagina-principal.html";
    }

    @RequestMapping(value = "grafico-mes.html")
    public void graficoMes(HttpServletResponse response) throws SQLException, IOException {
        Collection<Cliente> retorno = cdao.getClientes(); // Lista de todos os clientes cadastrados no sistema

        if (retorno.size() > 0) { // Se possui clientes cadastrados
            int[] meses = new int[13]; // Vetor de contagem da quantidade de clientes do mês de nascimento
            for (int i = 0; i < 13; i++) {
                meses[i] = 0; // Setar todas as opções do vetor de contagem em 0
            }

            for (Cliente cliente : retorno) { // Percorrer lista de clientes cadastrados
                String dataNasc = cliente.getDataNasc();
                String dataSeparada[] = dataNasc.split("-"); // Split do dia, mês e ano da data de nascimento

                String mes = dataSeparada[1]; // Separa o mês da data de nascimento do cliente cadastrado

                meses[Integer.valueOf(mes)]++;

                switch (mes) { // Switch dos meses para entrar no vetor de contagem
                    case "01":
                        meses[0]++;
                        break;
                    case "02":
                        meses[1]++;
                        break;
                    case "03":
                        meses[2]++;
                        break;
                    case "04":
                        meses[3]++;
                        break;
                    case "05":
                        meses[4]++;
                        break;
                    case "06":
                        meses[5]++;
                        break;
                    case "07":
                        meses[6]++;
                        break;
                    case "08":
                        meses[7]++;
                        break;
                    case "09":
                        meses[8]++;
                        break;
                    case "10":
                        meses[9]++;
                        break;
                    case "11":
                        meses[10]++;
                        break;
                    case "12":
                        meses[11]++;
                        break;
                    default:
                        meses[12]++;
                }
            }

            // Lista para a adição dos meses e da quantidade de clientes que nasceram em cada mês
            ArrayList<Grafico> dados = new ArrayList<Grafico>();


            // Adição dos meses do ano e a quantidade de clientes que nasceram em cada mês na lista de dados
            dados.add(new Grafico("Janeiro", meses[0]));
            dados.add(new Grafico("Fevereiro", meses[1]));
            dados.add(new Grafico("Março", meses[2]));
            dados.add(new Grafico("Abril", meses[3]));
            dados.add(new Grafico("Maio", meses[4]));
            dados.add(new Grafico("Junho", meses[5]));
            dados.add(new Grafico("Julho", meses[6]));
            dados.add(new Grafico("Agosto", meses[7]));
            dados.add(new Grafico("Setembro", meses[8]));
            dados.add(new Grafico("Outubro", meses[9]));
            dados.add(new Grafico("Novembro", meses[10]));
            dados.add(new Grafico("Dezembro", meses[11]));
            dados.add(new Grafico("Indefinido", meses[12]));

            Gson gson = new Gson();
            String jsonString = gson.toJson(dados); // Transforma lista de dados para o gráfico em uma String Json
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.println(gson.toJson(jsonString)); // Print do Json
        }
    }
}
