package br.ufsm.csi.dao;

import br.ufsm.csi.model.Cliente;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.Collection;

@Repository
public class ClienteDAO {

    @Autowired
    private SessionFactory sessionFactory; // Singleton

    @Transactional
    public void inserirCliente(Cliente cliente)throws Exception{ // Método para inserção de cliente cadastrado
        Session session = sessionFactory.getCurrentSession();
        session.save(cliente); // Inserção do cliente
    }

    @Transactional
    public Collection<Cliente> getClientes() throws SQLException { // Método para buscar todos os clientes cadastrados no sistema
        Session session = sessionFactory.getCurrentSession();
        Criteria crit = session.createCriteria(Cliente.class); // Instancia criteria
        crit.addOrder(Order.asc("nomeCliente")); // Ordenação de acordo com o nome do cliente em ordem crescente
        return crit.list(); // Retorna lista de clientes cadastrados
    }

    @Transactional
    public Cliente getCliente(Long id) throws SQLException { // Método para buscar um cliente de acordo com um id identificador
        Session session = sessionFactory.getCurrentSession();
        return session.get(Cliente.class, id); //  Retorna cliente
    }

    @Transactional
    public void alterarCliente(Cliente cliente) throws Exception{ // Método para alterar cliente do sistema
        Session session = sessionFactory.getCurrentSession();
        session.merge(cliente); // Merge do cliente com dados do formulário de alteração do cliente, alterando informações no banco de dados
    }

    @Transactional
    public void excluirCliente(Cliente cliente) throws Exception{ // Método para exclusão do cliente cadastrado no sistema
        Session session = sessionFactory.getCurrentSession();
        session.delete(cliente); // Deletar cliente
    }
}